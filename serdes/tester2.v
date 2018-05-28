//IE-0523 Circuitos Digitales II
//Proyecto1. Tester de Registro.	
//I Ciclo 2018

//Modulo Tester 
module tester(enb,data,clk,out);

	//Entradas.
	input [7:0] data;
	input enb;
	//Salidas.
	output reg clk,out;
	
//Señal de Reloj / Frecuencia del reloj
	always #2 clk = !clk;

initial begin
	//Valores Iniciales
	clk =0;
	//Carga de los 8 bits serializados con 1 unidad de tiempo entre ellos.
	$display("Inicia Prueba, Cargamos 10001000");
	out =0;
	#1
	out =0;
	#2
	out =0;
	#2
	out =1;
	#2
	out =0;
	#2
	out =0;
	#2
	out =0;
	#2
	out =1;
	#2
	out =0;
	#60; //Retardo
	$finish;
    end
endmodule
