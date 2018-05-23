//IE-0523 Circuitos Digitales II
//Proyecto1. Serializadodor del Regitro Desplazable de 8 bits	
//I Ciclo 2018

module serializador(rst,enb,data,clk,out, tx_frame_started);

	//Entradas // enb =1 palabra valida, enb=0 invalida
	input clk, enb, rst; 
	input reg [7:0] data;	//	Data
	
	//Variables Temporales / Registros Internos
	reg [8:0] temp;
	reg [3:0] counter;
	
	//Salida
	output reg out;
	output reg tx_frame_started;
	
//Control del Path.
always @(posedge clk, posedge rst ) begin
	if (rst) begin
	counter <= 4'b0000;
	tx_frame_started <= 1'b0;
	end
	//tx_frame_started puede ser 1 después que el contador es zero
	else if (counter == 4'b0)begin
	tx_frame_started <= 1'b1;
	counter <= counter + 1'b1;
	end
	//Cuenta de 0 a 8.
	else if (counter < 4'b1000) begin
	tx_frame_started <= 1'b0;
	counter <= counter + 1'b1;
	end
	// Restaurar la Cuenta.
	else
	begin
	counter <= 4'b0000;
	tx_frame_started <= 1'b0;
	end
end


//Data Path.
always @(posedge clk, posedge rst) begin
	if (rst)
	temp <= 8'h00;
	else
	if (tx_frame_started)
	temp <= data;
	else
	temp <= {1'b0, temp[6:1]};
end


//Datos serializados.
assign out = temp[0];
