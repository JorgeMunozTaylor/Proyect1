//--Jorge Munoz Taylor
module test
(
    output  reg             CLK,
    output  reg [7:0]    D,
    output  reg             DK,
    input       [7:0]    LANE0,
    input       [7:0]    LANE1,
    input       [7:0]    LANE2,
    input       [7:0]    LANE3,
    input                    DK_0,
    input                    DK_1,
    input                    DK_2,
    input                    DK_3,

    input       [7:0]     U_D,
    input                    U_DK
);
    localparam [7:0]    STP     = 8'hfb,
                        SDP     = 8'h5c,
                        END     = 8'hfd,
                        EDB     = 8'hfe,
                        COM     = 8'hbc,
                        SKP     = 8'h1c,
                        IDL     = 8'h7c;

    initial CLK     = 0;
    always  #2000 CLK  = !CLK;

    initial 
    repeat(10)
        begin
               D = STP;
        #3000  D = 00110011;
        #2000  D = 11111111;
        #2000  D = END;
        #2000  D = SDP;
        #2000  D = 01010101;
        #2000  D = 01000001;
        #2000  D = EDB;
        #2000;
    end

    initial 
    repeat(10)
    begin
               DK = 0;
        #3000  DK = 1;
        #2000  DK = 1;
        #2000  DK = 0;
        #2000  DK = 0;
        #2000  DK = 1;
        #2000  DK = 1;
        #2000  DK = 0;
        #2000;
    end

    initial begin
        $dumpfile("simulacion.vcd");
        $dumpvars;
    end

    initial #30000 $finish;
endmodule