//IE-0523 Circuitos Digitales II
//Proyecto1. Tester de Registro.	
//I Ciclo 2018
`ifndef BITS
	`define BITS 8
`endif
//Modulo Tester 
module tester #(parameter BITS =`BITS-1) (clk,data,DK,out_DK,out);

	//Entradas.
	input out_DK;
	input [BITS:0] out;
	//Salidas.
	output reg clk,DK;
	output reg data;
	
//Señal de Reloj / Frecuencia del reloj
	always #2 clk = !clk;

initial begin
	//Valores Iniciales
	clk =0;
	//Carga de los 8 bits serializados con 1 unidad de tiempo entre ellos.
	$display("Inicia Prueba, Cargamos 10001000");
	data =0;
	#1;
	data =0;
	#2;
	data =0;
	#2;
	data =1;
	#2;
	data =0;
	#2;
	data =0;
	#2;
	data =0;
	#2;
	data =1;
	#2;
	data =0;
	#60; //Retardo
	$finish;
    end

initial begin
	DK =1;/*
	#1;
	DK =0;
	#2;
	DK =0;
	#2;
	DK =1;
	#2;
	DK =0;
	#2;
	DK =0;
	#2;
	DK =0;
	#2;
	DK =1;
	#2;
	DK =0;*/
	#60; 
end
endmodule
