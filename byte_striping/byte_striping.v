//--Creado por Jorge Munoz Taylor
//--Circuitos digitales 2
//--I-2018

module byte_strip
(
    input               CLK,
    input       [7:0]   D,
    input               DK,

    output reg  [7:0]   LANE0,
    output reg  [7:0]   LANE1,
    output reg  [7:0]   LANE2,
    output reg  [7:0]   LANE3,
    output reg          DK_0,
    output reg          DK_1,
    output reg          DK_2,
    output reg          DK_3
);

    reg [7:0]   ACT_LANE [3:0];
    reg [3:0]   ACT_DK;    
    reg [1:0]   CONTADOR_DE_LANES=0 ;//= 2'b11;
    reg         count             = 0;//1;
    integer     i;

//********************************************************

    always @(posedge CLK)   
        begin
            LANE0 <= ACT_LANE [0];
            LANE1 <= ACT_LANE [1];
            LANE2 <= ACT_LANE [2];
            LANE3 <= ACT_LANE [3];

            DK_0  <= ACT_DK   [0];
            DK_1  <= ACT_DK   [1];
            DK_2  <= ACT_DK   [2];
            DK_3  <= ACT_DK   [3];
        end

    always @(negedge CLK)  
        begin
            LANE0 <= ACT_LANE [0];
            LANE1 <= ACT_LANE [1];
            LANE2 <= ACT_LANE [2];
            LANE3 <= ACT_LANE [3];

            DK_0  <= ACT_DK   [0];
            DK_1  <= ACT_DK   [1];
            DK_2  <= ACT_DK   [2];
            DK_3  <= ACT_DK   [3];
        end
//********************************************************

    always @(posedge CLK) 
        for(i=0;i<4;i=i+1) begin
            #500 CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
            count = !count;
        end

    always @(negedge CLK) 
        for(i=0;i<4;i=i+1) begin
            #500 CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
            count = !count;
        end
//********************************************************
    always @(posedge count)

    if (DK==1) 
    begin
            if(CONTADOR_DE_LANES==2'b01) begin
                ACT_LANE[0] <= D;
                ACT_DK  [0] <= 1;
            end

            else if(CONTADOR_DE_LANES==2'b10) begin
                ACT_LANE[1] = D;
                ACT_DK  [1] = 1;
            end

            else if(CONTADOR_DE_LANES==2'b11) begin
                ACT_LANE[2] = D;
                ACT_DK  [2] = 1;
            end

            else if(CONTADOR_DE_LANES==2'b00) begin
                ACT_LANE[3] = D;
                ACT_DK  [3] = 1;
            end
    end
    else
            if(CONTADOR_DE_LANES==2'b01) begin
                ACT_LANE[0] <= D;
                ACT_DK  [0] <= 0;
            end

            else if(CONTADOR_DE_LANES==2'b10) begin
                ACT_LANE[1] = D;
                ACT_DK  [1] = 0;
            end

            else if(CONTADOR_DE_LANES==2'b11) begin
                ACT_LANE[2] = D;
                ACT_DK  [2] = 0;
            end

            else if(CONTADOR_DE_LANES==2'b00) begin
                ACT_LANE[3] = D;
                ACT_DK  [3] = 0;
            end      

    always @(negedge count)

    if (DK==1) 
    begin
            if(CONTADOR_DE_LANES==2'b01) begin
                ACT_LANE[0] <= D;
                ACT_DK  [0] <= 1;
            end

            else if(CONTADOR_DE_LANES==2'b10) begin
                ACT_LANE[1] = D;
                ACT_DK  [1] = 1;
            end

            else if(CONTADOR_DE_LANES==2'b11) begin
                ACT_LANE[2] = D;
                ACT_DK  [2] = 1;
            end

            else if(CONTADOR_DE_LANES==2'b00) begin
                ACT_LANE[3] = D;
                ACT_DK  [3] = 1;
            end
    end
    else
            if(CONTADOR_DE_LANES==2'b01) begin
                ACT_LANE[0] <= D;
                ACT_DK  [0] <= 0;
            end

            else if(CONTADOR_DE_LANES==2'b10) begin
                ACT_LANE[1] = D;
                ACT_DK  [1] = 0;
            end

            else if(CONTADOR_DE_LANES==2'b11) begin
                ACT_LANE[2] = D;
                ACT_DK  [2] = 0;
            end

            else if(CONTADOR_DE_LANES==2'b00) begin
                ACT_LANE[3] = D;
                ACT_DK  [3] = 0;
            end      
    
endmodule