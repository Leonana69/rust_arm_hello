
hello.elf:     file format elf64-littleaarch64


Disassembly of section .text:

0000000040000000 <defaultResetHandler-0x8>:
    40000000:	00000000 	.word	0x00000000
    40000004:	40000008 	.word	0x40000008

0000000040000008 <defaultResetHandler>:
    40000008:	94000003 	bl	40000014 <rust_main>

000000004000000c <defaultExceptionHandler>:
    4000000c:	d503207f 	wfi
    40000010:	17ffffff 	b	4000000c <defaultExceptionHandler>

Disassembly of section .text.rust_main:

0000000040000014 <rust_main>:
// 	// println!("{:?}", x);
// 	unsafe { *(reg::UART_BASE as *mut u32) = x as u32};
// }

#[no_mangle]
pub extern fn rust_main()
    40000014:	d10083ff 	sub	sp, sp, #0x20
{
    let txt = "Hworld!";
    40000018:	90000008 	adrp	x8, 40000000 <defaultResetHandler-0x8>
    4000001c:	91015108 	add	x8, x8, #0x54
    40000020:	f90007e8 	str	x8, [sp,#8]
    40000024:	32000be9 	orr	w9, wzr, #0x7
    40000028:	2a0903e8 	mov	w8, w9
    4000002c:	f9000be8 	str	x8, [sp,#16]
    40000030:	52a12009 	mov	w9, #0x9000000             	// #150994944
    40000034:	2a0903e8 	mov	w8, w9
    // for i in txt.chars()
    // {
    // 	// puts(i);
    // }
    // unsafe { *(reg::UART_BASE as *mut u64) = 'g' as u64; };
    let addr = 0x09000000 as u64;
    40000038:	f9000fe8 	str	x8, [sp,#24]
    unsafe { *(addr as *mut u64) = 'g' as u64; };
    4000003c:	f9400fe8 	ldr	x8, [sp,#24]
    40000040:	52800ce9 	mov	w9, #0x67                  	// #103
    40000044:	2a0903ea 	mov	w10, w9
    40000048:	f900010a 	str	x10, [x8]
    
}
    4000004c:	910083ff 	add	sp, sp, #0x20
    40000050:	d65f03c0 	ret
