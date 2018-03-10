#!/usr/bin/env bash

# rsync -avh -e ssh ./vgademo0_block ubuntu@ec2-54-242-3-234.compute-1.amazonaws.com:~

# ssh ubuntu@ec2-54-242-3-234.compute-1.amazonaws.com "cd vgademo0_block; /opt/Xilinx/Xilinx/Vivado/2017.2/bin/vivado -mode batch -source ./gen_bitstream.tcl"

# scp ubuntu@ec2-54-242-3-234.compute-1.amazonaws.com:~/vgademo0_block/project_output/vgademo0_block_top.bit ./

/mnt/c/Xilinx/Vivado/2017.2/bin/unwrapped/win64.o/vivado.exe -mode batch -source /mnt/c/Users/edgco/School/EGR526/VGA/vgademo0_block/program_device.tcl
