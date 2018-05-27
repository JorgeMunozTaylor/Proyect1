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
    output                     o_DK
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

    assign  o_DK  = DK,
            LANE0 = ACT_LANE [0], 
            LANE1 = ACT_LANE [1],
            LANE2 = ACT_LANE [2],
            LANE3 = ACT_LANE [3];

    always @(negedge CLK) 
        if(CONTADOR_DE_LANES <= LANES)  CONTADOR_DE_LANES <= CONTADOR_DE_LANES+1;
        else                            CONTADOR_DE_LANES <= 0;

    always @(posedge CLK) 
        if      (CONTADOR_DE_LANES==2'b00 && D==STP)        ACT_LANE[CONTADOR_DE_LANES] = D;
        else if (CONTADOR_DE_LANES==2'b00 && D==SDP)        ACT_LANE[CONTADOR_DE_LANES] = D;
        else if (CONTADOR_DE_LANES==LANES && D==END)  ACT_LANE[CONTADOR_DE_LANES] = D;
        else if (CONTADOR_DE_LANES==LANES && D==EDB)  ACT_LANE[CONTADOR_DE_LANES] = D;

        else if (CONTADOR_DE_LANES==2'b00    && D!=STP && D!=SDP && D!=END && D!=EDB)        
            ACT_LANE[CONTADOR_DE_LANES] = D;
        else if (CONTADOR_DE_LANES==LANES && D!=STP && D!=SDP && D!=END && D!=EDB)  
            ACT_LANE[CONTADOR_DE_LANES] = D;

        else if (CONTADOR_DE_LANES!=2'b00 && CONTADOR_DE_LANES != LANES)          
            ACT_LANE[CONTADOR_DE_LANES] = (
                                            D!=STP ||
                                            D!=SDP ||
                                            D!=END ||
                                            D!=EDB 
                                            )?D:IDL;
    
  




    /*     
    always @(posedge CLK)   
        case(D)
            STP: if(CONTADOR_DE_LANES == 0) 
                    if (DK == 0)
                        ACT_LANE[CONTADOR_DE_LANES] = D;

                    else begin 
                        $display("ERROR: DK debe ser 0 en el START");
                        $finish;
                        end
                 else   begin 
                        $display("ERROR: STP solo puede ir en el lane 0");
                        $finish;
                        end

            SDP: if(CONTADOR_DE_LANES == 0) 
                    if (DK == 0)
                        ACT_LANE[CONTADOR_DE_LANES] = D;
              
                    else begin 
                        $display("ERROR: DK debe ser 0 en el START");
                        $finish;
                        end

                 else begin 
                    $display("ERROR: SDP solo puede ir en el lane 0");
                    $finish;
                    end

            END: if(CONTADOR_DE_LANES == LANES-1) 
                    if (DK == 0)
                        ACT_LANE[CONTADOR_DE_LANES] = D; 
      
                    else begin 
                        $display("ERROR: DK debe ser 0 en el END");
                        $finish;
                        end

                 else begin 
                    $display("ERROR: END solo puede ir en el lane %d",LANES);
                    $finish;
                    end

            EDB: if(CONTADOR_DE_LANES == LANES-1)
                    if (DK == 0)
                        ACT_LANE[CONTADOR_DE_LANES] = D;

                    else begin 
                        $display("ERROR: DK debe ser 0 en el END.");
                        $finish;
                        end
                 else begin 
                    $display("ERROR: EDB solo puede ir en el lane %d",LANES);
                    $finish;
                    end

            SKP: if (DK == 1)
                    ACT_LANE[CONTADOR_DE_LANES] = D;
   
                 else begin 
                    $display("ERROR: DK debe ser 1 en los D.");
                    $finish;
                    end

            IDL: if (DK == 1)
                        ACT_LANE[CONTADOR_DE_LANES] = D;
      
                 else begin 
                    $display("ERROR: DK debe ser 1 en los D.");
                    $finish;
                    end
            
            default: if(DK == 1)
                        ACT_LANE[CONTADOR_DE_LANES] = D;
      
                    else begin 
                        $display("ERROR: DK debe ser 1 en los D.");
                        $finish;
                        end
            endcase 
*/
endmodule