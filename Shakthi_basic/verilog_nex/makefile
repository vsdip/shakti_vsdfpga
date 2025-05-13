TOP         = mkeclass_axi4
DEVICE      = up5k
PACKAGE     = sg48
FREQ        = 10
PCF         = $(TOP).pcf
JSON        = $(TOP).json
ASC         = top.asc
BIN         = top.bin
BAUDS       = 9600
PICO_DEVICE = /dev/ttyUSB0   # Change if your serial port differs

# Default target
all: build

# Synthesis using Yosys
$(JSON): $(TOP).v *.v
	yosys -p "read_verilog -lib +/ice40/cells_sim.v; \
	          read_verilog *.v; \
	          hierarchy -top $(TOP); \
	          synth_ice40 -top $(TOP) -json $(JSON); \
	          stat"

# Place & Route using nextpnr
$(ASC): $(JSON) $(PCF)
	nextpnr-ice40 --$(DEVICE) --package $(PACKAGE) \
	              --json $(JSON) \
	              --pcf $(PCF) \
	              --asc $(ASC) \
	              --freq $(FREQ) \
	              --opt-timing --timing-allow-fail

# Bitstream generation
$(BIN): $(ASC)
	icepack $(ASC) $(BIN)

# Build shortcut
build: $(BIN)

# Flash to board
flash: $(BIN)
	iceprog $(BIN)

# Open UART terminal
terminal:
	sudo picocom -b $(BAUDS) $(PICO_DEVICE) --imap lfcrlf,crcrlf --omap delbs,crlf

# Git pull + build + flash in one go
cycle:
	git pull
	make build
	sudo make flash

clean:
	rm -f $(JSON) $(ASC) $(BIN)

.PHONY: all build flash terminal cycle clean
