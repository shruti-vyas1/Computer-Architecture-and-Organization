# Experiment 2 — Integration of Register File, ALU Control and ALU (MIPS Architecture)

## Experiment Title
Integrate Register File, ALU Control Unit, and ALU using Verilog HDL and demonstrate execution of an R-type MIPS instruction.

---

## Objective

- To integrate Register File, ALU Control, and ALU modules.
- To design a top module connecting all components using Verilog HDL.
- To demonstrate execution of a MIPS R-type instruction.
- To verify functionality using a simulation testbench.
- To ensure correct register initialization and instruction encoding.

---

## Experiment Description

This experiment implements a simplified datapath of a MIPS processor by integrating three major hardware components:

- Register File
- ALU Control Unit
- Arithmetic Logic Unit (ALU)

A top module is designed to interconnect these modules using internal wires. The system simulates execution of encoded instructions by generating control signals through a testbench environment.

The register file provides operand data, the ALU Control unit selects the operation based on instruction encoding, and the ALU performs arithmetic or logical operations.

---

## System Components

### 1. Register File
- Contains 8 registers of 16-bit width.
- Two read ports and one write port.
- Synchronous write operation.
- Reset initializes all registers to zero.

### 2. ALU Control Unit
- Generates ALU control signals.
- Uses ALUOp and Function fields as inputs.
- Determines required ALU operation.

### 3. Arithmetic Logic Unit (ALU)
- Performs arithmetic and logical operations.
- Produces result output.
- Generates zero flag.

### 4. Top Module
- Connects register file, ALU Control, and ALU.
- Transfers operands and control signals between modules.

### 5. Testbench
- Generates clock and reset signals.
- Initializes registers with data.
- Supplies encoded instruction signals.
- Verifies output behavior.

---

## Working Principle

1. Registers are initialized using write enable signals.
2. Operand values are read from the register file.
3. Encoded instruction fields (`ALUOp` and `Function`) are applied.
4. ALU Control generates operation control signals.
5. ALU executes the selected operation.
6. Result and zero flag are observed through simulation waveforms.

---

## Demonstrated Instruction (R-Type)

Example behavior:

ADD R1, R2 → Result

- Source operands are fetched from registers.
- ALU operation is selected using control signals.
- Result is generated at ALU output.

---
## Expected Results

- Registers initialize correctly after reset.
- Correct operand values are read.
- ALU Control generates proper control signals.
- ALU produces accurate results.
- Zero flag activates when output equals zero.

---

## Learning Outcomes

- Understanding of MIPS datapath integration.
- Experience connecting multiple Verilog modules.
- Knowledge of instruction-based control logic.
- Practical exposure to processor component simulation.
