//IE-0523 Circuitos Digitales II
//Proyecto1. Test Bench del Deserializador de 9 bits
//I Ciclo 2018
`ifndef BITS
	`define BITS 8
`endif
//Definicion del modulo
module testbench();

localparam BITS = `BITS-1;

wire data;
wire [BITS:0] out_DK;
wire [BITS:0] out;
wire clk;
wire DK;
//Intanciando Modulos
tester test2(clk,data,DK,out_DK,out);
deserializador deser1(clk,data,DK,out_DK,out);

//Resultados en Terminal
initial
  begin
    $dumpfile("registro2.vcd");
    $dumpvars;
    #60 $finish;
  end
endmodule
