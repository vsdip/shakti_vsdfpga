# shakti_vsdfpga

Repo for shakti files
![image](https://github.com/user-attachments/assets/17d5aa33-fef9-4f01-aa01-206d655aa4ec)

# Shakti SoC Details:
---

# System-on-Chip (SoC) Components Summary

This document provides a high-level overview of the components in the SHAKTI System-on-Chip (SoC) described in the Verilog code (go to "verilog" folder to find all verilog files).

---

## Table of Contents
1. [Overview](#overview)
2. [System Components](#system-components)
3. [Notes](#notes)

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

## Notes
1. **AXI4-Lite** is a simplified version of the AXI bus protocol used for register-like access (common in small SoCs).
2. **FIFOs** (First-In-First-Out queues) buffer data to handle mismatches in communication speeds between components.
3. The `fabric` (interconnect) uses **source/destination tagging** to route transactions between masters and slaves.

---

For more details on any component, refer to the Verilog code or contact the maintainers.

---

You can now use this `README.md` in your GitHub repository to provide a clear and concise overview of the SoC components. Let me know if you need further assistance! 😊
