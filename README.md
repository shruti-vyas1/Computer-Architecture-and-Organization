# Computer Architecture and Organization Lab Experiments

## Overview

This repository contains the experiments performed as part of the **Computer Architecture and Organization (CAO) Laboratory**.

The objective of these experiments was to understand the internal working of processor components by designing and simulating hardware modules using **Verilog HDL**.

Through these experiments, I explored how arithmetic and control units interact inside a processor and how hardware functionality can be verified using simulation and testbenches.

All designs were implemented and verified using simulation waveforms in **Xilinx Vivado**.

---

## Objectives

- Understand processor datapath components  
- Design arithmetic and logical hardware modules using Verilog  
- Integrate functional units hierarchically  
- Learn instruction encoding and control signal generation  
- Verify hardware behavior using testbenches and waveform analysis  

---

## Tools and Technologies

- **Hardware Description Language:** Verilog HDL  
- **Simulation Tool:** Xilinx Vivado  
- **Methodology:** Structural and Behavioral Modeling  
- **Verification:** Testbench-based simulation  

---

## Experiments Included

### Experiment 1 — ALU Design and Testing
Design and simulation of an Arithmetic Logic Unit (ALU) capable of performing arithmetic and logical operations.  
Different operations were verified using encoded input combinations and waveform outputs.

---

### Experiment 2 — ALU and ALU Control Integration
Integration of the ALU with an ALU Control Unit.

Instruction codes were encoded to generate control signals, enabling execution of specific ALU operations similar to processor instruction execution.

---

### Experiment 3 — Arithmetic Circuit Implementation
Implementation of fundamental arithmetic building blocks used in processor datapaths, including:

- Half Adder  
- Full Adder  
- Subtractors  
- Gate-level implementations  

These modules helped build a strong understanding of low-level hardware design.

---

### Experiment 4 — Hierarchical Adder Design
Design of larger arithmetic units using modular construction:

- 4-bit Ripple Carry Adder (RCA)  
- 16-bit Ripple Carry Adder  
- Carry Select Adder (CSA)  

This experiment demonstrated hierarchical design and performance-oriented adder architecture.

---

### Experiment 5 — Simulation and Verification
Creation of testbenches to verify correctness of designs through simulation.

Key activities included:

- Generating test vectors  
- Functional verification  
- Waveform analysis  
- Comparing expected vs simulated outputs  

---

## Learning Outcomes

Through these experiments, I learned:

- How processor arithmetic units are constructed internally  
- Hierarchical hardware design methodology  
- Importance of control signals in instruction execution  
- Writing effective Verilog testbenches  
- Debugging designs using simulation waveforms  

This repository represents my learning journey while studying **Computer Architecture and Organization**.  
Many concepts that initially felt abstract became clearer after implementing them in hardware and observing their behavior through simulation. Each experiment contributed to a deeper understanding of how processors actually work behind the scenes.
