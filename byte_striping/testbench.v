//--Jorge Munoz Taylor
`ifndef BYTE_STRIPING_V
    `define BYTE_STRIPING_V
    `include "byte_striping.v"
`endif

`ifndef TEST_V
    `define TEST_V
    `include "test.v"
`endif

`ifndef TIMESCALE
    `define TIMESCALE
    `timescale 1ns/1ps
`endif

module tb;
    localparam  LANES = `LANES;

    wire            CLK;
    wire    [7:0]   D;
    wire            DK;
    wire    [7:0]   LANE [LANES:0];
    wire            o_DK;

    test prueba_bs(
        .CLK    (CLK),
        .D      (D),
        .DK     (DK),
        .LANE   (LANE),
        .o_DK   (o_DK)
    );

    byte_strip(
        .CLK    (CLK),
        .D      (D),
        .DK     (DK),
        .LANE   (LANE),
        .o_DK   (o_DK)
    );

endmodule