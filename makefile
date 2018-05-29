target: simulacion clean

simulacion:
	iverilog -o OUT testbench.v
	vvp OUT
	gtkwave PCIE.vcd

clean:
	rm *.o *.vcd

