serializador:
	iverilog -o serializador SerializadorUv.v tester1.v Serializador_tb.v
	vvp serializador
	gtkwave registro.vcd

deserializador:
	iverilog -o deserializador Deserializador.v tester2.v Deserializador_tb.v
	vvp deserializador
	gtkwave registro2.vcd
	
clean:
	rm -f deserializador registro2.vcd
	rm -f serializador registro.vcd
