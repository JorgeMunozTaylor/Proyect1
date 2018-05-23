all:
	iverilog -o serializador SerializadorUv.v tester1.v Serializador_tb.v
	vvp serializador
	gtkwave registro.vcd
clean:
	rm -f serializador registro.vcd
