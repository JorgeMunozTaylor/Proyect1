byte_striping: simulacion clean

simulacion:
	iverilog -o OUT ./testbench.v
	vvp OUT
	gtkwave simulacion.vcd 

clean:
	rm *.o *.vcd *.make
