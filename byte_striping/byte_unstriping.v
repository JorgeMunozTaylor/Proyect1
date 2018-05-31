//--Jorge Munoz Taylor

module byte_unstrip
(
    input            CLK,
    input   [7:0]    LANE0,
    input   [7:0]    LANE1,
    input   [7:0]    LANE2,
    input   [7:0]    LANE3,
    input            DK_0,
    input            DK_1,
    input            DK_2,
    input            DK_3,
    
    output reg [7:0]    D,
    output reg          DK
);
 
    reg   [1:0] CONTADOR_DE_LANES=2'b11;
    wire  [7:0] ACT_LANE [3:0];   
    reg         ACT_DK   [3:0];

    assign      ACT_LANE[0] = LANE0,
                ACT_LANE[1] = LANE1,
                ACT_LANE[2] = LANE2,
                ACT_LANE[3] = LANE3;

    always @(posedge CLK or negedge CLK) begin
        if( LANE0 || LANE1 || LANE2 || LANE3 )
            CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
        else CONTADOR_DE_LANES = 0;
    end

    always @(posedge CLK or negedge CLK) begin
            if (CONTADOR_DE_LANES!=3) begin
                D  = ACT_LANE[CONTADOR_DE_LANES];
                DK = ACT_DK  [CONTADOR_DE_LANES];
                //CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
            end
        //else CONTADOR_DE_LANES = 0;    
    
    end

endmodule