//IE-0523 Circuitos Digitales II
//Proyecto1. Deserializadodor de 8 bits	
//I Ciclo 2018

module deserializador (clk,data,DK,out_DK,out);

	//Entradas
	input clk; 
	input data;
	input DK;
	//Salidas
	output reg		  	 out_DK ;
	output reg [7:0] out;	//	Data
	//Variables Temporales / Registros Internos
	reg [3:0] counter = 7;
	reg [7:0] temp;
	
	//assign out_DK = DK;

	always @(negedge clk or posedge clk)
		if (counter != 7)	counter <= counter + 1'b1;
		//Cuenta de 0 a 8.
		else counter = 0;

	always @(data or counter)
			temp [7-counter] <= data;
		
	always @(posedge counter == 0) begin
		out = temp;
		out_DK <= DK; 	
		end
endmodule
