//--Modificado por Jorge Munoz Taylor
//--Circuitos digitales 2
//--I-2018

module mux (
  input clk,
  input [1:0] control,

  input [7:0] D_in, //Transmit Data Buffer
  input [7:0] start_end, //Start and End Characters
  input [7:0] ordered_set, //Ordered-Sets
  input [7:0] logical_COM, //COM
  
  output reg [7:0] D_out,
  output reg valid
  );

//*********************************************************
  always @(posedge clk) 
    //case (control)
      //2'b00:
      if(control==2'b00) 
            begin//Transmit Data Buffer - D_in
              D_out <= D_in;
              valid <= 1'b1;      
            end

      //2'b01:
      else if(control==2'b01) 
            begin //Start and End Characters - start_end
              D_out <= start_end;
              valid <= 1'b0;
            end

      //2'b10:
      else if(control==2'b10) 
            begin//Ordered-Sets - ordered_set
              D_out <= ordered_set;
              valid <= 1'b0;
            end

      //2'b11: 
      else if(control==2'b11)
            begin//COM
              D_out <= logical_COM;
              valid <= 1'b0;
            end
    //endcase

  always @(negedge clk) 
    //case (control)
      //2'b00:
      if(control==2'b00) 
            begin//Transmit Data Buffer - D_in
              D_out <= D_in;
              valid <= 1'b1;      
            end

      //2'b01:
      else if(control==2'b01) 
            begin //Start and End Characters - start_end
              D_out <= start_end;
              valid <= 1'b0;
            end

      //2'b10:
      else if(control==2'b10) 
            begin//Ordered-Sets - ordered_set
              D_out <= ordered_set;
              valid <= 1'b0;
            end

      //2'b11: 
      else if(control==2'b11)
            begin//COM
              D_out <= logical_COM;
              valid <= 1'b0;
            end
    //endcase
//********************************************************
endmodule // mux
