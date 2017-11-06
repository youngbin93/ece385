# TCL File Generated by Component Editor 15.0
# Sat Nov 04 12:02:49 PDT 2017
# Tue Oct 31 13:43:02 CDT 2017
# DO NOT MODIFY


# 
# AES_Decryption_Core "AES Decryption Core" v1.1
#  2017.11.04.12:02:49
# This module performs 128-bit AES Decryption 
#  2017.10.31.13:43:02
# This module performs 128-bit AES decyption
# 

# 
# request TCL package from ACDS 15.0
# 
package require -exact qsys 15.0


# 
# module AES_Decryption_Core
# 
set_module_property DESCRIPTION "This module performs 128-bit AES Decryption "
set_module_property DESCRIPTION "This module performs 128-bit AES decyption"
set_module_property NAME AES_Decryption_Core
set_module_property VERSION 1.1
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "ECE 385 Custom IPs"
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME "AES Decryption Core"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL avalon_aes_interface
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file avalon_aes_interface.sv SYSTEM_VERILOG PATH avalon_aes_interface.sv TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL avalon_aes_interface
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file avalon_aes_interface.sv SYSTEM_VERILOG PATH avalon_aes_interface.sv


# 
# parameters
# 


# 
# display items
# 


# 
# connection point CLK
# 
add_interface CLK clock end
set_interface_property CLK clockRate 50000000
set_interface_property CLK ENABLED true
set_interface_property CLK EXPORT_OF ""
set_interface_property CLK PORT_NAME_MAP ""
set_interface_property CLK CMSIS_SVD_VARIABLES ""
set_interface_property CLK SVD_ADDRESS_GROUP ""

add_interface_port CLK CLK clk Input 1


# 
# connection point RESET
# 
add_interface RESET reset end
set_interface_property RESET associatedClock CLK
set_interface_property RESET synchronousEdges DEASSERT
set_interface_property RESET ENABLED true
set_interface_property RESET EXPORT_OF ""
set_interface_property RESET PORT_NAME_MAP ""
set_interface_property RESET CMSIS_SVD_VARIABLES ""
set_interface_property RESET SVD_ADDRESS_GROUP ""

add_interface_port RESET RESET reset Input 1


# 
# connection point AES_Slave
# 
add_interface AES_Slave avalon end
set_interface_property AES_Slave addressUnits WORDS
set_interface_property AES_Slave associatedClock CLK
set_interface_property AES_Slave associatedReset RESET
set_interface_property AES_Slave bitsPerSymbol 8
set_interface_property AES_Slave burstOnBurstBoundariesOnly false
set_interface_property AES_Slave burstcountUnits WORDS
set_interface_property AES_Slave explicitAddressSpan 0
set_interface_property AES_Slave holdTime 0
set_interface_property AES_Slave linewrapBursts false
set_interface_property AES_Slave maximumPendingReadTransactions 0
set_interface_property AES_Slave maximumPendingWriteTransactions 0
set_interface_property AES_Slave readLatency 0
set_interface_property AES_Slave readWaitTime 1
set_interface_property AES_Slave setupTime 0
set_interface_property AES_Slave timingUnits Cycles
set_interface_property AES_Slave writeWaitTime 0
set_interface_property AES_Slave ENABLED true
set_interface_property AES_Slave EXPORT_OF ""
set_interface_property AES_Slave PORT_NAME_MAP ""
set_interface_property AES_Slave CMSIS_SVD_VARIABLES ""
set_interface_property AES_Slave SVD_ADDRESS_GROUP ""

add_interface_port AES_Slave AVL_ADDR address Input 4
add_interface_port AES_Slave AVL_BYTE_IN byteenable Input 4
add_interface_port AES_Slave AVL_BYTE_EN byteenable Input 4
add_interface_port AES_Slave AVL_CS chipselect Input 1
add_interface_port AES_Slave AVL_READ read Input 1
add_interface_port AES_Slave AVL_READDATA readdata Output 32
add_interface_port AES_Slave AVL_WRITE write Input 1
add_interface_port AES_Slave AVL_WRITEDATA writedata Input 32
set_interface_assignment AES_Slave embeddedsw.configuration.isFlash 0
set_interface_assignment AES_Slave embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment AES_Slave embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment AES_Slave embeddedsw.configuration.isPrintableDevice 0


# 
# connection point Export_Data
# 
add_interface Export_Data conduit end
set_interface_property Export_Data associatedClock CLK
set_interface_property Export_Data associatedReset ""
set_interface_property Export_Data associatedReset RESET
set_interface_property Export_Data ENABLED true
set_interface_property Export_Data EXPORT_OF ""
set_interface_property Export_Data PORT_NAME_MAP ""
set_interface_property Export_Data CMSIS_SVD_VARIABLES ""
set_interface_property Export_Data SVD_ADDRESS_GROUP ""

add_interface_port Export_Data EXPORT_DATA EXPORT_DATA Output 32
add_interface_port Export_Data EXPORT_DATA EXPORT_DATA Input 32

