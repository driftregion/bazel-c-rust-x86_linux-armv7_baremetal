#![no_std]

use core::panic::PanicInfo;
use core::sync::atomic::{self, Ordering};

#[inline(never)]
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {
        atomic::compiler_fence(Ordering::SeqCst);
    }
}


#[no_mangle]
pub extern "C" fn squared(n:u32) -> u32 {
    n * n
}

#[no_mangle]
pub extern "C" fn whoami() -> *const u8 {
    "rust library\0".as_ptr()
}
