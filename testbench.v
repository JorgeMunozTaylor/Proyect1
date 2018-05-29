`ifndef INCLUDES_V
    `define INCLUDES_V
    `include "INCLUDES.v"
`endif

module testbench_phy;
    wire [2:0] CLK;
    wire [7:0] d;

    wire [7:0] start_end;
    wire [7:0] ordered_set;
    wire [7:0] log_com;

    wire [1:0] control;
    wire [7:0] data_out;
    wire [7:0] control_out; 

    prueba_phy prueba_PHY(        
        .CLK0           (CLK[0]),//input           CLK0,
        .CLK1           (CLK[1]),//input           CLK1,
        .CLK2           (CLK[2]),//input           CLK2,

        .D              (d),//input  [7:0]    D,
        .START_END      (start_end),//input  [7:0]    START_END,
        .ORDERED_SET    (ordered_set),//input  [7:0]    ORDERED_SET,
        .LOG_COM        (log_com),//input  [7:0]    LOG_COM,

        .CONTROL        (control),//input  [1:0]    CONTROL,
        .DATA_OUT       (data_out),//output [7:0]    DATA_OUT,
        .CONTROL_OUT    (control_out)
    );

    PCIE_PHY pcie_PHY(
        .CLK0           (CLK[0]),//input           CLK0,
        .CLK1           (CLK[1]),//input           CLK1,
        .CLK2           (CLK[2]),//input           CLK2,

        .D              (d),//input  [7:0]    D,
        .START_END      (start_end),//input  [7:0]    START_END,
        .ORDERED_SET    (ordered_set),//input  [7:0]    ORDERED_SET,
        .LOG_COM        (log_com),//input  [7:0]    LOG_COM,

        .CONTROL        (control),//input  [1:0]    CONTROL,
        .DATA_OUT       (data_out),//output [7:0]    DATA_OUT,
        .CONTROL_OUT    (control_out)//output [7:0]    CONTROL_OUT
    );
    
endmodule