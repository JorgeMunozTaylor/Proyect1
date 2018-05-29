//IE-0523 Circuitos Digitales II
//Proyecto1. Deserializadodor de 8 bits	
//I Ciclo 2018

module deserializador (clk,data,DK,out_DK,out);

	//Entradas
	input clk; 
	input data;
	input DK;
	//Salidas
	output reg  	 out_DK;
	output reg [7:0] out;	//	Data

	//Variables Temporales / Registros Internos
	reg [3:0] counter = 0;

always @(negedge clk)
	if(counter<=7) counter = counter+1;
	else		      counter = 0;

//Control del Path.
always @(posedge clk) begin
	out   [7-counter] = data;
	out_DK = DK;
end

endmodule
