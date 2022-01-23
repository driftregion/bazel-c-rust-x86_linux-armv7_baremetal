extern "C" {
    fn squared(n:u32) -> u32;
    fn whoami() -> *const u8;
} 

#[cfg(feature = "host_x86_64")]
pub fn host() -> &'static str {
    "linux on x86_64 "
}

#[cfg(feature = "host_cm3_qemu")]
pub fn host() -> &'static str {
    "baremetal ARM Cortex M3 on QEMU"
}

fn main() {
    println!("Hello from rust compiled for {}!", host());

    print!("A ");
    unsafe {
        let str_ptr = whoami();
        let mut n = 0;
        loop {
            let c = *str_ptr.offset(n) as char;
            if '\0' == c {
                break;
            }
            print!("{}", c);
            n+=1;
        }
    }

    let i = 4;
    println!(" calculated squared({}) = {}\n", i, unsafe { squared(i) } );
}