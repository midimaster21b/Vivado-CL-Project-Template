# Vivado Command Line Project Template

This set of scripts was developed to allow a developer to program a device without the need to use the Vivado IDE.

NOTE: This will not work unmodified for anyone other than myself.

## Basic workflow for Windows

1. Write source code and constraints. (VHDL, Verilog, & .xdc files)
1. Run sync.sh from within a linux system to generate a bitstream file. (I've tested this using the Ubuntu Linux subsystem on Windows 10)
1. Run the program.bat script to program the FPGA device.


