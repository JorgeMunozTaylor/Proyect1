#--Creado por Jorge Munoz Taylor
#--Circuitos digitales 2
#--I-2018

simulacion: bs clean

bs:
	iverilog -o OUT ./testbench.v
	vvp OUT
	gtkwave simulacion.vcd 

clean:
	rm *.o *.vcd *.make
