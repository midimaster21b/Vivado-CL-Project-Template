#!/usr/bin/env bash

vivado_bin=/opt/Xilinx/Xilinx/Vivado/2017.2/bin/vivado

vivado_user=ubuntu
vivado_hostname=ec2-35-169-204-103.compute-1.amazonaws.com
vivado_host="$vivado_user@$vivado_hostname"
server_key=~/.ssh/EGR526.pem

rsync -avh -e "ssh -i $server_key" ./* $vivado_host:~/project_source

ssh -i $server_key $vivado_host "cd project_source; $vivado_bin -mode batch -source ./gen_bitstream.tcl"

scp -i $server_key $vivado_host:~/project_source/project_output/*.bit ./
