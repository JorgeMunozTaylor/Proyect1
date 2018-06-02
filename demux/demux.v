//--Modificado por Jorge Munoz Taylor
//--Circuitos digitales 2
//--I-2018

module demux (
  input valid_in,
  input [7:0] data_in,
  input clk,
  output reg [7:0] data_out,
  output reg [7:0] control
  );

  /*localparam [7:0] STP = 8'hfb,//Start and End Characters
                  SDP = 8'h5c,//Start and End Characters
                  END = 8'hfd,//Start and End Characters
                  EDB = 8'hfe,//Start and End Characters

                  SKP = 8'h1c,//Ordered-Sets
                  IDL = 8'h7c,//Ordered-Sets
                  FTS = 8'h3c,//Ordered-Sets

                  COM = 8'hbc;//COM*/
  
  reg [7:0] cable_data;

  always @* cable_data = data_in;

//**********************************************************
  always @(posedge clk) 
      case (data_in)
      //Start and End Characters
        8'hfb: control <= data_in;
        
        8'h5c: control <= data_in;
        
        8'hfd: control <= data_in;
        
        8'hfe: control <= data_in;
        
      //Ordered-Sets
        8'h1c: control <= data_in;
        
        8'h7c: control <= data_in;
        
        8'h3c: control <= data_in;
        
      //COM
        8'hbc: control <= data_in;
          
        default: begin
          data_out <= cable_data;
          control <= 8'b0;
        end
      endcase
  
  always @(negedge clk) 
      case (data_in)
        8'hfb: control <= data_in;
        
        8'h5c: control <= data_in;
        
        8'hfd: control <= data_in;
        
        8'hfe: control <= data_in;
        
      //Ordered-Sets
        8'h1c: control <= data_in;
        
        8'h7c: control <= data_in;
        
        8'h3c: control <= data_in;
        
      //COM
        8'hbc: control <= data_in;
         
        default: begin
            data_out <= cable_data;
            control <= 8'b0;
            end
      endcase
//**********************************************************
endmodule // demux
