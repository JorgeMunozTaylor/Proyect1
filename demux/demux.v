module demux (
  input valid_in,
  input [7:0] data_in,
  input clk,
  output reg [7:0] data_out,
  output reg [7:0] control
  );

  parameter [7:0] COM = 8'hbc,
                  SKP = 8'h1c,
                  STP = 8'hfb,
                  SDP = 8'h5c,
                  END = 8'hfd,
                  IDL = 8'h7c;

  always @(posedge clk) begin
    if (valid_in) begin
      
      case (data_in)
        COM: begin
          control <= COM;
        end
        SKP: begin
          control <= SKP;
        end
        STP: begin
          control <= STP;
        end
        SDP: begin
          control <= SDP;
        end
        END: begin
          control <= END;
        end
        default: begin
          data_out <= data_in;
          control <= 8'b0;
        end
      endcase
      
    end else begin
      data_out <= IDL;
    end
  end

endmodule // demux