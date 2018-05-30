//--Jorge Munoz Taylor

module byte_strip
(
    input               CLK,
    input       [7:0]   D,
    input               DK,
    output reg  [7:0]   LANE0=0,
    output reg  [7:0]   LANE1=0,
    output reg  [7:0]   LANE2=0,
    output reg  [7:0]   LANE3=0,
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
    reg [1:0]   temp = 0;
   
    always @(posedge CONTADOR_DE_LANES or negedge CONTADOR_DE_LANES) begin
        LANE0 <= ACT_LANE [0];
        LANE1 <= ACT_LANE [1];
        LANE2 <= ACT_LANE [2];
        LANE3 <= ACT_LANE [3];

        DK_0  <= ACT_DK   [0];
        DK_1  <= ACT_DK   [1];
        DK_2  <= ACT_DK   [2];
        DK_3  <= ACT_DK   [3];
    end
    
    always @(D) begin
            ACT_LANE[temp] = D;
            ACT_DK  [temp] = DK;
            if (temp <= 3)  temp = temp+1;
            else temp = 0;
        end

    always @(posedge CLK or negedge CLK) begin
        if(CONTADOR_DE_LANES<=3) CONTADOR_DE_LANES <= CONTADOR_DE_LANES+1;
        else CONTADOR_DE_LANES = 0;        
    end
              
endmodule