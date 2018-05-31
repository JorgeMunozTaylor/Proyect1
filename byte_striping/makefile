simulacion: bs clean

bs:
	iverilog -o OUT ./testbench.v
	vvp OUT
	gtkwave simulacion.vcd 

clean:
	rm *.o *.vcd *.make
