use bash_workshop_ctf::*;
use sha2::{Sha256, Digest};
use std::fs;
use std::os::unix::fs::PermissionsExt;
use std::process::Command;
use std::collections::HashMap;

fn main() {
    if unsafe { libc::geteuid() } != 0 {
        eprintln!("Error: setup must be run as root (sudo)!");
        std::process::exit(1);
    }

    let machine_id = fs::read_to_string("/etc/machine-id").unwrap_or_else(|_| "default123".to_string());
    let timestamp = std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_secs();
    
    let mut hasher = Sha256::new();
    hasher.update(format!("{}{}", timestamp, machine_id));
    let suffix = &hex::encode(hasher.finalize())[0..6];

    fs::create_dir_all("challenges/logs/deep/nested").unwrap();
    fs::create_dir_all("challenges/bin").unwrap();
    fs::create_dir_all(".state").unwrap();

    let mut hashes = HashMap::new();

    for c in CHALLENGES {
        let full_flag = format!("flag({}_{})", c.desc, suffix);
        
        let mut f_hasher = Sha256::new();
        f_hasher.update(&full_flag);
        hashes.insert(c.id.to_string(), hex::encode(f_hasher.finalize()));

        match c.id {
            "hidden" => fs::write("challenges/.hidden_credentials.txt", &full_flag).unwrap(),
            "cat" => fs::write("challenges/readme.txt", &full_flag).unwrap(),
            "find" => fs::write("challenges/logs/deep/nested/secret.log", &full_flag).unwrap(),
            "grep" => {
                let mut content = String::new();
                for i in 0..500 {
                    if i == 347 { content.push_str(&format!("{}\n", full_flag)); } 
                    else { content.push_str("2026-07-16 - INFO - Normal log entry\n"); }
                }
                fs::write("challenges/access.log", content).unwrap();
            },
            "symlink" => {
                fs::write("challenges/.link_target.txt", &full_flag).unwrap();
                std::os::unix::fs::symlink(".link_target.txt", "challenges/shortcut").unwrap_or(());
            },
            "chmod" => {
                let path = "challenges/broken_binary";
                fs::write(path, format!("#!/bin/bash\necho '{}'\n", full_flag)).unwrap();
                let mut perms = fs::metadata(path).unwrap().permissions();
                perms.set_mode(0o644); // Missing execution bit
                fs::set_permissions(path, perms).unwrap();
            },
            "strings" => {
                let mut content = b"MZ\x90\x00\x03\x00\xFF\xFF\x00\x00".to_vec();
                content.extend_from_slice(full_flag.as_bytes());
                content.extend_from_slice(b"\x00\x00\x00");
                fs::write("challenges/suspicious.bin", content).unwrap();
            },
            "base64" => {
                use base64::{Engine as _, engine::general_purpose};
                let encoded = general_purpose::STANDARD.encode(&full_flag);
                fs::write("challenges/encoded.txt", encoded).unwrap();
            },
            "proc" => {
                let child = Command::new("bash")
                    .arg("src/assets/malware.sh")
                    .arg(&full_flag)
                    .spawn()
                    .expect("Failed to start malware process");
                fs::write(".state/proc.pid", child.id().to_string()).unwrap();
            },
            "env" => {
                let env_content = format!(
                    "export CTF_SECRET='{}'\nalias audit='bash src/assets/obfuscated_flag.sh'\n", 
                    full_flag
                );
                fs::write(".ctf_env", env_content).unwrap();
            },
            "awk" => {
                fs::write("challenges/data.csv", format!("id,name,role,secret\n1,admin,sysadmin,{}\n", full_flag)).unwrap();
            },
            "alias" => {
                let path = "src/assets/obfuscated_flag.sh";
                fs::write(path, format!("#!/bin/bash\necho '{}'\n", full_flag)).unwrap();
            },
            "suid" => {
                let path = "challenges/bin/escalate";
                fs::write(path, format!("#!/bin/bash\necho '{}'\n", full_flag)).unwrap();
                let mut perms = fs::metadata(path).unwrap().permissions();
                perms.set_mode(0o4755); // SUID set
                fs::set_permissions(path, perms).unwrap();
            },
            "cron" => {
                let cron_job = format!("* * * * * root echo 'CTF' # {}\n", full_flag);
                fs::write("/etc/cron.d/ctf_workshop", cron_job).unwrap();
            }
            _ => {}
        }
    }

    let master_flag = format!("flag({}_{})", MASTER_FLAG_DESC, suffix);
    let mut m_hasher = Sha256::new();
    m_hasher.update(&master_flag);
    hashes.insert("master".to_string(), hex::encode(m_hasher.finalize()));

    let hash_json = serde_json::to_string(&hashes).unwrap();
    fs::write(".state/hashes.json", hash_json).unwrap();

    println!("Compiling verify.rs with embedded verification hashes...");
    Command::new("cargo")
        .args(["build", "--release", "--bin", "verify"])
        .status()
        .unwrap();

    fs::remove_file(".state/hashes.json").unwrap();
    
    println!("--- Setup Complete! ---");
    println!("Please source the environment variables to finish setup:");
    println!("  $ source .ctf_env");
}
