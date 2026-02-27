# Experiment 1 — ALU and ALU Control Integration (MIPS Processor)

## Overview

This experiment focuses on integrating the **Arithmetic Logic Unit (ALU)** with the **ALU Control Unit** of a simplified MIPS processor and verifying its functionality using simulation.

The objective was to understand how processor instructions are translated into control signals that drive arithmetic and logical operations inside the ALU. The design was implemented using Verilog HDL and verified through testbench-based simulation in Xilinx Vivado.

---

## Aim

To integrate the ALU and ALU Control Unit of a MIPS processor, encode instructions as control inputs, and verify ALU operations using simulation and test vectors.

---

## Objectives

- Design a 16-bit ALU capable of performing arithmetic and logical operations  
- Implement ALU Control logic for instruction decoding  
- Integrate ALU and ALU Control using a top module  
- Generate encoded instruction inputs to control ALU operations  
- Apply random and predefined test vectors through a testbench  
- Verify correctness using simulation waveforms in Vivado  

---

## Modules Implemented

### 1. ALU Module
Performs arithmetic and logical operations based on control signals.

**Supported Operations**
- Addition
- Subtraction
- AND
- OR
- Set Less Than (SLT)

---

### 2. ALU Control Unit
Generates ALU control signals using:
- `ALUOp` field
- Instruction `Function` field

This module mimics instruction decoding used in the MIPS architecture.

---

### 3. Top Module (Integration)
The top module integrates:
- ALU Control Unit
- ALU

It connects instruction inputs to control logic and executes the corresponding ALU operation.

This module was implemented to understand hierarchical hardware design and processor datapath interaction.

---

### 4. Testbench
The testbench:
- Supplies encoded instruction inputs
- Generates multiple test cases
- Verifies ALU outputs
- Checks functionality using simulation waveforms

Both predefined and varying input vectors were used for validation.

---

## Tools Used

- **Hardware Description Language:** Verilog HDL  
- **Simulation Tool:** Xilinx Vivado  
- **Design Methodology:** Modular and Hierarchical Design  
- **Verification:** Testbench-based simulation  

---

## Learning Outcomes

Through this experiment, I learned:

- Interaction between ALU and control units in a processor
- Instruction encoding and control signal generation
- Hierarchical module integration in Verilog
- Writing and debugging hardware testbenches
- Verifying digital designs using waveform analysis

This experiment helped connect theoretical concepts of processor architecture with practical hardware implementation.

---

## Personal Note

This experiment provided my first hands-on experience with integrating processor components rather than designing them individually. Implementing the top module and observing how encoded instructions control ALU operations helped me better understand how execution units function inside a processor.
