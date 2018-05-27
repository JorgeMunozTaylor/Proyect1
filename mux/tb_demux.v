`include "demux.v"
`include "prueba_demux.v"
//`include "generador_d_demux.v"

module tb;

    wire [7:0] D, D_dm, control;
    wire clk_1m, clk_250k, valid;

    demux dm(
        .valid_in(valid),
        .data_in(D),
        .clk(clk_1m),
        .data_out(D_dm),
        .control(control)
    );

    prueba_demux pdm(
        .control(control),
        .data_dm(D_dm),
        .data(D),
        .valid(valid),
        .clk_1m(clk_1m),
        .clk_250k(clk_250k)
    );
    /*
    generador_d_demux gdm(
        .clk(clk_250k),
        .valid(valid),
        .data(D)
    );*/


endmodule