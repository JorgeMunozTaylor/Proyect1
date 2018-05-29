module generador_d_demux(
    input clk,
    output reg valid,
    output reg [7:0] data
);
    parameter [7:0] COM = 8'hbc,
                    SKP = 8'h1c,
                    STP = 8'hfb,
                    SDP = 8'h5c,
                    END = 8'hfd,
                    IDL = 8'h7c;
    
    initial begin
        @(posedge clk);
        valid <= 1'b1;
        ////////////////////////////////
        data <= COM;
        @(posedge clk);
        data <= COM;
        @(posedge clk);
        data <= COM;
        @(posedge clk);
        data <= COM;
        @(posedge clk);
        ////////////////////////////////
        data <= STP;
        @(posedge clk);
        data <= 8'h01;
        @(posedge clk);
        data <= 8'h02;
        @(posedge clk);
        data <= END;
        @(posedge clk);
        ////////////////////////////////
        data <= COM;
        @(posedge clk);
        data <= COM;
        @(posedge clk);
        data <= COM;
        @(posedge clk);
        data <= COM;
        @(posedge clk);
        ////////////////////////////////
        data <= SKP;
        @(posedge clk);
        data <= SKP;
        @(posedge clk);
        data <= SKP;
        @(posedge clk);
        data <= SKP;
        @(posedge clk);
        ////////////////////////////////
        data <= SKP;
        @(posedge clk);
        data <= SKP;
        @(posedge clk);
        data <= SKP;
        @(posedge clk);
        data <= SKP;
        @(posedge clk);
        ////////////////////////////////
        data <= SKP;
        @(posedge clk);
        data <= SKP;
        @(posedge clk);
        data <= SKP;
        @(posedge clk);
        data <= SKP;
        @(posedge clk);
        ////////////////////////////////
        data <= STP;
        @(posedge clk);
        data <= 8'h03;
        @(posedge clk);
        data <= 8'h04;
        @(posedge clk);
        data <= 8'h05;
        @(posedge clk);
        ////////////////////////////////
        data <= 8'h06;
        @(posedge clk);
        data <= 8'h07;
        @(posedge clk);
        data <= 8'h08;
        @(posedge clk);
        data <= 8'h09;
        @(posedge clk);
        ////////////////////////////////
        data <= 8'h0A;
        @(posedge clk);
        data <= 8'h0B;
        @(posedge clk);
        data <= 8'h0C;
        @(posedge clk);
        data <= END;
        @(posedge clk);
        ////////////////////////////////
        data <= SDP;
        @(posedge clk);
        data <= 8'h0D;
        @(posedge clk);
        data <= 8'h0E;
        @(posedge clk);
        data <= END;
        @(posedge clk);
        ////////////////////////////////
        data <= IDL;
        @(posedge clk);
        data <= IDL;
        @(posedge clk);
        data <= IDL;
        @(posedge clk);
        data <= IDL;
        @(posedge clk);
        ////////////////////////////////
        data <= IDL;
        @(posedge clk);
        data <= IDL;
        @(posedge clk);
        data <= IDL;
        @(posedge clk);
        data <= IDL;
        @(posedge clk);
        ////////////////////////////////

    $finish;
    end
endmodule