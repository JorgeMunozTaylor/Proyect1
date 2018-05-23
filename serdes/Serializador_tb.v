//IE-0523 Circuitos Digitales II
//Proyecto1. Test Bench del Serializador de 9 bits
//I Ciclo 2018

//Definicion del modulo
module testbench();

wire [7:0] data;
wire enb;
wire out;
wire clk;

//Intanciando Modulos
tester test1(enb,data,clk,out);
serializador ser1(enb,data,clk,out);

//Resultados en Terminal
initial
  begin
    $dumpfile("registro.vcd");
    $dumpvars;
    //$display ("time\t clk enb  data  out");
    //$monitor ("%g\t    %b  %b  %b  %b ");
    //$time(clk, enb, data, out);
    #50 $finish;
  end
endmodule
