//--Creado por Jorge Munoz Taylor
//--Circuitos digitales 2
//--I-2018

module byte_unstrip
(
    input            CLK,
    input   [7:0]    LANE0,
    input   [7:0]    LANE1,
    input   [7:0]    LANE2,
    input   [7:0]    LANE3,
    input            DK_0,
    input            DK_1,
    input            DK_2,
    input            DK_3,
    
    output reg [7:0]    D,
    output reg          DK
);
 
    reg [1:0] CONTADOR_DE_LANES=2'b00;
    reg [9:0] div_frec;
    reg       n_CLK;
    reg       count = 0;
    integer i;

//******************************************************************************
    always @(posedge CLK) begin//Multiplicador de frecuencias
        div_frec = 0;
        n_CLK    = 0;
        count = 0;
        
        for(i=0;i<=498;i=i+1)
        if(div_frec!=499) begin
            #4 div_frec <= div_frec + 1;
            n_CLK       <= !n_CLK;
            count       <=  !count;
            end
        //else count = 0;    
    end

    always @(negedge CLK) begin//Multiplicador de frecuencias
        div_frec = 0;
        n_CLK    = 0;
        count = 0;

        for(i=0;i<=498;i=i+1)
        if(div_frec!=499) begin
            #4 div_frec <= div_frec + 1;
            n_CLK       <= !n_CLK;
            count       <= !count;
            end    
        //else count = 0;
    end
//******************************************************************************
    always @(posedge count)
        if     (div_frec == 0)   CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
        else if(div_frec == 125) CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
        else if(div_frec == 250) CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
        else if(div_frec == 375) CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;

    always @(negedge count)
        if     (div_frec == 0)   CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
        else if(div_frec == 125) CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
        else if(div_frec == 250) CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;
        else if(div_frec == 375) CONTADOR_DE_LANES = CONTADOR_DE_LANES+1;

//******************************************************************************
    always @(*)
        case(CONTADOR_DE_LANES)
            2'b00: begin
                D = LANE0;
                DK= DK_0;
                end

            2'b01: begin
                D = LANE1; 
                DK= DK_1;
                end

            2'b10: begin
                D = LANE2; 
                DK= DK_2; 
                end

            2'b11: begin
                D = LANE3; 
                DK= DK_3; 
                end
        endcase       
endmodule