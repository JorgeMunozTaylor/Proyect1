//IE-0523 Circuitos Digitales II
//Proyecto1. Deserializadodor de 8 bits	
//I Ciclo 2018

module deserializador(out,clk,enb,data);

	//Entradas 
	input clk;
	input out;
	
	//Variables Temporales / Registros Internos
	reg rst=1;
	reg [7:0] temp;
	reg [3:0] counter;
	
	//Salida
	output reg enb;
	output reg [7:0] data;	//	Data

//Control del Path.
always @(posedge clk or negedge rst ) begin
	if (rst==1) begin
	//temp <= 8'b0000
	counter <= 4'b0000;
	end
	//Cuenta de 0 a 8. //Lectura
	else begin
		temp[counter]<= out;
		counter <= counter + 1'b1;
		end
	if (counter == 4'b0111) begin // Restaurar la Cuenta.
	enb=1;
	rst <= 1'b1;		
	counter <= 4'b0000;
	data <= temp;
	end
	else
		rst = 0;
end

endmodule
