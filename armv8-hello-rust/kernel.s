
kernel.elf:     file format elf64-littleaarch64


Disassembly of section .text:

0000000040010000 <_start>:
    40010000:	580001c4 	ldr	x4, 40010038 <other_cpu+0x8>
    40010004:	52800205 	mov	w5, #0x10                  	// #16
    40010008:	b9002485 	str	w5, [x4,#36]
    4001000c:	52986005 	mov	w5, #0xc300                	// #49920
    40010010:	320000a5 	orr	w5, w5, #0x1
    40010014:	b9003085 	str	w5, [x4,#48]
    40010018:	d53800a0 	mrs	x0, mpidr_el1
    4001001c:	f2400c1f 	tst	x0, #0xf
    40010020:	54000081 	b.ne	40010030 <other_cpu>

0000000040010024 <boot_cpu>:
    40010024:	90087f80 	adrp	x0, 51000000 <STACKTOP>
    40010028:	9100001f 	mov	sp, x0
    4001002c:	14000015 	b	40010080 <main>

0000000040010030 <other_cpu>:
    40010030:	14000000 	b	40010030 <other_cpu>
    40010034:	00000000 	.word	0x00000000
    40010038:	09000000 	.word	0x09000000
    4001003c:	00000000 	.word	0x00000000

0000000040010040 <puts>:
#include "reg.h"

int puts(const char *str)
{
    40010040:	d10043ff 	sub	sp, sp, #0x10
    40010044:	f90007e0 	str	x0, [sp,#8]
	while (*str)
    40010048:	14000007 	b	40010064 <puts+0x24>
		*((unsigned int *) UART_BASE) = *str++;
    4001004c:	d2a12001 	mov	x1, #0x9000000             	// #150994944
    40010050:	f94007e0 	ldr	x0, [sp,#8]
    40010054:	91000402 	add	x2, x0, #0x1
    40010058:	f90007e2 	str	x2, [sp,#8]
    4001005c:	39400000 	ldrb	w0, [x0]
    40010060:	b9000020 	str	w0, [x1]
#include "reg.h"

int puts(const char *str)
{
	while (*str)
    40010064:	f94007e0 	ldr	x0, [sp,#8]
    40010068:	39400000 	ldrb	w0, [x0]
    4001006c:	7100001f 	cmp	w0, #0x0
    40010070:	54fffee1 	b.ne	4001004c <puts+0xc>
		*((unsigned int *) UART_BASE) = *str++;
	return 0;
    40010074:	52800000 	mov	w0, #0x0                   	// #0
}
    40010078:	910043ff 	add	sp, sp, #0x10
    4001007c:	d65f03c0 	ret

0000000040010080 <main>:

void main(void)
{
    40010080:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
    40010084:	910003fd 	mov	x29, sp
	puts("Hello\n");
    40010088:	90000000 	adrp	x0, 40010000 <_start>
    4001008c:	91026000 	add	x0, x0, #0x98
    40010090:	97ffffec 	bl	40010040 <puts>
	while (1);
    40010094:	14000000 	b	40010094 <main+0x14>
