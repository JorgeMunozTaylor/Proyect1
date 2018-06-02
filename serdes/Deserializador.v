//--Creado por Jorge Munoz Taylor
//--Circuitos digitales 2
//--I-2018

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
	reg [3:0] cable_counter = 7;
	reg 	  count=0; //Permite visualizar COUNTER como un reloj
	reg [7:0] temp;

	always @* counter = cable_counter;

//*****************************************************
	always @(posedge clk)
		if (counter != 7) begin
			cable_counter <= cable_counter + 1'b1;
			count = !count;
			end
		//Cuenta de 0 a 8.
		else begin 
			cable_counter <= 0;
			count =!count;
		end

	always @(negedge clk)
		if (counter != 7) begin
			cable_counter <= cable_counter + 1'b1;
			count = !count;
			end
		//Cuenta de 0 a 8.
		else begin 
			cable_counter <= 0;
			count =!count;
		end
//*****************************************************

	always @(posedge data)
		temp [7-counter] = data;
		
	always @(negedge data)
		temp [7-counter] = data;
	
	always @(posedge count)
		temp [7-counter] = data;
		
	always @(negedge count)
		temp [7-counter] = data;

//*****************************************************		
	always @(posedge counter == 0) begin
		out <= temp;
		out_DK <= DK; 	
		end

endmodule
