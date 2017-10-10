onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /testbench/S
add wave -noupdate -radix hexadecimal /testbench/Clk
add wave -noupdate -radix hexadecimal /testbench/Reset
add wave -noupdate -radix hexadecimal /testbench/Run
add wave -noupdate -radix hexadecimal /testbench/Continue
add wave -noupdate -radix hexadecimal /testbench/A
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/MAR
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/MDR
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/IR
add wave -noupdate -radix decimal /testbench/tp/LC3/PC
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/data
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR1
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR2
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/DR
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR1_OUT
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR2_OUT
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/adder/C
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR2_MUX/A
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR2_MUX/B
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR2_MUX/C
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR2_MUX/D
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR2_MUX/E
add wave -noupdate -radix hexadecimal -childformat {{{/testbench/tp/LC3/d0/ADDR2_MUX/select[1]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR2_MUX/select[0]} -radix hexadecimal}} -subitemconfig {{/testbench/tp/LC3/d0/ADDR2_MUX/select[1]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR2_MUX/select[0]} {-height 17 -radix hexadecimal}} /testbench/tp/LC3/d0/ADDR2_MUX/select
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR1_MUX/A
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR1_MUX/B
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR1_MUX/C
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR1_MUX/select
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/LD_MAR
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/LD_MDR
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/LD_IR
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/LD_BEN
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/MDR_MUX/A
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/MDR_MUX/B
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/MDR_MUX/C
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/MDR_MUX/select
add wave -noupdate /testbench/tp/LC3/d0/MIO_EN
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/state_controller/State
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/state_controller/Next_state
add wave -noupdate /testbench/tp/LC3/OE
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2064529 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 339
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1541850 ps} {2550429 ps}
