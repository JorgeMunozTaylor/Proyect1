//--Jorge Munoz Taylor
`ifndef LANES
    `define LANES 4
`endif

`ifndef BITS
    `define BITS 8
 `endif

module byte_strip #(
    parameter LANES = `LANES,
    parameter BITS  = `BITS-1
)
(
    input                               CLK,
    input      [BITS:0]                 D,
    input                               DK,
    output reg    [BITS:0]              LANE0,
    output reg    [BITS:0]              LANE1,
    output reg    [BITS:0]              LANE2,
    output reg    [BITS:0]              LANE3,
    output                              o_DK
);

    localparam [7:0]    STP     = 8'hfb,
                        SDP     = 8'h5c,
                        END     = 8'hfd,
                        EDB     = 8'hfe,
                        COM     = 8'hbc,
                        SKP     = 8'h1c,
                        IDL     = 8'h7c;

    reg          CONTADOR_DE_LANES = 0;
    reg [BITS:0] ACT_LANE;
    
    integer      CONTADOR;

    assign o_DK = DK;

    always @(posedge CLK) 
        if(CONTADOR_DE_LANES < LANES)   CONTADOR_DE_LANES <= CONTADOR_DE_LANES+1;
        else                            CONTADOR_DE_LANES <= 0;

    always @(posedge CLK)
        case(CONTADOR_DE_LANES)
            0: LANE0 <= ACT_LANE; 
            1: LANE1 <= ACT_LANE;
            2: LANE2 <= ACT_LANE;
            3: LANE3 <= ACT_LANE;
        endcase

    always @(posedge CLK)   
        case(D)
            STP: if(CONTADOR_DE_LANES == 0) 
                    if (DK == 0)
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];

                    else begin 
                        $display("ERROR: DK debe ser 0 en el START");
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
                        end
                 else   begin 
                        $display("ERROR: STP solo puede ir en el lane 0");
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
                        end

            SDP: if(CONTADOR_DE_LANES == 0) 
                    if (DK == 0)
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
              
                    else begin 
                        $display("ERROR: DK debe ser 0 en el START");
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
                        end

                 else begin 
                    $display("ERROR: SDP solo puede ir en el lane 0");
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
                    end

            END: if(CONTADOR_DE_LANES == LANES-1) 
                    if (DK == 0) 
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
      
                    else begin 
                        $display("ERROR: DK debe ser 0 en el END");
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
                        end
                 else begin 
                    $display("ERROR: END solo puede ir en el lane %d",LANES);
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
                    end

            EDB: if(CONTADOR_DE_LANES == LANES-1)
                    if (DK == 0) begin
                        ACT_LANE [CONTADOR] = D[CONTADOR];
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
                        end
                    else begin 
                        $display("ERROR: DK debe ser 0 en el END.");
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
                        end
                 else begin 
                    $display("ERROR: EDB solo puede ir en el lane %d",LANES);
                    for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                        ACT_LANE [CONTADOR] = D[CONTADOR];
                    end

            SKP: if (DK == 1)
                    for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                        ACT_LANE [CONTADOR] = D[CONTADOR];
   
                 else begin 
                    $display("ERROR: DK debe ser 1 en los D.");
                    for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                        ACT_LANE [CONTADOR] = D[CONTADOR];
                    end

            IDL: if (DK == 1)
                    for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                        ACT_LANE [CONTADOR] = D[CONTADOR];
      
                 else begin 
                    $display("ERROR: DK debe ser 1 en los D.");
                    for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                        ACT_LANE [CONTADOR] = D[CONTADOR];
                    end
            
            default: if(DK == 1)
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
      
                    else begin 
                        $display("ERROR: DK debe ser 1 en los D.");
                        for (CONTADOR=0; CONTADOR<=BITS; CONTADOR=CONTADOR+1)
                            ACT_LANE [CONTADOR] = D[CONTADOR];
                        end
            endcase 

endmodule