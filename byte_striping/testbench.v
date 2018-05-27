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
    localparam LANES = `LANES;
    localparam BITS  = `BITS-1; 

    wire                            CLK;
    wire    [BITS:0]                D;
    wire                            DK;
    wire    [BITS:0]                LANE0;
    wire    [BITS:0]                LANE1;
    wire    [BITS:0]                LANE2;
    wire    [BITS:0]                LANE3;
    wire                            o_DK;

    test prueba_bs(
        .CLK    (CLK),
        .D      (D),
        .DK     (DK),
        .LANE0  (LANE0),
        .LANE1  (LANE1),
        .LANE2  (LANE2),
        .LANE3  (LANE3),
        .o_DK   (o_DK)
    );

    byte_strip byte_striping(
        .CLK    (CLK),
        .D      (D),
        .DK     (DK),
        .LANE0  (LANE0),
        .LANE1  (LANE1),
        .LANE2  (LANE2),
        .LANE3  (LANE3),
        .o_DK   (o_DK)
    );

endmodule