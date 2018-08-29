#![no_std]
#![crate_type="staticlib"]
#![feature(asm, panic_handler)]
#![feature(lang_items)]


mod reg;

// #[no_mangle]
// pub fn puts(x: char)
// {
// 	// println!("{:?}", x);
// 	unsafe { *(reg::UART_BASE as *mut u32) = x as u32};
// }

#[no_mangle]
pub extern fn rust_main()
{
    let txt = "Hworld!";
    // for i in txt.chars()
    // {
    // 	// puts(i);
    // }
    // unsafe { *(reg::UART_BASE as *mut u64) = 'g' as u64; };
    let addr = 0x09000000 as u64;
    unsafe { *(addr as *mut u64) = 'g' as u64; };
    
}


#[lang = "eh_personality"] extern fn eh_personality() {}
use core::panic::PanicInfo;
#[panic_handler]
// #[no_mangle]
pub extern fn panic_fmt(_info: &PanicInfo) -> ! {loop{}}