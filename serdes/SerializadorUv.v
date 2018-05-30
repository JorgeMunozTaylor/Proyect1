//IE-0523 Circuitos Digitales II
//Proyecto1. Serializadodor del Regitro Desplazable de 8 bits	
//I Ciclo 2018

module serializador (enb,data,clk,DK,out);

	//Entradas // enb =1 palabra valida, enb=0 invalida
	input clk, enb; 
	input [7:0] data;	//	Data
	//Salida
	output reg out;
	output DK;

	//Variables Temporales / Registros Internos
	reg [3:0] counter = 7;

	assign DK = enb;
//Control del Path.
always @(negedge clk or posedge clk)
	if (counter != 7)	counter <= counter + 1'b1;
	//Cuenta de 0 a 8.
	else counter = 0;

	always @(data or counter)
		out <= data[7-counter];
		
endmodule

