//--Jorge Munoz Taylor

module byte_strip
(
    input               CLK,
    input       [7:0]   D,
    input               DK,
    output reg  [7:0]   LANE0,
    output reg  [7:0]   LANE1,
    output reg  [7:0]   LANE2,
    output reg  [7:0]   LANE3,
    output reg          DK_0=0,
    output reg          DK_1=0,
    output reg          DK_2=0,
    output reg          DK_3=0
);
    localparam [7:0]    STP     = 8'hfb,
                        SDP     = 8'h5c,
                        END     = 8'hfd,
                        EDB     = 8'hfe,
                        COM     = 8'hbc,
                        SKP     = 8'h1c,
                        IDL     = 8'h7c;

    reg [1:0]   CONTADOR_DE_LANES = 2'b11;
    reg [7:0]   ACT_LANE [3:0];
    reg [3:0]   ACT_DK = 0;

    always @(negedge CONTADOR_DE_LANES == 2'b11) begin
        LANE0 <= ACT_LANE [0];
        LANE1 <= ACT_LANE [1];
        LANE2 <= ACT_LANE [2];
        LANE3 <= ACT_LANE [3];

        DK_0  <= ACT_DK   [0];
        DK_1  <= ACT_DK   [1];
        DK_2  <= ACT_DK   [2];
        DK_3  <= ACT_DK   [3];
    end
    
    always @(D!=D)
        if(CONTADOR_DE_LANES <=3 )  CONTADOR_DE_LANES <= CONTADOR_DE_LANES+1;
        else                        CONTADOR_DE_LANES <= 0; 
    
    always @(negedge CLK or posedge CLK) //begin
        
        case(CONTADOR_DE_LANES)
            2'b00: begin
                ACT_LANE[0] <= D;
                ACT_DK  [0] <= DK;
                end

            2'b01: begin
                ACT_LANE[1] <= D;
                ACT_DK  [1] <= DK;
                end

            2'b10: begin
                ACT_LANE[2] <= D;
                ACT_DK  [2] <= DK;
                end

            2'b11: begin
                ACT_LANE[3] <= D;
                ACT_DK  [3] <= DK;
                end

            default:    begin
                        ACT_LANE[0] <= ACT_LANE[0];
                        ACT_LANE[1] <= ACT_LANE[1];
                        ACT_LANE[2] <= ACT_LANE[2];
                        ACT_LANE[3] <= ACT_LANE[3];
                        ACT_DK   <= ACT_DK;
                        end
        endcase
           
endmodule