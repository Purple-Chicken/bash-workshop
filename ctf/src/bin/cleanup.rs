use std::fs;
use std::process::Command;

fn main() {
    if unsafe { libc::geteuid() } != 0 {
        eprintln!("Error: cleanup must be run as root (sudo)!");
        std::process::exit(1);
    }

    // Terminate detached processes
    if let Ok(pid_str) = fs::read_to_string(".state/proc.pid") {
        if let Ok(pid) = pid_str.trim().parse::<i32>() {
            let _ = Command::new("kill").arg("-9").arg(pid.to_string()).status();
        }
    }

    // Cleanup filesystem artifacts
    let _ = fs::remove_file("/etc/cron.d/ctf_workshop");
    let _ = fs::remove_file(".ctf_env");
    let _ = fs::remove_file("src/assets/obfuscated_flag.sh");
    let _ = fs::remove_dir_all("challenges");
    let _ = fs::remove_dir_all(".state");

    println!("Cleanup complete! Remember to clean your terminal environment manually:");
    println!("  $ unalias audit");
    println!("  $ unset CTF_SECRET");
}
