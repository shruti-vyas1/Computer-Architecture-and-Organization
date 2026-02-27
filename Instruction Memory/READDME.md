# 16-bit MIPS Processor – Top Module Integration (Verilog)

## Overview

This project focuses on building the top-level module of a 16-bit MIPS processor using Verilog HDL. The goal was to understand how individual processor components work together by integrating Instruction Memory, Register File, ALU, ALU Control, and Data Memory into a single datapath.

While designing the system, the instruction memory was connected first to enable instruction fetching, followed by the integration of data memory for read and write operations during execution.

The design is verified using a Verilog testbench containing both arithmetic and logical instruction cases.

---

## What This Project Does

- Connects all major processor components through a top module
- Fetches instructions from instruction memory using the program counter
- Executes arithmetic and logical operations through the ALU
- Reads and writes data using data memory
- Writes execution results back to the register file
- Verifies processor behavior through simulation

---

## Design Approach

1. Instruction Memory was connected first to ensure proper instruction fetching.
2. The Register File and ALU were integrated to perform computations.
3. ALU Control logic was added to generate operation-specific control signals.
4. Data Memory was then connected to support memory read/write operations.
5. A testbench was written to validate arithmetic and logical instruction execution.

---

## Modules Used

- **Instruction Memory** – Stores encoded instructions
- **Register File** – Holds processor registers
- **ALU** – Performs arithmetic and logical operations
- **ALU Control** – Determines ALU operation type
- **Data Memory** – Handles memory access operations
- **Top Module** – Integrates the complete datapath
- **Testbench** – Simulates and verifies functionality

---

## Verification

The testbench checks:

- Instruction fetching
- Arithmetic instruction execution
- Logical instruction execution
- Memory read and write operations
- Correct ALU output and zero flag generation

---

## Tools Used

- Verilog HDL
- Xilinx Vivado (Simulation)


