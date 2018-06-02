//--Creado por Jorge Munoz Taylor
//--Circuitos digitales 2
//--I-2018

module PCIE_PHY(
    input           CLK0,
    input           CLK1,
    input           CLK2,

    input  [7:0]    D,
    input  [7:0]    START_END,
    input  [7:0]    ORDERED_SET,
    input  [7:0]    LOG_COM,

    input  [1:0]    CONTROL,
    output [7:0]    DATA_OUT,
    output [7:0]    CONTROL_OUT
);
    wire [7:0] cable_d_out;
    wire       cable_valid;

    mux phy_mux (
        .clk        (CLK0), //input clk,
        .control    (CONTROL), //input [1:0] control,

        .D_in       (D), //input [7:0] D_in, 
        .start_end  (START_END), //input [7:0] start_end, //Start and End Characters
        .ordered_set(ORDERED_SET), //input [7:0] ordered_set, //Ordered-Sets
        .logical_COM(LOG_COM), //input [7:0] logical_COM, //COM
  
        .D_out      (cable_d_out), //output reg [7:0] D_out,
        .valid      (cable_valid)  //output reg valid
    );

    byte_strip phy_byte_strip (
        .CLK    (CLK1),     //input                      CLK,
        .D      (cable_d_out),     //input       [BITS:0]       D,
        .DK     (cable_valid),     //input                      DK,

        .LANE0  (cable_lane[0]),     //output      [BITS:0]       LANE0,
        .LANE1  (cable_lane[1]),     //output      [BITS:0]       LANE1,
        .LANE2  (cable_lane[2]),     //output      [BITS:0]       LANE2,
        .LANE3  (cable_lane[3]),     //output      [BITS:0]       LANE3,

        .DK_0       (cable_dk[0]),     //output                     DK_0,
        .DK_1       (cable_dk[1]),     //output                     DK_1,
        .DK_2       (cable_dk[2]),     //output                     DK_2,
        .DK_3       (cable_dk[3])      //output                     DK_3
    );
//**************************************************************
//**************************************************************
    wire [7:0] cable_lane [3:0];
    wire [3:0] cable_dk;
    wire [3:0] temp_datos;
    wire [3:0] temp_dk;
    wire [7:0] cable_datos[3:0]; //Salida del deserializador
    wire       cable_dk_o [3:0];

    genvar i;
    generate
        for (i=0; i<4; i=i+1) begin
            serializador phy_serializador (
                .enb    (cable_dk   [i]),
                .data   (cable_lane [i]),
                .clk    (CLK2),
                .DK     (temp_dk [i]),
                .out    (temp_datos[i])
            );

            deserializador phy_deserializador (
                .clk    (CLK2),
                .data   (temp_datos[i]),
                .DK     (temp_dk [i]),
                .out_DK (cable_dk_o [i]),
                .out    (cable_datos[i])
            );
        end
    endgenerate
//**************************************************************
//**************************************************************

    wire [7:0] o_D;
    wire       o_DK;

    byte_unstrip phy_byte_unstrip (
        .CLK    (CLK1),        //input               CLK,
        .LANE0  (cable_datos[0]),            //input   [BITS:0]    LANE0,
        .LANE1  (cable_datos[1]),      //input   [BITS:0]    LANE1,
        .LANE2  (cable_datos[2]),      //input   [BITS:0]    LANE2,
        .LANE3  (cable_datos[3]),      //input   [BITS:0]    LANE3,

        .DK_0   (cable_dk_o [0]),     //input               DK_0,
        .DK_1   (cable_dk_o [1]),     //input               DK_1,
        .DK_2   (cable_dk_o [2]),     //input               DK_2,
        .DK_3   (cable_dk_o [3]),     //input               DK_3,
    
        .D      (o_D),  //output reg [BITS:0]    D,
        .DK     (o_DK)   //output reg             DK
);

    demux phy_demux (
        .valid_in   (o_DK),        //input valid_in,
        .data_in    (o_D),    //input [7:0] data_in,
        .clk        (CLK0),   //input clk,

        .data_out   (DATA_OUT),     //output reg [7:0] data_out,
        .control    (CONTROL_OUT)    //output reg [7:0] control
  );

endmodule