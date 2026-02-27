# Experiment — Control Path Design for MIPS Processor (Verilog HDL)

## Overview

This experiment focuses on designing the **Control Path** of a simplified MIPS processor using Verilog HDL and verifying its operation through simulation.

The control unit acts as the decision-making component of the processor by generating control signals that guide the execution of instructions in the datapath developed in Experiment 3. Based on the instruction opcode, the control path determines how registers, ALU, and memory components operate during instruction execution.

The functionality of the control signals was analyzed for **R-type**, **I-type**, and **J-type** instructions using a dedicated Verilog testbench and simulation in Xilinx Vivado.

---

## Aim

To design a control path in Verilog HDL that controls the execution of the MIPS datapath and to analyze generated control signals for different instruction formats using simulation.

---

## Objectives

- Design a Control Unit for the MIPS processor datapath  
- Generate control signals based on instruction opcode  
- Control execution of datapath components designed in Experiment 3  
- Implement control logic for R-type, I-type, and J-type instructions  
- Develop a Verilog testbench to verify control signal behavior  
- Analyze processor control flow using simulation waveforms  

---

## Modules Implemented

### 1. Control Unit

The control unit decodes the instruction opcode and generates control signals required for datapath execution.

**Generated Control Signals**
- `reg_dst` — Selects destination register
- `mem_to_reg` — Selects write-back data source
- `alu_op` — Determines ALU operation
- `jump` — Enables jump instruction execution
- `branch` — Enables branch operation
- `mem_read` — Controls memory read
- `mem_write` — Controls memory write
- `alu_src` — Selects ALU operand source
- `reg_write` — Enables register write operation
- `sign_or_zero` — Controls immediate value extension

The module ensures proper coordination between datapath components during instruction execution.

---

### 2. Instruction Type Handling

The control path was designed to support multiple instruction formats:

#### R-Type Instructions
- Register-to-register operations
- ALU performs arithmetic operations
- Register write enabled

#### I-Type Instructions
- Immediate arithmetic instructions
- Load (`lw`) and Store (`sw`) operations
- Branch (`beq`) instruction handling

#### J-Type Instructions
- Jump (`j`)
- Jump and Link (`jal`)
- Program control flow modification

Each instruction type activates a unique combination of control signals.

---

### 3. Testbench

The testbench verifies control unit functionality by:

- Applying reset conditions
- Providing different opcode values sequentially
- Simulating R-type, I-type, and J-type instructions
- Observing generated control signals
- Validating correctness through waveform analysis

All instruction cases were tested to ensure proper decoding and signal generation.

---

## Tools Used

- **Hardware Description Language:** Verilog HDL  
- **Simulation Tool:** Xilinx Vivado  
- **Design Methodology:** Modular Digital Design  
- **Verification Method:** Testbench-based Simulation  

---

## Learning Outcomes

Through this experiment, I learned:

- The role of the control path in processor architecture
- How instruction opcodes translate into control signals
- Interaction between control logic and datapath components
- Implementation of instruction decoding in hardware
- Verification of processor behavior using simulation waveforms

This experiment strengthened my understanding of how execution control is managed inside a processor.

Designing the control path helped me understand how a processor decides what action to perform for each instruction. Observing how different opcodes activate different control signals made the connection between instruction formats and hardware execution much clearer. This experiment complemented the datapath design by showing how control and data flow work together inside a processor.
