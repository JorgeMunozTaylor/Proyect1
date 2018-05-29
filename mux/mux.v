module mux (
  input clk,
  input [7:0] D_in, //Transmit Data Buffer
  input [7:0] start_end, //Start and End Characters
  input [7:0] ordered_set, //Ordered-Sets
  input [7:0] logical_COM, //COM
  output reg [7:0] D_out,
  input [1:0] control,
  output reg valid
  );
  parameter [7:0] STP = 8'hfb,//Start and End Characters
                  SDP = 8'h5c,//Start and End Characters
                  END = 8'hfd,//Start and End Characters
                  EDB = 8'hfe,//Start and End Characters

                  SKP = 8'h1c,//Ordered-Sets
                  IDL = 8'h7c,//Ordered-Sets
                  FTS = 8'h3c,//Ordered-Sets

                  COM = 8'hbc;//COM
  
  always @(posedge clk)begin
    case (control)
      2'b00: //Transmit Data Buffer - D_in
        D_out <= D_in;
        valid <= 1'b1;
      endcase
      2'b01:  //Start and End Characters - start_end
        D_out <= start_end;
        valid <= 1'b0;
      endcase
      2'b10: //Ordered-Sets - ordered_set
        D_out <= ordered_set;
        valid <= 1'b0;
      endcase
      2'b11: //COM
        D_out <= logical_COM;
        valid <= 1'b0;
      endcase
  end

endmodule // mux
