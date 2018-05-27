//--Jorge Munoz Taylor
module test
#(
    parameter LANES = `LANES,
    parameter BITS  = `BITS-1
)
(
    output  reg             CLK,
    output  reg [BITS:0]    D,
    output  reg             DK,
    input       [BITS:0]    LANE0,
    input       [BITS:0]    LANE1,
    input       [BITS:0]    LANE2,
    input       [BITS:0]    LANE3,
    input                   o_DK
);
    localparam [7:0]    STP     = 8'hfb,
                        SDP     = 8'h5c,
                        END     = 8'hfd,
                        EDB     = 8'hfe,
                        COM     = 8'hbc,
                        SKP     = 8'h1c,
                        IDL     = 8'h7c;

    initial CLK = 0;
    always  #1 CLK = !CLK;

    initial begin
            D = STP;
        #2  D = 00110011;
        #2  D = 11111111;
        #2  D = END;
    end

    initial begin
            DK = 0;
        #2  DK = 1;
        #4  DK = 0;
    end

    initial begin
        $dumpfile("simulacion.vcd");
        $dumpvars;
    end

    initial #30 $finish;
endmodule