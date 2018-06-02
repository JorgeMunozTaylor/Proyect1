#--Creado por Jorge Munoz Taylor
#--Circuitos digitales 2
#--I-2018

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
	rm *.o *.vcd *.swp OUT OUT2
	rm byte_striping/*.o byte_striping/*.vcd byte_striping/*.swp byte_striping/OUT
	rm demux/*.o demux/*.vcd demux/*.swp demux/OUT
	rm mux/*.o mux/*.vcd mux/*.swp mux/OUT
	rm serdes/*.o serdes/*.vcd serdes/*.swp serdes/OUT 

