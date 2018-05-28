//IE-0523 Circuitos Digitales II
//Proyecto1. Serializadodor del Regitro Desplazable de 8 bits	
//I Ciclo 2018
`ifndef 
	`define BITS 8
`endif 

module serializador #(parameter BITS=`BITS-1) (enb,data,clk,DK,out);

	//Entradas // enb =1 palabra valida, enb=0 invalida
	input clk, enb; 
	input [BITS:0] data;	//	Data
	
	//Variables Temporales / Registros Internos
	reg rst=1;
	reg [BITS:0] temp;
	reg [3:0] counter;
	
	//Salida
	output reg out, DK;

//Control del Path.
always @(posedge clk or negedge rst ) begin
	if (rst==1) begin
	temp <= data;
	counter <= 4'b0000;
	end
	//Cuenta de 0 a 8.
	else begin
		out <= temp[7-counter];
		DK	<= enb;
		counter <= counter + 1'b1;
		end
	if (counter == 4'b0111) begin
	rst 	<= 1'b1;		// Restaurar la Cuenta.
	counter <= 4'b0000;
	end
	else
		rst = 0;
end

endmodule

