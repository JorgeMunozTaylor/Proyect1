//--Jorge Munoz Taylor
`ifndef LANES
    `define LANES 4
`endif

`ifndef BITS
    `define BITS 8
 `endif

module byte_strip #(
    parameter LANES = `LANES-1,
    parameter BITS  = `BITS-1
)
(
    input                      CLK,
    input       [BITS:0]       D,
    input                      DK,
    output      [BITS:0]       LANE0,
    output      [BITS:0]       LANE1,
    output      [BITS:0]       LANE2,
    output      [BITS:0]       LANE3,
    output                     DK_0,
    output                     DK_1,
    output                     DK_2,
    output                     DK_3
);

    localparam [7:0]    STP     = 8'hfb,
                        SDP     = 8'h5c,
                        END     = 8'hfd,
                        EDB     = 8'hfe,
                        COM     = 8'hbc,
                        SKP     = 8'h1c,
                        IDL     = 8'h7c;

    reg [1:0]       CONTADOR_DE_LANES=0;
    reg [BITS:0]    ACT_LANE [LANES:0];
    reg             ACT_DK   [LANES:0];

    assign  LANE0 = ACT_LANE [0], 
            LANE1 = ACT_LANE [1],
            LANE2 = ACT_LANE [2],
            LANE3 = ACT_LANE [3],
            DK_0  = ACT_DK   [0],
            DK_1  = ACT_DK   [1],
            DK_2  = ACT_DK   [2],
            DK_3  = ACT_DK   [3];

    always @(negedge CLK) 
        if(CONTADOR_DE_LANES <= LANES)  CONTADOR_DE_LANES <= CONTADOR_DE_LANES+1;
        else                            CONTADOR_DE_LANES <= 0;

    always @(posedge CLK)
        case(DK) 
            0:  if ( CONTADOR_DE_LANES==2'b00 && (D==STP || D==SDP) )      begin
                    ACT_LANE[CONTADOR_DE_LANES] = D;
                    ACT_DK  [CONTADOR_DE_LANES] = DK;
                    end

                else if ( CONTADOR_DE_LANES==2'b00 && (D!=STP || D!=SDP) ) begin
                    $display ("ERROR 1 %dns", $time);
                    $finish;
                    end

                else if ( CONTADOR_DE_LANES==LANES && (D==END || D==EDB) ) begin
                    ACT_LANE[CONTADOR_DE_LANES] = D;
                    ACT_DK  [CONTADOR_DE_LANES] = DK;
                    end

                else if ( CONTADOR_DE_LANES==LANES && (D!=END || D!=EDB) ) begin
                    $display ("ERROR 2 %dns", $time);
                    $finish;
                    end

            1: if (D!=STP && D!=SDP && D!=END && D!=EDB) begin
                    ACT_LANE[CONTADOR_DE_LANES] = D;
                    ACT_DK  [CONTADOR_DE_LANES] = DK;
                    end 
                else begin
                    $display ("ERROR 3 %dns", $time);
                    $finish;
                    end
    
        endcase

endmodule