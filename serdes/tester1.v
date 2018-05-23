//IE-0523 Circuitos Digitales II
//Proyecto1. Tester de Registro.	
//I Ciclo 2018

//Modulo Tester 
module tester(enb,data,clk,out);
	//Salidas.
	output reg clk,enb;
	output reg [7:0] data;
	input out;

//Señal de Reloj / Frecuencia del reloj
	always #2 clk = !clk;

initial begin
	//Valores Iniciales
	clk =0;
	enb =1;
	
	$display("Inicia Prueba, Cargamos 10001000");
	data = 8'b10001000; // de 8 bits.
	#50; //Retardo
	$finish;
    end
endmodule
