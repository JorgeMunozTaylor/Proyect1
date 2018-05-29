module demux (
  input valid_in,
  input [7:0] data_in,
  input clk,
  output reg [7:0] data_out,
  output reg [7:0] control
  );

  parameter [7:0] STP = 8'hfb,//Start and End Characters
                  SDP = 8'h5c,//Start and End Characters
                  END = 8'hfd,//Start and End Characters
                  EDB = 8'hfe,//Start and End Characters

                  SKP = 8'h1c,//Ordered-Sets
                  IDL = 8'h7c,//Ordered-Sets
                  FTS = 8'h3c,//Ordered-Sets

                  COM = 8'hbc;//COM

  always @(posedge clk) begin
    if (valid_in) begin
      
      case (data_in)
      //Start and End Characters
        STP: begin
          control <= STP;
        end
        SDP: begin
          control <= SDP;
        end
        END: begin
          control <= END;
        end
        EDB: begin
          control <= EDB;
        end
      //Ordered-Sets
        SKP: begin
          control <= SKP;
        end
        IDL: begin
          control <= IDL;
        end
        FTS: begin
          control <= FTS;
        end
      //COM
        COM: begin
          control <= COM;
        end
      //default case
        default: begin
          data_out <= data_in;
          control <= 8'b0;
        end
      endcase
      
    end else begin
      data_out <= 8'b0;
    end
  end

endmodule // demux
