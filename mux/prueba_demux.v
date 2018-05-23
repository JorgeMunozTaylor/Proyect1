`timescale 	1ns / 1ps

module prueba_demux (
    input [7:0] control,
    input [7:0] data_dm,
    input [7:0] data,
    input valid,
    output reg clk_1m,
    output reg clk_250k,
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
        $display ("\t\t\tclk_1m\tvalid\tdata\tdata_dm\tctrl");
        $monitor($time,"\t%b\t%b\t%b\t%b\t%b",clk, Valid, Data, Demuxed, Control);



        $finish;
    end

    initial	begin
        clk_1m <= 0;			// Valor inicial al reloj, sino siempre será indeterminado
        clk_250k <= 0;
    end

    always	#500 clk_1m <= ~clk_1m;
    always	#2000 clk_250k <= ~clk_250k;

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
        0: begin
          ctrl <= "0";
        end
        default: begin
          ctrl <= "error";
        end
      endcase
    end

endmodule