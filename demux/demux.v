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

  always @(posedge clk or negedge clk) begin
    if (valid_in == 0)
      case (data_in)
      //Start and End Characters
        STP: control <= STP;
        
        SDP: control <= SDP;
        
        END: control <= END;
        
        EDB: control <= EDB;
        
      //Ordered-Sets
        SKP: control <= SKP;
        
        IDL: control <= IDL;
        
        FTS: control <= FTS;
        
      //COM
        COM: control <= COM;
    
      endcase
      
    else begin
          data_out <= data_in;
          control <= 8'b0;
    end
  end

endmodule // demux
