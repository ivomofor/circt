# CIRCT Hardware Compilation Experiments

A hands on learning project exploring CIRCT (Circuit IR Compilers and Tools), the MLIR based infrastructure for hardware design and compiler flows.
The project includes experiments with a combinational adder and a sequential register. The designs were lowered to SystemVerilog and simulated.

## What this project explores
- Representing hardware designs using CIRCT/MLIR.
- Modeling combinational logic with an adder.
- Modeling sequential logic with a register.
- Generating SystemVerilog with firtool.
- Compiling and simulating SystemVerilog with Icarus Verilog.
- Following a hardware compilation workflow from an intermediate representation to simulation ready HDL.

## Toolchain
- CIRCT tools (circt-opt and firtool)
- Icarus Verilog (iverilog and vvp)
- Ubuntu and Git
The local toolchain used during development included firtool 1.160.0 and a CIRCT build reporting LLVM 24.0.0git. Versions may vary by environment.

## Simulation workflow
The exact design and testbench filenames depend on the files in the repository. A typical Icarus Verilog simulation stage is:
iverilog -g2012 -o simulation design.sv testbench.sv
vvp simulation
Replace the example filenames with the actual generated SystemVerilog and testbench paths.

#Status
This is an educational project for exploring hardware IRs and compiler-to-HDL workflows.
