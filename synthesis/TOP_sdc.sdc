# Top Level Design Parameters

# Clocks

create_clock -name {FAB_CLK} -period 10.000000 -waveform {0.000000 5.000000} MSS01_0/MSS_CCC_0/I_MSSCCC:GLA
create_clock -name {FCLK} -period 10.000000 -waveform {0.000000 5.000000} MSS01_0/MSS_CCC_0/I_MSSCCC:GLAMSS

# False Paths Between Clocks


# False Path Constraints


# Maximum Delay Constraints


# Multicycle Constraints


# Virtual Clocks
# Output Load Constraints
# Driving Cell Constraints
# Wire Loads
# set_wire_load_mode top

# Other Constraints
