# VHDL build script adapted from the example script found in ug892-vivado-design-flows-overview.pdf 

##
## Step #0: Set up working environment
##

set currentDir [file dirname $::argv0]
set outputDir $currentDir/project_output
file mkdir $outputDir

set projectSourceDir vgademo0_block.srcs
set projectTopFile vgademo0_block_top
set projectPart xc7a35tcpg236-1

set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]

##
## Step #1: setup design sources and constraints
##

# Read source files
read_vhdl  [ glob $currentDir/$projectSourceDir/sources_1/new/*.vhd ]

# Read IP
read_ip $currentDir/$projectSourceDir/sources_1/ip/clk_wiz_0.xcix

# Read constraint files
read_xdc $currentDir/$projectSourceDir/constrs_1/new/vgatop_pins.xdc

##
## Step #2: run synthesis, report utilization and timing estimates, write checkpoint design
##
synth_design -top $projectTopFile -part $projectPart -flatten rebuilt
write_checkpoint -force $outputDir/post_synth
report_timing_summary -file $outputDir/post_synth_timing_summary.rpt
report_power -file $outputDir/post_synth_power.rpt

##
## Step #3: run placement and logic optimzation, report utilization and timing estimates, write checkpoint design
##
opt_design
place_design
phys_opt_design
write_checkpoint -force $outputDir/post_place
report_timing_summary -file $outputDir/post_place_timing_summary.rpt

##
## Step #4: run router, report actual utilization and timing, write checkpoint design, run drc, write verilog and xdc out
##
route_design
write_checkpoint -force $outputDir/post_route
report_timing_summary -file $outputDir/post_route_timing_summary.rpt
report_timing -sort_by group -max_paths 100 -path_type summary -file $outputDir/post_route_timing.rpt
report_clock_utilization -file $outputDir/clock_util.rpt
report_utilization -file $outputDir/post_route_util.rpt
report_power -file $outputDir/post_route_power.rpt
report_drc -file $outputDir/post_imp_drc.rpt
write_verilog -force $outputDir/project_impl_netlist.v
#write_xdc -no_fixed_only -force $outputDir/cpu_impl.xdc

##
## Step #5: generate a bitstream
##
write_bitstream -force $outputDir/$projectTopFile.bit

