//IE-0523 Circuitos Digitales II
//Proyecto1. Deserializadodor de 8 bits	
//I Ciclo 2018
`ifndef BITS
	`define BITS 8
`endif

module deserializador #(parameter BITS=`BITS-1) (clk,data,DK,out_DK,out);

	//Entradas
	input clk; 
	input data;
	input DK;
	//Salidas
	output reg [BITS:0] out_DK;
	output reg [BITS:0] out;	//	Data

	//Variables Temporales / Registros Internos
	reg [3:0] counter = 0;

always @(negedge clk)
	if(counter<=BITS) counter = counter+1;
	else		      counter = 0;

//Control del Path.
always @(posedge clk) begin
	out   [BITS-counter] = data;
	out_DK[BITS-counter] = DK;
end

endmodule
