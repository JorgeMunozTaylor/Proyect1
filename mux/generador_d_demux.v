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
        data <= COM;
        @(posedge clk);
        

    $finish;
    end
endmodule