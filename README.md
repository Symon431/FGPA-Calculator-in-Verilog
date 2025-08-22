# FPGA Calculator in Verilog 

This repository contains Verilog HDL code for three digital logic design projects. The projects progress from simple combinational circuits to a fully integrated FSM-controlled calculator implemented on an FPGA.

The work demonstrates proficiency in **combinational and sequential logic**, **datapath and control design**, simulation and verification, and the **hardware design flow** from ModelSim simulation to Quartus synthesis and FPGA deployment.

---

## Project A: 2-bit Binary Multiplier & 7-Segment Display

This introductory project focused on **structural Verilog** and the fundamentals of combinational logic.

### Highlights:
* **2-bit Binary Multiplier:** Takes two 2-bit inputs and produces a 4-bit product. This module demonstrates basic **binary arithmetic** implementation in hardware.
* **7-Segment Display Decoder:** Converts the 4-bit binary product into a human-readable decimal output for a 7-segment display. This is a common combinational logic block for visual output.
* **Structural Verilog Design:** Circuits were built by instantiating and interconnecting smaller logic components (e.g., AND, OR, XOR gates), showcasing a bottom-up approach to hardware construction.

---

## Project B: 4-bit Binary Calculator

This project introduced **datapath design** and integrated multiple modules into a working system capable of performing various arithmetic operations.

### Highlights:
* **Registers:** Two 4-bit **registers** store operands across clock cycles. Registers are fundamental **sequential logic** elements essential for holding state and data in synchronous circuits.
* **Arithmetic Logic Unit (ALU):** Performs **addition, subtraction, multiplication, and division**. The ALU is the core computational block of the calculator.
* **Multiplexer (MUX):** A **multiplexer** selects the appropriate input for the ALU and other datapath elements, enabling different operations based on control signals. 
* **Error Handling:** Implemented logic to handle specific conditions, such as **division by zero** and signaling **negative results** for subtraction, demonstrating robust circuit design.

---

## Project C: FSM-Controlled 4-bit Calculator

This capstone project added a **Finite-State Machine (FSM)** to control the datapath and calculator operations, transforming it into a fully sequential and interactive system.

### Highlights:
* **FSM Control:** The FSM is the **control unit**, managing the sequence of operations through distinct states such as **IDLE, WAIT_FOR_OP, CALCULATE, and DISPLAY_RESULT**.
* **Control Signals:** The FSM generates a series of **control signals** that orchestrate the datapath. These signals determine when to load registers, which ALU operation to execute, and when to enable display outputs, illustrating the core concept of **control path design**. 
* **Top-Level Integration:** The FSM, datapath (with its registers and ALU), and display logic were combined into one cohesive system, demonstrating hierarchical design.
* **FPGA Deployment:** The final design was synthesized in **Quartus II** and implemented on an FPGA board, including meticulous **pin assignments** for all physical inputs (switches/buttons) and outputs (7-segment displays).

---

## Tools and Technologies

* **Verilog HDL:** Hardware description language used for all digital circuit designs.
* **ModelSim:** Utilized for comprehensive functional simulation and verification of module-level and system-level behavior.
* **Quartus II:** The integrated development environment used for synthesis, place-and-route, and programming the FPGA.
* **FPGA Board:** The target hardware platform for the final deployment and testing of the digital designs.
