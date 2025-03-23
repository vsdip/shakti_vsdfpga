# shakti_vsdfpga

Repo for shakti files
![image](https://github.com/user-attachments/assets/17d5aa33-fef9-4f01-aa01-206d655aa4ec)

# Shakti SoC Details:
Here’s the updated **GitHub `README.md`** with the **I/O Signals Table** added to the **Table of Contents**:

---

# System-on-Chip (SoC) Components Summary

This document provides a high-level overview of the components in the System-on-Chip (SoC) described in the Verilog code.

---

## Table of Contents
1. [Overview](#overview)
2. [System Components](#system-components)
3. [Design Style Explanation](#design-style-explanation)
4. [I/O Signals of `mkSoc`](#io-signals-of-mksoc)
5. [Notes](#notes)

---

## Overview
This SoC is designed for embedded systems and includes a CPU core, memory interfaces, a UART for serial communication, and an interrupt controller. It uses the AXI4-Lite protocol for communication between components.

---

## System Components

| **Component Name**                   | **Type**                     | **Function**                                                                 |
|--------------------------------------|------------------------------|------------------------------------------------------------------------------|
| **`eclass`**                         | CPU Core                     | Executes instructions, interfaces with memory/peripherals via AXI4-Lite.    |
| **`clint`** (CLINT)                  | Timer/Interrupt Controller   | Manages machine-mode timers (`mtime`, `mtimecmp`) and interrupts (MTIP/MSIP). |
| **`uart_user_ifc`**                  | UART (Serial Port)           | Handles serial communication (TX/RX), including FIFOs for data buffering.   |
| **`fabric`** (Interconnect)          | AXI4-Lite Crossbar           | Routes read/write requests between CPU, memory, and peripherals.            |
| **`main_mem_master`**                | Memory Interface             | Connects to main system memory (RAM).                                       |
| **`boot_mem_master`**                | Memory Interface             | Connects to boot memory (ROM/flash).                                        |
| **`err_slave`**                      | Error Handler                | Catches invalid memory accesses (for debugging).                            |
| **`signature`**                      | Simulation Monitor           | Ends simulation when tests complete (`mv_end_simulation` signal).           |
| **`clint_s_xactor`**                 | AXI4-Lite Transaction Handler| Manages AXI read/write transactions for the CLINT.                          |
| **`uart_s_xactor`**                  | AXI4-Lite Transaction Handler| Manages AXI read/write transactions for the UART.                           |
| **`fabric_xactors_from_masters`**    | AXI4-Lite Master Interfaces  | Buffers requests from CPU/masters (3 masters: instruction, data, debug).    |
| **`fabric_xactors_to_slaves`**       | AXI4-Lite Slave Interfaces   | Buffers requests to peripherals (6 slaves: main mem, boot mem, CLINT, UART, etc.). |
| **`fabric_v_f_rd_mis`** / **`..._wr`**| Routing FIFOs                | Track read/write "in-flight" transactions in the interconnect.              |
| **`uart_baudGen`**                   | Baud Rate Generator          | Generates clock signals for UART communication speed.                       |
| **`uart_fifoRecv`** / **`fifoXmit`** | FIFO Buffers                 | Store incoming/outgoing UART data to handle flow control.                   |

---

## Design Style Explanation
The SoC follows a **monolithic design style**, where functionality is implemented directly in the top-level module (`mkSoc`) using:
- **Registers** (e.g., `clint_clint_msip` for timer interrupts).
- **FIFOs** (e.g., `fabric_xactors_to_slaves` for routing).
- **Rules** (e.g., `RL_clint_clint_increment_timer` for timer logic).

This differs from a **modular design**, where components like `clint` or `uart` would be instantiated as separate modules. Instead, the code uses naming conventions (e.g., `clint_*`, `uart_*`, `fabric_*`) to group related logic into **functional blocks**.

---

## I/O Signals of `mkSoc`

| **Signal Name**                      | **Direction** | **Meaning**                                                                 | **Usage**                                                                 |
|--------------------------------------|---------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------|
| **Clock/Reset Signals**              |               |                                                                             |                                                                           |
| `CLK_tck_clk`                        | Input         | JTAG test clock (unused in normal operation).                               | Tie to `0` if unused.                                                     |
| `RST_N_trst`                         | Input         | JTAG test reset (unused in normal operation).                               | Tie to `0` if unused.                                                     |
| `CLK`                                | Input         | Main system clock.                                                          | Connect to the system clock source.                                       |
| `RST_N`                              | Input         | Active-low system reset.                                                    | Assert (pull low) to reset the entire system.                             |
| **Dump Interface**                   |               |                                                                             |                                                                           |
| `EN_io_dump_get`                     | Input         | Enable signal to read system state (debugging).                             | Assert to trigger a state dump (e.g., for post-simulation analysis).      |
| `io_dump_get`                        | Output        | System state data (167 bits: registers, FIFOs, etc.).                       | Capture for debugging when `EN_io_dump_get` is asserted.                  |
| `RDY_io_dump_get`                    | Output        | Indicates `io_dump_get` is ready to be read.                                | Check before asserting `EN_io_dump_get`.                                 |
| **Main Memory AXI Master**           |               |                                                                             |                                                                           |
| `main_mem_master_awvalid`            | Output        | AXI write address valid.                                                    | Indicates a valid write address on the bus.                               |
| `main_mem_master_awaddr`             | Output        | AXI write address (32-bit memory address).                                  | Connect to main memory (RAM) controller.                                  |
| `main_mem_master_awprot`             | Output        | AXI write protection (security/privilege level).                            | Set based on system security requirements.                                |
| `main_mem_master_awsize`             | Output        | AXI write burst size (bytes per transfer).                                  | Configure for memory alignment (e.g., `2'b11` for 8-byte bursts).         |
| `main_mem_master_wvalid`             | Output        | AXI write data valid.                                                       | Indicates valid write data on the bus.                                     |
| `main_mem_master_wdata`              | Output        | AXI write data (64-bit).                                                    | Data to write to memory.                                                  |
| `main_mem_master_wstrb`              | Output        | AXI write strobe (byte-wise enable for `wdata`).                            | Use to mask bytes (e.g., `8'b11111111` for full 64-bit write).            |
| `main_mem_master_bready`             | Output        | AXI write response ready.                                                   | Assert to accept write responses from memory.                             |
| `main_mem_master_arvalid`            | Output        | AXI read address valid.                                                     | Indicates a valid read address on the bus.                                |
| `main_mem_master_araddr`             | Output        | AXI read address (32-bit memory address).                                   | Connect to main memory (RAM) controller.                                  |
| `main_mem_master_arprot`             | Output        | AXI read protection (security/privilege level).                             | Set based on system security requirements.                                |
| `main_mem_master_arsize`             | Output        | AXI read burst size (bytes per transfer).                                   | Configure for memory alignment (e.g., `2'b11` for 8-byte bursts).         |
| `main_mem_master_rready`             | Output        | AXI read data ready.                                                        | Assert to accept read data from memory.                                   |
| **Boot Memory AXI Master**           |               |                                                                             |                                                                           |
| `boot_mem_master_*`                  | Output        | AXI signals for boot memory (same as `main_mem_master_*`).                  | Connect to boot memory (ROM/flash) controller.                            |
| **UART**                             |               |                                                                             |                                                                           |
| `uart_io_SIN`                        | Input         | UART serial input (received data).                                          | Connect to external UART RX line.                                         |
| `uart_io_SOUT`                       | Output        | UART serial output (transmitted data).                                      | Connect to external UART TX line.                                         |
| **Simulation Control**               |               |                                                                             |                                                                           |
| `mv_end_simulation`                  | Output        | Signal to end simulation (asserted when tests complete).                    | Monitor to detect simulation completion (e.g., in testbenches).           |
| `RDY_mv_end_simulation`              | Output        | Indicates `mv_end_simulation` is valid.                                     | Check before reading `mv_end_simulation`.                                 |

---

## Notes
1. **Active-Low Reset**: `RST_N` resets the system when pulled low.
2. **AXI Protocol**:
   - Follow the [AXI4-Lite specification](https://developer.arm.com/documentation/ihi0022/e/) for signal timing and handshaking.
   - Use `*valid`/`*ready` signals for flow control (e.g., `awvalid` and `awready`).
3. **Simulation Signals**:
   - `mv_end_simulation` is useful in testbenches to terminate simulations automatically.
   - Use `io_dump_get` to debug system state (registers, FIFOs, etc.).



---
For more details on any component, refer to the Verilog codes in **"verilog"** folder or contact the maintainers.


