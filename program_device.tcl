##
## Program the device
##

# Open labtools system
open_hw

# Establish the hw server
connect_hw_server -url localhost:3121

# Set the current hw target (ASSUMES ONLY 1 TARGET PRESENT!!!)
# If multiple targets are present, the serial number should be used to select the appropriate hw
current_hw_target [get_hw_targets]

# Open the current hw target
open_hw_target

# Set the current hw device
current_hw_device [lindex [get_hw_devices] 0]

# Refresh the current hw device (NOT SURE WHY THIS IS NECESSARY)
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices] 0]

# Set the file to be programmed to the device
set_property PROGRAM.FILE {C:\Users\edgco\School\EGR526\VGA\vgademo0_block\vgademo0_block_top.bit} [lindex [get_hw_devices] 0]

# Program the device
program_hw_devices [lindex [get_hw_devices] 0]

# Refresh the target device, not sure if this is necessary either.
refresh_hw_device [lindex [get_hw_devices] 0]
