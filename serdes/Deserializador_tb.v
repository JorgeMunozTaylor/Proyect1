//IE-0523 Circuitos Digitales II
//Proyecto1. Test Bench del Deserializador de 9 bits
//I Ciclo 2018

//Definicion del modulo
module testbench();

wire [7:0] data;
wire enb;
wire out;
wire clk;

//Intanciando Modulos
tester test2(enb,data,clk,out);
deserializador deser1(out,clk,enb,data);

//Resultados en Terminal
initial
  begin
    $dumpfile("registro2.vcd");
    $dumpvars;
    #60 $finish;
  end
endmodule
