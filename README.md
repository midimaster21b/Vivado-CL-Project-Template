# Vivado Command Line Project Template

This set of scripts was developed to allow a developer to program a device without the need to use the Vivado IDE.

## Getting started

1. Clone this repository as a base for the Vivado project you will be creating.
1. Modify the gen_bitstream.tcl file to match the project specifics.
1. Modify the sync.sh file to match the host system you will be using to process your HDL.
1. Follow the workflow below.

## Basic workflow for Windows

1. Write source code and constraints. (VHDL, Verilog, & .xdc files)
1. Run sync.sh from within a linux system to generate a bitstream file. (I've tested this using the Ubuntu Linux subsystem on Windows 10)
1. Run the program.bat script to program the FPGA device.
