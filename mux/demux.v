module demux (
  input valid_in,
  input [7:0] data_in,
  input clk,
  output reg data_out
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
        STP: begin
          data_out <= IDL;
        end
        SDP: begin
          data_out <= IDL;
        end
        END: begin
          data_out <= IDL;
        end
        default: begin
          data_out <= data_in;
        end
      endcase

    end else begin
      data_out <= IDL;
    end
  end

endmodule // demux
