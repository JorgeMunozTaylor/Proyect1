//

`ifndef LANES 
    `define LANES = 3
`endif

module byte_strip (
    input           CLK,
    input           D,
    input           DK,
    output [7:0]    LANE [`LANES:0],
    output          o_DK
);

    localparam [7:0]    STP     = 8'hfb,
                        SDP     = 8'h5c,
                        COM     = 8'hbc,
                        END     = 8'hfd,
                        EDB     = 8'hfe,
                        SKP     = 8'h1c,
                        IDL     = 8'h7c,
                        LANES   = `LANES;

    reg CONTADOR_DE_LANES   = 0;
    reg CONTADOR            = 0;

    assign o_DK = DK;

    always @(posedge CLK)     
        if (CONTADOR < 4)   CONTADOR <= CONTADOR + 1;
        else                CONTADOR <= 0; 

    always @(posedge CLK)
        case(D)
            STP: if(CONTADOR_DE_LANES == 0) 
                    begin
                        LANE[CONTADOR_DE_LANES] = D;
                        CONTADOR_DE_LANES       = CONTADOR_DE_LANES+1;
                    end
                 else $display("ERROR: STP solo puede ir en el lane 0");

            SDP: if(CONTADOR_DE_LANES == 0) 
                    begin
                        LANE[CONTADOR_DE_LANES] = D;
                        CONTADOR_DE_LANES       = CONTADOR_DE_LANES+1;
                    end
                 else $display("ERROR: SDP solo puede ir en el lane 0");

            END: if(CONTADOR_DE_LANES == LANES) 
                    begin
                        LANE[CONTADOR_DE_LANES] = D;
                        CONTADOR_DE_LANES       = 0;
                    end
                 else $display("ERROR: END solo puede ir en el lane %d",LANES);

            EDB: if(CONTADOR_DE_LANES == LANES) 
                    begin
                        LANE[CONTADOR_DE_LANES] = D;
                        CONTADOR_DE_LANES       = 0;
                    end
                 else $display("ERROR: EDB solo puede ir en el lane %d",LANES);
                 
            SKP:
            IDL:
        endcase

endmodule