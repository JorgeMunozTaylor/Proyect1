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
    output reg          DK_3=0,
    output reg          ERROR_DLL = 0 //Registro de error al DLL
);
  parameter [7:0] STP = 8'hfb,//Start and End Characters
                  SDP = 8'h5c,//Start and End Characters
                  END = 8'hfd,//Start and End Characters
                  EDB = 8'hfe,//Start and End Characters

                  SKP = 8'h1c,//Ordered-Sets
                  IDL = 8'h7c,//Ordered-Sets
                  FTS = 8'h3c,//Ordered-Sets

                  COM = 8'hbc;//COM

    reg [9:0]   div_frec;
    reg [7:0]   ACT_LANE [3:0];
    reg         n_CLK;
    reg [1:0]   CONTADOR_DE_LANES = 2'b11;
    reg [3:0]   ACT_DK            = 0;
    integer i;

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
    
    always @(CLK) begin//(posedge CLK or negedge CLK) begin //Multiplicador de frecuencias
        div_frec = 0;
        n_CLK    = 0;

        for(i=0;i<=498;i=i+1)
        if(div_frec!=499) begin
            #4 div_frec <= div_frec + 1;
            n_CLK       <= !n_CLK;
            end    
    end
           
    always @(div_frec)//(negedge div_frec or posedge div_frec)
        if     (div_frec == 0)   CONTADOR_DE_LANES <= CONTADOR_DE_LANES+1;
        else if(div_frec == 125) CONTADOR_DE_LANES <= CONTADOR_DE_LANES+1;
        else if(div_frec == 250) CONTADOR_DE_LANES <= CONTADOR_DE_LANES+1;
        else if(div_frec == 375) CONTADOR_DE_LANES <= CONTADOR_DE_LANES+1;
      
    always @(CONTADOR_DE_LANES)
    if(D!=COM || D!=SKP || D!=IDL || D!=FTS)
        case(CONTADOR_DE_LANES)
            2'b00: begin
                ACT_LANE[0] = D;
                ACT_DK  [0] = DK;
            end

            2'b01: begin
                ACT_LANE[1] = D;
                ACT_DK  [1] = DK;
            end

            2'b10: begin
                ACT_LANE[2] = D;
                ACT_DK  [2] = DK;
            end

            2'b11: begin
                ACT_LANE[3] = D;
                ACT_DK  [3] = DK;
            end
        endcase       
    else begin
        if (D==COM) begin
                        ACT_LANE[0] <= COM;
                        ACT_LANE[1] <= COM;
                        ACT_LANE[2] <= COM;
                        ACT_LANE[3] <= COM;
                    end

        else if(D==SKP) begin
                        ACT_LANE[0] <= SKP;
                        ACT_LANE[1] <= SKP;
                        ACT_LANE[2] <= SKP;
                        ACT_LANE[3] <= SKP;
                        end

        else if(D==IDL) begin
                        ACT_LANE[0] <= IDL;
                        ACT_LANE[1] <= IDL;
                        ACT_LANE[2] <= IDL;
                        ACT_LANE[3] <= IDL;
                        end

        else if(D==FTS) begin
                        ACT_LANE[0] <= FTS;
                        ACT_LANE[1] <= FTS;
                        ACT_LANE[2] <= FTS;
                        ACT_LANE[3] <= FTS;
                        end
    end

endmodule