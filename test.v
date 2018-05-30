module prueba_phy (
    output  reg          CLK0,
    output  reg          CLK1,
    output  reg          CLK2,

    output  reg [7:0]    D,
    output  reg [7:0]    START_END,
    output  reg [7:0]    ORDERED_SET,
    output  reg [7:0]    LOG_COM,

    output  reg [1:0]    CONTROL,
    input       [7:0]    DATA_OUT,
    input       [7:0]    CONTROL_OUT
);
    parameter [7:0] STP = 8'hfb,//Start and End Characters
                    SDP = 8'h5c,//Start and End Characters
                    END = 8'hfd,//Start and End Characters
                    EDB = 8'hfe,//Start and End Characters

                    SKP = 8'h1c,//Ordered-Sets
                    IDL = 8'h7c,//Ordered-Sets
                    FTS = 8'h3c,//Ordered-Sets

                    COM = 8'hbc;//COM

    initial CLK0 = 0;
    initial CLK1 = 0;
    initial CLK2 = 0;

    always #500  CLK0 = !CLK0;
    always #2000 CLK1 = !CLK1;
    always #250  CLK2 = !CLK2;

    initial begin
        D = 8'b11111111;
        #500 D = 8'b00000001;
        #500 D = 8'b00000010;
        #500 D = 8'b00000100;
        #500 D = 8'b00001000;
        #500 D = 8'b00010000;
        #500 D = 8'b00100000;
        #500 D = 8'b01000000;
        #500 D = 8'b10000000;
        #500 D = 8'b00000000;
        #500 D = 8'b00000001;
        #500 D = 8'b00000010;
        #500 D = 8'b00000100;
        #500 D = 8'b00001000;
        #500 D = 8'b00010000;
        #500 D = 8'b00100000;
        #500 D = 8'b01000000;
        #500 D = 8'b10000000;
        #500 D = 8'b00000000;
    end

    initial begin
             START_END = STP;
        #500;
        #500;
        #500 START_END = END;
        #500 START_END = SDP;
        #500;
        #500;
        #500 START_END = EDB;

    end

    initial begin
        ORDERED_SET = IDL;
    end

    initial begin
        LOG_COM = COM;
    end

    initial begin
             CONTROL = 2'b01;
        #500 CONTROL = 2'b00;
        #500 CONTROL = 2'b00;
        #500 CONTROL = 2'b01;
        #500 CONTROL = 2'b01;
        #500 CONTROL = 2'b00;
        #500 CONTROL = 2'b00;
        #500 CONTROL = 2'b01;
        #500 CONTROL = 2'b10;
        #500 CONTROL = 2'b00;

    end

    initial begin
      $dumpfile("PCIE.vcd");
      $dumpvars;
      #60000 $finish;
    end
    
endmodule