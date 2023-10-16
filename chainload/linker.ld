LOAD_ADDR = 0x400000;
LINK_ADDR = 0x400000;
VIRT_TO_PHYS = LINK_ADDR - LOAD_ADDR;

ENTRY(_start)
SECTIONS
{
	. = LINK_ADDR;

	kernel_start = .;
	kernel_phys_start = . - VIRT_TO_PHYS;

	.text : AT(ADDR(.text) - VIRT_TO_PHYS)
	{
		*(.text)
	}
	.rodata ALIGN(4096) : AT(ADDR(.rodata) - VIRT_TO_PHYS)
	{
		*(.rodata)
	}
	.data ALIGN(4096) : AT(ADDR(.data) - VIRT_TO_PHYS)
	{
		/* Um klar zwischen Bereichen unterscheiden zu koennen, die
		   schreibbar sein muessen, und nur lesbaren, wird davon
		   ausgegangen, dass alle vor diesem Label nur lesbar sind. */
		kernel_rw_start = .;
		*(.data)
	}
	.bss ALIGN(4096) : AT(ADDR(.bss) - VIRT_TO_PHYS)
	{
		*(.bss)
	}

    .gdt_section ALIGN(4096) : AT(ADDR(.gdt_section) - VIRT_TO_PHYS)
    {
        *(.gdt_section)
    }
    .idt_section ALIGN(4096) : AT(ADDR(.idt_section) - VIRT_TO_PHYS)
    {
        *(.idt_section)
    }

	. = ALIGN(4096);

	kernel_end = .;
	kernel_phys_end = . - VIRT_TO_PHYS;

	kernel_size = kernel_end - kernel_start;
}

