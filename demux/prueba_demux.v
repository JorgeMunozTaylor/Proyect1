`timescale 	1ns / 1ps

module prueba_demux (
    input [7:0] control,
    input [7:0] data_dm,
    output reg valid,
    output reg [7:0] data,
    output reg clk_1m,
    output reg clk_250k
);
    parameter [7:0] COM = 8'hbc,
                    SKP = 8'h1c,
                    STP = 8'hfb,
                    SDP = 8'h5c,
                    END = 8'hfd,
                    IDL = 8'h7c;

    reg [8*3:0] ctrl;

    initial begin
        $dumpfile("FTM_test.vcd");	// Nombre de archivo del "dump"
        $dumpvars;		          	// Directiva para "dumpear" variables
        $display ("Prueba Demux\n");
        $display ("\t\t\tclk_250k\tValid\tData\t\tDemuxed\t\tControl");
        $monitor($time,"\t%b\t%b\t%b\t%b\t%s",clk_250k, valid, data, data_dm, ctrl);

        ////////////////////////////////
        @(posedge clk_250k);
        valid <= 1'b1;
        ////////////////////////////////
        data <= COM;
        @(posedge clk_250k);
        data <= COM;
        @(posedge clk_250k);
        data <= COM;
        @(posedge clk_250k);
        data <= COM;
        @(posedge clk_250k);
        ////////////////////////////////
        data <= STP;
        @(posedge clk_250k);
        data <= 8'h01;
        @(posedge clk_250k);
        data <= 8'h02;
        @(posedge clk_250k);
        data <= END;
        @(posedge clk_250k);
        ////////////////////////////////
        data <= COM;
        @(posedge clk_250k);
        data <= COM;
        @(posedge clk_250k);
        data <= COM;
        @(posedge clk_250k);
        data <= COM;
        @(posedge clk_250k);
        ////////////////////////////////
        data <= SKP;
        @(posedge clk_250k);
        data <= SKP;
        @(posedge clk_250k);
        data <= SKP;
        @(posedge clk_250k);
        data <= SKP;
        @(posedge clk_250k);
        ////////////////////////////////
        data <= SKP;
        @(posedge clk_250k);
        data <= SKP;
        @(posedge clk_250k);
        data <= SKP;
        @(posedge clk_250k);
        data <= SKP;
        @(posedge clk_250k);
        ////////////////////////////////
        data <= SKP;
        @(posedge clk_250k);
        data <= SKP;
        @(posedge clk_250k);
        data <= SKP;
        @(posedge clk_250k);
        data <= SKP;
        @(posedge clk_250k);
        ////////////////////////////////
        data <= STP;
        @(posedge clk_250k);
        data <= 8'h03;
        @(posedge clk_250k);
        data <= 8'h04;
        @(posedge clk_250k);
        data <= 8'h05;
        @(posedge clk_250k);
        ////////////////////////////////
        data <= 8'h06;
        @(posedge clk_250k);
        data <= 8'h07;
        @(posedge clk_250k);
        data <= 8'h08;
        @(posedge clk_250k);
        data <= 8'h09;
        @(posedge clk_250k);
        ////////////////////////////////
        data <= 8'h0A;
        @(posedge clk_250k);
        data <= 8'h0B;
        @(posedge clk_250k);
        data <= 8'h0C;
        @(posedge clk_250k);
        data <= END;
        @(posedge clk_250k);
        ////////////////////////////////
        data <= SDP;
        @(posedge clk_250k);
        data <= 8'h0D;
        @(posedge clk_250k);
        data <= 8'h0E;
        @(posedge clk_250k);
        data <= END;
        @(posedge clk_250k);
        ////////////////////////////////
        data <= IDL;
        @(posedge clk_250k);
        data <= IDL;
        @(posedge clk_250k);
        data <= IDL;
        @(posedge clk_250k);
        data <= IDL;
        @(posedge clk_250k);
        ////////////////////////////////
        data <= IDL;
        @(posedge clk_250k);
        data <= IDL;
        @(posedge clk_250k);
        data <= IDL;
        @(posedge clk_250k);
        data <= IDL;
        @(posedge clk_250k);
        ////////////////////////////////

        $finish;
    end

    initial	begin
        clk_1m <= 0;			// Valor inicial al reloj, sino siempre será indeterminado
        clk_250k <= 0;    // Valor inicial al reloj, sino siempre será indeterminado
    end

    always	#250 clk_1m <= ~clk_1m; // reloj 1MHz
    always	#1000 clk_250k <= ~clk_250k; // reloj 250kHz

    ///////////////////////////////valor de ctrl
    always @(*) begin
        case (control)
        COM: begin
          ctrl = "COM";
        end
        SKP: begin
          ctrl = "SKP";
        end
        STP: begin
          ctrl = "STP";
        end
        SDP: begin
          ctrl = "SDP";
        end
        END: begin
          ctrl = "END";
        end
        8'b0: begin
          ctrl <= "0";
        end
        default: begin
          ctrl <= "error";
        end
      endcase
    end

endmodule