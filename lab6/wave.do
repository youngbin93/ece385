onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /testbench/S
add wave -noupdate -radix hexadecimal /testbench/Clk
add wave -noupdate -radix hexadecimal /testbench/Reset
add wave -noupdate -radix hexadecimal /testbench/Run
add wave -noupdate -radix hexadecimal /testbench/Continue
add wave -noupdate -radix hexadecimal /testbench/A
add wave -noupdate /testbench/tp/LC3/MAR
add wave -noupdate /testbench/tp/LC3/MDR
add wave -noupdate /testbench/tp/LC3/IR
add wave -noupdate /testbench/tp/LC3/PC
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/data
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR1
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR2
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/DR
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR1_OUT
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR2_OUT
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/state_controller/State
add wave -noupdate /testbench/tp/LC3/state_controller/Next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {378597 ps} 0}
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
WaveRestoreZoom {146576 ps} {904339 ps}
