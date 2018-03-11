#!/usr/bin/env bash

vivado_bin=/opt/Xilinx/Xilinx/Vivado/2017.2/bin/vivado

rsync -avh -e ssh ./* ubuntu@ec2-54-242-3-234.compute-1.amazonaws.com:~/project_source

ssh ubuntu@ec2-54-242-3-234.compute-1.amazonaws.com "cd project_source; $vivado_bin -mode batch -source ./gen_bitstream.tcl"

scp ubuntu@ec2-54-242-3-234.compute-1.amazonaws.com:~/project_source/project_output/*.bit ./
