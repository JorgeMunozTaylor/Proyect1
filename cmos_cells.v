module BUF(A, Y);
parameter  PwrC = 0;
input A;
output Y;
assign Y = A;
    //always @(posedge Y) //Cuenta el numero de transiciones
    //testbench_synth.m1.PwrCntr[PwrC] = testbench_synth.m1.PwrCntr[PwrC] + 1;
endmodule

module NOT(A, Y);
parameter  PwrC = 0;
input A;
output Y;
assign Y = ~A;
    //always @(posedge Y) 
    //testbench_synth.m1.PwrCntr[PwrC] = testbench_synth.m1.PwrCntr[PwrC] + 1;
endmodule

module NAND(A, B, Y);
parameter  PwrC = 0;
input A, B;
output Y;
assign Y = ~(A & B);
    //always @(posedge Y) 
    //testbench_synth.m1.PwrCntr[PwrC] = testbench_synth.m1.PwrCntr[PwrC] + 1;
endmodule

module NOR(A, B, Y);
parameter  PwrC = 0;
input A, B;
output Y;
assign Y = ~(A | B);
    //always @(posedge Y) 
    //testbench_synth.m1.PwrCntr[PwrC] = testbench_synth.m1.PwrCntr[PwrC] + 1;
endmodule

module DFF(C, D, Q);
parameter  PwrC = 0;
input C, D;
output reg Q;
always @(posedge C)
	Q <= D;

    //always @(posedge Q) 
    //testbench_synth.m1.PwrCntr[PwrC] = testbench_synth.m1.PwrCntr[PwrC] + 1;
endmodule

module DFFSR(C, D, Q, S, R);
parameter  PwrC = 0;
input C, D, S, R;
output reg Q;
always @(posedge C, posedge S, posedge R)
	if (S)
		Q <= 1'b1;
	else if (R)
		Q <= 1'b0;
	else
		Q <= D;

    //always @(posedge Q) 
    //testbench_synth.m1.PwrCntr[PwrC] = testbench_synth.m1.PwrCntr[PwrC] + 1;
endmodule