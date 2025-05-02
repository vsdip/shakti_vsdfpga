RISCV_PREFIX = riscv32-unknown-elf

all: boot.hex

boot.elf: main.c linker.ld
	$(RISCV_PREFIX)-gcc -Os -ffreestanding -nostdlib -o boot.elf main.c -T linker.ld

boot.hex: boot.elf
	$(RISCV_PREFIX)-objcopy -O verilog --only-section .text boot.elf boot.hex

clean:
	rm -f boot.elf boot.hex
