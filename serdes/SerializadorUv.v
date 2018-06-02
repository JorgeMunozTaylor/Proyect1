//IE-0523 Circuitos Digitales II
//Proyecto1. Serializadodor del Regitro Desplazable de 8 bits	
//I Ciclo 2018
//--Modificado por Jorge Munoz Taylor


module serializador (enb,data,clk,DK,out);

	//Entradas // enb =1 palabra valida, enb=0 invalida
	input clk, enb; 
	input [7:0] data;	//	Data
	//Salida
	output reg out;
	output DK;

	//Variables Temporales / Registros Internos
	reg [3:0] counter = 7;
	reg [3:0] cable_counter = 7;
	reg 	  count=0; //Permite visualizar COUNTER como un reloj
	reg 	  countdata=1;
	reg 	  temp;

	assign DK = enb;
	always @* counter = cable_counter;

//Control del Path.
//**************************************************
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
		
//****************************************************
always @* out <= data[7-counter];

//****************************************************
always @(posedge count) begin
	out <= data[7-counter];
	if(counter==0) countdata=!countdata;
	if(counter==7) countdata=!countdata;
	end

always @(negedge count) out <= data[7-counter];
	
//*****************************************************
		
endmodule

