//--Creado por Jorge Munoz Taylor
//--Circuitos digitales 2
//--I-2018

`ifndef TIMESCALE
    `define TIMESCALE
    `timescale 1ns/1ps
`endif

`ifndef BYTE_STRIPING_V
    `define BYTE_STRIPING_V
    `include "byte_striping.v"
`endif

`ifndef BYTE_UNSTRIPING_V
    `define BYTE_UNSTRIPING_V
    `include "byte_unstriping.v"
`endif

`ifndef TEST_V
    `define TEST_V
    `include "test.v"
`endif


module tb;

    wire                CLK;
    wire    [7:0]    D;
    wire                DK;
    wire    [7:0]    LANE0;
    wire    [7:0]    LANE1;
    wire    [7:0]    LANE2;
    wire    [7:0]    LANE3;
    wire                DK_0;
    wire                DK_1;
    wire                DK_2;
    wire                DK_3;

    wire    [7:0]    u_d;
    wire                u_dk;

    test prueba_bs(
        .CLK    (CLK),
        .D      (D),
        .DK     (DK),
        .LANE0  (LANE0),
        .LANE1  (LANE1),
        .LANE2  (LANE2),
        .LANE3  (LANE3),
        .DK_0   (DK_0),
        .DK_1   (DK_1),
        .DK_2   (DK_2),
        .DK_3   (DK_3),
        .U_D    (u_d),
        .U_DK   (u_dk)
    );

    byte_strip byte_striping(
        .CLK    (CLK),
        .D      (D),
        .DK     (DK),
        .LANE0  (LANE0),
        .LANE1  (LANE1),
        .LANE2  (LANE2),
        .LANE3  (LANE3),
        .DK_0   (DK_0),
        .DK_1   (DK_1),
        .DK_2   (DK_2),
        .DK_3   (DK_3)
    );

    byte_unstrip byte_unstriping(
        .CLK    (CLK),
        .LANE0  (LANE0),
        .LANE1  (LANE1),
        .LANE2  (LANE2),
        .LANE3  (LANE3),
        .DK_0   (DK_0),
        .DK_1   (DK_1),
        .DK_2   (DK_2),
        .DK_3   (DK_3),
    
        .D    (u_d),
        .DK   (u_dk)
    );

endmodule