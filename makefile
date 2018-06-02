target: conductual sintetizado clean

conductual:
	iverilog -o OUT testbench.v
	vvp OUT
	gtkwave PCIE.vcd

sintetizado:
	iverilog -o OUT2 testbench_synth.v
	vvp OUT2
	gtkwave PCIE_sintetizado.vcd
	
clean:
	rm *.o *.vcd

