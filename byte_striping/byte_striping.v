//--Jorge Munoz Taylor

module byte_strip #(
    parameter LANES = 4,
    parameter BITS  = 7
)
(
    input                           CLK,
    input      [BITS:0]             D,
    input                           DK,
    output reg [BITS*LANES -1:0]    LANE,
    output reg                      o_DK
);

    localparam [7:0]    STP     = 8'hfb,
                        SDP     = 8'h5c,
                        END     = 8'hfd,
                        EDB     = 8'hfe,
                        COM     = 8'hbc,
                        SKP     = 8'h1c,
                        IDL     = 8'h7c;

    reg CONTADOR_DE_LANES   = 0,
        CONTADOR            = 0;

    always @(posedge CLK) o_DK <= DK;

    always @(posedge CLK)   if (CONTADOR < 4)   CONTADOR <= CONTADOR + 1;
                            else                CONTADOR <= 0; 

    always @(posedge CLK)
            case(D)

            STP: if(CONTADOR_DE_LANES == 0) 
                    if (DK == 0) begin
                        LANE[CONTADOR_DE_LANES] = D;
                        CONTADOR_DE_LANES       = CONTADOR_DE_LANES+1;
                        end
                    else begin 
                        $display("ERROR: DK debe ser 0 en el START");
                        CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
                        end
                 else   begin 
                        $display("ERROR: STP solo puede ir en el lane 0");
                        CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
                        end

            SDP: if(CONTADOR_DE_LANES == 0) 
                    if (DK == 0) begin
                        LANE[CONTADOR_DE_LANES] = D;
                        CONTADOR_DE_LANES       = CONTADOR_DE_LANES+1;
                        end
                    else begin 
                        $display("ERROR: DK debe ser 0 en el START");
                        CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
                        end

                 else begin 
                    $display("ERROR: SDP solo puede ir en el lane 0");
                    CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
                    end

            END: if(CONTADOR_DE_LANES == LANES) 
                    if (DK == 0) begin
                        LANE[CONTADOR_DE_LANES] = D;
                        CONTADOR_DE_LANES       = 0;
                        end
                    else begin 
                        $display("ERROR: DK debe ser 0 en el END");
                        CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
                        end
                 else begin 
                    $display("ERROR: END solo puede ir en el lane %d",LANES);
                    CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
                    end

            EDB: if(CONTADOR_DE_LANES == LANES)
                    if (DK == 0) begin
                        LANE[CONTADOR_DE_LANES] = D;
                        CONTADOR_DE_LANES       = 0;
                        end
                    else begin 
                        $display("ERROR: DK debe ser 0 en el END.");
                        CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
                        end
                 else begin 
                    $display("ERROR: EDB solo puede ir en el lane %d",LANES);
                    CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
                    end

            SKP: if (DK == 1) begin    
                    LANE[CONTADOR_DE_LANES] = D;
                    CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
                    end
                 else begin 
                    $display("ERROR: DK debe ser 1 en los D.");
                    CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
                    end

            IDL: if (DK == 1) begin 
                    LANE[CONTADOR_DE_LANES] = D;
                    CONTADOR_DE_LANES       = CONTADOR_DE_LANES+1;
                    end
                 else begin 
                    $display("ERROR: DK debe ser 1 en los D.");
                    CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
                    end
            endcase 

endmodule