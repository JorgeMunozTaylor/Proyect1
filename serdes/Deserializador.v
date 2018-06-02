//IE-0523 Circuitos Digitales II
//Proyecto1. Deserializadodor de 8 bits	
//I Ciclo 2018

module deserializador (clk,data,DK,out_DK,out);

	//Entradas
	input clk; 
	input data;
	input DK;
	//Salidas
	output reg		 out_DK ;
	output reg [7:0] out;	//	Data
	//Variables Temporales / Registros Internos

  parameter [7:0] STP = 8'hfb,//Start and End Characters
                  SDP = 8'h5c,//Start and End Characters
                  END = 8'hfd,//Start and End Characters
                  EDB = 8'hfe,//Start and End Characters

                  SKP = 8'h1c,//Ordered-Sets
                  IDL = 8'h7c,//Ordered-Sets
                  FTS = 8'h3c,//Ordered-Sets

                  COM = 8'hbc;//COM

	reg [3:0] counter = 7;
	reg [7:0] temp;
	
	//always @(negedge clk or posedge clk)
	always @(clk)
		if (counter != 7) counter <= counter + 1'b1;
		//Cuenta de 0 a 8.
		else counter <= 0;

	always @(data or counter)
		if (data == COM) temp [7-counter] = data;
		else temp [7-counter] = data;
		
	always @(posedge counter == 0) begin
		out <= temp;
		out_DK <= DK; 	
		end
endmodule
