#![no_std]
#![crate_type="staticlib"]
#![feature(asm, panic_handler)]
#![feature(lang_items)]


mod reg;

#[no_mangle]
pub extern fn rust_main()
{
    unsafe { *(reg::UART_BASE as *mut u32) = 'H' as u32; };
    unsafe { *(reg::UART_BASE as *mut u32) = 'e' as u32; };
    unsafe { *(reg::UART_BASE as *mut u32) = 'l' as u32; };
    unsafe { *(reg::UART_BASE as *mut u32) = 'l' as u32; };
    unsafe { *(reg::UART_BASE as *mut u32) = 'o' as u32; };
    unsafe { *(reg::UART_BASE as *mut u32) = ',' as u32; };
    unsafe { *(reg::UART_BASE as *mut u32) = 'w' as u32; };
    unsafe { *(reg::UART_BASE as *mut u32) = 'o' as u32; };
    unsafe { *(reg::UART_BASE as *mut u32) = 'r' as u32; };
    unsafe { *(reg::UART_BASE as *mut u32) = 'l' as u32; };
    unsafe { *(reg::UART_BASE as *mut u32) = 'd' as u32; };
    unsafe { *(reg::UART_BASE as *mut u32) = '!' as u32; };
}

#[lang = "eh_personality"] extern fn eh_personality() {}
use core::panic::PanicInfo;
#[panic_handler]
// #[no_mangle]
pub extern fn panic_fmt(_info: &PanicInfo) -> ! {loop{}}