use std::env;
use std::fs;
use std::path::Path;

fn main() {
    let out_dir = env::var_os("OUT_DIR").unwrap();
    let dest_path = Path::new(&out_dir).join("hashes.rs");
    
    let hashes_path = ".state/hashes.json";
    
    let mut map_content = String::from("::std::collections::HashMap::from([\n");
    
    if Path::new(hashes_path).exists() {
        if let Ok(content) = fs::read_to_string(hashes_path) {
            let hashes: std::collections::HashMap<String, String> = 
                serde_json::from_str(&content).unwrap_or_default();
                
            for (k, v) in hashes {
                map_content.push_str(&format!("    (\"{}\", \"{}\"),\n", k, v));
            }
        }
    }
    map_content.push_str("])");
    
    let code = format!(
        "pub fn get_hashes() -> ::std::collections::HashMap<&'static str, &'static str> {{\n    {}\n}}\n",
        map_content
    );
    
    fs::write(&dest_path, code).unwrap();
    println!("cargo:rerun-if-changed=.state/hashes.json");
}
