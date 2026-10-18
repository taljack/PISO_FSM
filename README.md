# PISO_FSM
PISO FSM — Parallel-In Serial-Out Shift Register
1. Project Overview

This project implements an 8-bit Parallel-In Serial-Out (PISO) shift register using Verilog HDL. A Finite State Machine (FSM) controls the loading and shifting of parallel data.

The circuit accepts 8-bit data simultaneously and transmits it serially, one bit per shift operation.

2. Objectives
Design an 8-bit PISO shift register using Verilog HDL.
Implement FSM-based control for loading and shifting data.
Support clock, reset, load, and shift-enable signals.
Simulate the design using a Verilog testbench.
Analyze simulation waveforms using GTKWave.
3. Features
8-bit parallel data input.
1-bit serial data output.
Clock-controlled operation.
Reset functionality.
Parallel data loading.
Shift-enable control.
Output-valid indication.
VCD waveform generation.
4. Tools and Technologies
Tool / Technology	Purpose
Verilog HDL	Hardware description
Icarus Verilog	RTL compilation and simulation
GTKWave	Waveform visualization
VCD	Simulation signal recording
5. Project Structure
piso_fsm/
├── piso.v       # PISO FSM design
├── tb_piso.v    # Testbench
├── sc.vcd       # Simulation waveform
└── README.md    # Project documentation

6. Input and Output Signals
Signal	Direction	Width	Description
clk	Input	1 bit	Clock signal
rst	Input	1 bit	Reset signal
data	Input	8 bits	Parallel data input
load	Input	1 bit	Loads input data
shift_en	Input	1 bit	Enables shifting
out	Output	1 bit	Serial data output
valid_out	Output	1 bit	Indicates output validity
7. Working Principle

The PISO FSM operates through the following sequence:

Reset: The circuit initializes its internal state.
Load: When load is asserted, the parallel input is loaded into the shift register.
Shift: When shift_en is asserted, the stored data shifts according to the RTL implementation.
Serial transmission: The register transmits one bit at a time through the out port.
Completion: After the required bits have been transmitted, the controller can return to its idle state.

The exact state names, transitions, and output timing depend on the implementation in piso.v.

8. Testbench Description

The testbench tb_piso.v performs the following operations:

Initializes the clock.
Generates a clock with a 10 ps period.
Asserts reset for two falling clock edges.
Applies the parallel input 10101010.
Asserts the load signal.
Enables shifting for eight falling clock edges.
Disables shifting.
Waits for two additional falling clock edges.
Saves signal transitions to sc.vcd.
Ends the simulation using $finish.
9. Simulation Instructions
Prerequisites

Install Icarus Verilog and GTKWave, or use a compatible Verilog simulator.

Step 1: Compile the RTL and testbench
iverilog -o piso_sim piso.v tb_piso.v

Step 2: Run the simulation
vvp piso_sim

Step 3: Open the waveform
gtkwave sc.vcd


In GTKWave, add the relevant signals to inspect the clock, reset, input data, load control, shift enable, serial output, and output-valid signal.

10. Expected Simulation Behavior

The testbench applies the following parallel input:

data = 10101010


The register should load the input and transmit its bits serially during the shift operations.

Depending on the RTL implementation, the output order may be:

MSB first:

1 → 0 → 1 → 0 → 1
