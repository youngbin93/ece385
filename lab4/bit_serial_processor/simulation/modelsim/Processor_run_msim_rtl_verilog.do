transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/fisiaka2/ece385/lab4/bit_serial_processor {/home/fisiaka2/ece385/lab4/bit_serial_processor/HexDriver.sv}
vlog -sv -work work +incdir+/home/fisiaka2/ece385/lab4/bit_serial_processor {/home/fisiaka2/ece385/lab4/bit_serial_processor/Control.sv}
vlog -sv -work work +incdir+/home/fisiaka2/ece385/lab4/bit_serial_processor {/home/fisiaka2/ece385/lab4/bit_serial_processor/compute.sv}
vlog -sv -work work +incdir+/home/fisiaka2/ece385/lab4/bit_serial_processor {/home/fisiaka2/ece385/lab4/bit_serial_processor/Synchronizers.sv}
vlog -sv -work work +incdir+/home/fisiaka2/ece385/lab4/bit_serial_processor {/home/fisiaka2/ece385/lab4/bit_serial_processor/Router.sv}
vlog -sv -work work +incdir+/home/fisiaka2/ece385/lab4/bit_serial_processor {/home/fisiaka2/ece385/lab4/bit_serial_processor/Reg_8.sv}
vlog -sv -work work +incdir+/home/fisiaka2/ece385/lab4/bit_serial_processor {/home/fisiaka2/ece385/lab4/bit_serial_processor/Register_unit.sv}
vlog -sv -work work +incdir+/home/fisiaka2/ece385/lab4/bit_serial_processor {/home/fisiaka2/ece385/lab4/bit_serial_processor/Processor.sv}

vlog -sv -work work +incdir+/home/fisiaka2/ece385/lab4/bit_serial_processor {/home/fisiaka2/ece385/lab4/bit_serial_processor/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
