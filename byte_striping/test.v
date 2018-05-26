//--Jorge Munoz Taylor
module test(
    output           CLK,
    output  [7:0]    D,
    output           DK,
    //input   [7:0]    LANE [`LANES:0],
    LANE,
    input            o_DK
);
    localparam [7:0]    STP     = 8'hfb,
                        SDP     = 8'h5c,
                        END     = 8'hfd,
                        EDB     = 8'hfe,

                        COM     = 8'hbc,
                        SKP     = 8'h1c,
                        IDL     = 8'h7c,
                        LANES   = `LANES;

    input [7:0] LANE [LANES:0];

    initial CLK = 0;
    always #1 CLK = !CLK;

    initial begin
            D = STP;
        #5  D = COM;
        #5  D = COM;
        #5  D = COM;
        #5  D = COM;
        #5  D = END;
    end

    initial begin
            DK = 0;
        #5  DK = 1;
        #20 DK = 0;
    end

    initial begin
        $dumpfile("simulacion.vcd");
        $dumpvars;
    end
endmodule