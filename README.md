# verilog-serial-adder
# Mealy FSM Serial Adder

## Overview
This project implements a synchronous Serial Adder using a Mealy Finite State Machine (FSM). It processes two binary numbers bit-by-bit (Least Significant Bit first) and outputs the sequential sum, utilizing the FSM state to act as the internal Carry memory.

## Architecture
* **State Memory (Carry):** A 1-bit register (`ps`) stores the carry-out from the previous addition to be used in the subsequent clock cycle (States: `ZERO` and `ONE`).
* **Mealy Combinational Logic:** The sum output (`s`) and next state (`ns`) are calculated combinationally based on the current inputs (`a`, `b`) and the current state (Carry). 
* **Strict Two-Block Design:** Sequential memory and combinational logic are cleanly separated. The design utilizes explicit wire sizing (e.g., `1'b0`) to ensure precise hardware synthesis and prevent truncation errors.

## Verification
The testbench simulates the addition of two 4-bit numbers: `0110` (Decimal 6) + `0010` (Decimal 2). 
* Inputs are specifically offset from the positive clock edge (e.g., `#12` against a `#5` clock) to accurately simulate real-world setup and hold propagation delays.
* The system perfectly calculates the sum `1000` (Decimal 8), verifying accurate carry propagation across multiple clock cycles.

