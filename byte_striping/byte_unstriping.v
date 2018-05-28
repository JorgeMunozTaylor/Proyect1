//--Jorge Munoz Taylor
`ifndef LANES
    `define LANES 4
`endif

`ifndef BITS
    `define BITS 8
 `endif

module byte_unstrip #(
    parameter LANES = `LANES-1,
    parameter BITS  = `BITS-1
)
(
    input               CLK,
    input   [BITS:0]    LANE0,
    input   [BITS:0]    LANE1,
    input   [BITS:0]    LANE2,
    input   [BITS:0]    LANE3,
    input               DK_0,
    input               DK_1,
    input               DK_2,
    input               DK_3,
    
    output reg [BITS:0]    D,
    output reg             DK
);
    localparam [7:0]    STP     = 8'hfb,
                        SDP     = 8'h5c,
                        END     = 8'hfd,
                        EDB     = 8'hfe,
                        COM     = 8'hbc,
                        SKP     = 8'h1c,
                        IDL     = 8'h7c;

    reg [1:0]       CONTADOR_DE_LANES=0;
    wire [BITS:0]    ACT_LANE [LANES:0];
    wire             ACT_DK   [LANES:0];

    assign  ACT_LANE [0] = LANE0, 
            ACT_LANE [1] = LANE1,
            ACT_LANE [2] = LANE2,
            ACT_LANE [3] = LANE3,
            ACT_DK   [0] = DK_0,
            ACT_DK   [1] = DK_1,
            ACT_DK   [2] = DK_2,
            ACT_DK   [3] = DK_3;

    always @(negedge CLK) 
        if(CONTADOR_DE_LANES <= LANES)  CONTADOR_DE_LANES <= CONTADOR_DE_LANES+1;
        else                            CONTADOR_DE_LANES <= 0;

    always @(posedge CLK) begin
          D  = ACT_LANE[CONTADOR_DE_LANES];
          DK = ACT_DK  [CONTADOR_DE_LANES];
        end

endmodule