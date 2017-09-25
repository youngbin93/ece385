## Generated SDC file "8bit_multiplier.out.sdc"

## Copyright (C) 1991-2014 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.4 Build 182 03/12/2014 SJ Full Version"

## DATE    "Mon Sep 25 15:43:45 2017"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 10.000 -waveform { 0.000 5.000 } [get_ports {Clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {ClearA_LoadB}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Clk}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Reset}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Run}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[7]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexL[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexL[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexL[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexL[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexL[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexL[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexL[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexU[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexU[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexU[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexU[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexU[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexU[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {AhexU[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexL[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexL[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexL[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexL[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexL[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexL[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexL[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexU[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexU[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexU[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexU[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexU[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexU[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {BhexU[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {X}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

