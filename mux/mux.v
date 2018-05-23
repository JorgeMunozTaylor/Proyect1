module mux (
  input clk,
  input [7:0] D_in,
  input [7:0] control,
  output reg [7:0] D_out,
  output reg valid
  );
  parameter [7:0] COM = 8'hbc,
                  SKP = 8'h1c,
                  STP = 8'hfb,
                  SDP = 8'h5c,
                  END = 8'hfd,
                  IDL = 8'h7c;

endmodule // mux
