.PHONY: clean
# CROSS_COMPILE ?= arm-none-eabi-
CROSS_COMPILE ?= aarch64-linux-gnu-


CC := $(CROSS_COMPILE)gcc
LD := $(CROSS_COMPILE)ld

# rust_target = thumbv7em-none-eabi
rust_target = aarch64-unknown-linux-gnu
rust_os := ./target/$(rust_target)/debug/libhello.a
linker_script = hello.ld
assembly_object_files = startup.o

TARGET = hello.elf

all: $(TARGET)

$(TARGET): cargo $(rust_os) $(assembly_object_files) $(LINKER_SCRIPT)
	$(LD) -n --gc-sections -T $(linker_script) -o $@ $(assembly_object_files) $(rust_os)
	$(CROSS_COMPILE)objcopy -Obinary hello.elf hello.bin
	$(CROSS_COMPILE)objdump -S hello.elf > hello.list

cargo:
	cargo build --target=$(rust_target)

%.o: %.S
	$(CC) -c $^ -o $@

qemu: $(TARGET)
	@qemu-system-aarch64 -M ? | grep virt >/dev/null || exit
	@echo "Press Ctrl-A and then X to exit QEMU"
	@echo
	qemu-system-aarch64	-M virt -cpu cortex-a57	\
						-smp 4 -m 4096 \
						-nographic -serial tcp:localhost:12345 \
						-s -S \
						-kernel hello.elf

clean:
	rm -f *.o *.bin *.elf *.list DAC* -r target
