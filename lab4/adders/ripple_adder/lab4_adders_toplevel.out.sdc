## Generated SDC file "lab4_adders_toplevel.out.sdc"

## Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus II License Agreement,
## the Altera MegaCore Function License Agreement, or other 
## applicable license agreement, including, without limitation, 
## that your use is for the sole purpose of programming logic 
## devices manufactured by Altera and sold by Altera or its 
## authorized distributors.  Please refer to the applicable 
## agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"

## DATE    "Tue Sep 19 10:33:38 2017"

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

set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Clk}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {LoadB}]
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
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[8]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[9]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[10]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[11]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[12]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[13]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[14]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {SW[15]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex0[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex0[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex0[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex0[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex0[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex0[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex0[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex1[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex1[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex1[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex1[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex1[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex1[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex1[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex2[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex2[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex2[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex2[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex2[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex2[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex2[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex3[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex3[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex3[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex3[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex3[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex3[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Ahex3[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex0[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex0[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex0[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex0[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex0[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex0[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex0[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex1[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex1[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex1[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex1[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex1[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex1[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex1[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex2[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex2[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex2[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex2[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex2[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex2[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex2[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex3[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex3[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex3[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex3[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex3[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex3[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Bhex3[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {CO}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[12]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[13]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[14]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  0.000 [get_ports {Sum[15]}]


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

