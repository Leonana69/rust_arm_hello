MEMORY
{
  FLASH (rx) : ORIGIN = 0x40000000, LENGTH = 128K
}

SECTIONS
{
	. = 0x40000000;
	.text :
	{
	KEEP(*(isr_vector))
	  *(.text)
	} > FLASH
}
