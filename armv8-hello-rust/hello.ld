MEMORY
{
  FLASH (rx) : ORIGIN = 0x40000000, LENGTH = 128K
}
STACKTOP = 0x50000000;
SECTIONS
{
	. = 0x40000000;
	.text :
	{
	*(.text)
	KEEP(*(isr_vector))  
	} > FLASH
	. = STACKTOP;
	stacktop = .;
}
