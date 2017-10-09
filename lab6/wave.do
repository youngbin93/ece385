onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /testbench/S
add wave -noupdate -radix hexadecimal /testbench/Clk
add wave -noupdate -radix hexadecimal /testbench/Reset
add wave -noupdate -radix hexadecimal /testbench/Run
add wave -noupdate -radix hexadecimal /testbench/Continue
add wave -noupdate -radix hexadecimal /testbench/A
add wave -noupdate -radix hexadecimal /testbench/tp/OE
add wave -noupdate -radix hexadecimal /testbench/tp/WE
add wave -noupdate -radix hexadecimal /testbench/tp/CE
add wave -noupdate -radix hexadecimal /testbench/tp/Data
add wave -noupdate -radix hexadecimal /testbench/tp/tm/I_O
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/Data
add wave -noupdate -radix hexadecimal /testbench/tp/tm/A
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/MDR_MUX/A
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/MDR_MUX/B
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/MDR_MUX/C
add wave -noupdate /testbench/tp/LC3/d0/MDR_MUX/select
add wave -noupdate -radix hexadecimal -childformat {{{/testbench/tp/LC3/d0/ADDR1_MUX/A[15]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[14]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[13]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[12]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[11]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[10]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[9]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[8]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[7]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[6]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[5]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[4]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[3]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[2]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[1]} -radix hexadecimal} {{/testbench/tp/LC3/d0/ADDR1_MUX/A[0]} -radix hexadecimal}} -subitemconfig {{/testbench/tp/LC3/d0/ADDR1_MUX/A[15]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[14]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[13]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[12]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[11]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[10]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[9]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[8]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[7]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[6]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[5]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[4]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[3]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[2]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[1]} {-height 17 -radix hexadecimal} {/testbench/tp/LC3/d0/ADDR1_MUX/A[0]} {-height 17 -radix hexadecimal}} /testbench/tp/LC3/d0/ADDR1_MUX/A
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR1_MUX/B
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR1_MUX/C
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR1_MUX/select
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR2_MUX/A
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR2_MUX/B
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR2_MUX/C
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR2_MUX/D
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR2_MUX/E
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/ADDR2_MUX/select
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/data
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR1
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR2
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/DR
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR1_OUT
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/regfile/SR2_OUT
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/REG_MDR/in
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/REG_MDR/data
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/REG_MAR/in
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/REG_MAR/data
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/sext6/B
add wave -noupdate -radix hexadecimal /testbench/tp/LC3/d0/adder/C
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
