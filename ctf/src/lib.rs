pub const FLAG_REGEX: &str = r"flag\([a-zA-Z0-9$\-]+_[a-f0-9]{6}\)";
pub const MASTER_FLAG_DESC: &str = "m4st3r-c0mpl3t10n";

pub struct Challenge {
    pub id: &'static str,
    pub desc: &'static str,
}

pub const CHALLENGES: &[Challenge] = &[
    Challenge { id: "hidden", desc: "h1dd3n-f1l3$" },
    Challenge { id: "cat", desc: "r34d-th3-d0c$" },
    Challenge { id: "find", desc: "f1nd-y0ur-w4y" },
    Challenge { id: "grep", desc: "gr3p-th3-l0g$" },
    Challenge { id: "symlink", desc: "f0ll0w-th3-l1nk" },
    Challenge { id: "chmod", desc: "p3rm1$$10n-d3n13d" },
    Challenge { id: "strings", desc: "str1ng$-4tt4ch3d" },
    Challenge { id: "base64", desc: "d3c0d3-m3-pl34s3" },
    Challenge { id: "proc", desc: "pr0c3$$-hunt3r" },
    Challenge { id: "env", desc: "3nv-v4r1abl3$" },
    Challenge { id: "awk", desc: "p4rs3-th3-d4t4" },
    Challenge { id: "alias", desc: "4l14$-h1dd3n" },
    Challenge { id: "suid", desc: "su1d-3sc4l4t10n" },
    Challenge { id: "cron", desc: "cr0n-j0b-s3cr3t" },
];
