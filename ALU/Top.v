// Description:
// Top-level module integrating ALU Control Unit and ALU.
// This module was designed to understand hierarchical hardware design and processor datapath integration.

module top(
    input [15:0] a,
    input [15:0] b,
    input [1:0] ALUOp,
    input [3:0] Function,
    output [15:0] result,
    output zero
);

wire [2:0] ALU_Control;

// ALU Control Unit
ALUControl K1(ALU_Control, ALUOp, Function);

// ALU Module
alu K2(a, b, ALU_Control, result, zero);
endmodule



// ------------------------------------------------------------
// Top Module Testbench
// ------------------------------------------------------------

module tb_top();

reg [15:0] a, b;
reg [1:0] ALUOp;
reg [3:0] Function;
wire [15:0] result;
wire zero;

// Instantiate Top Module
top K3(a, b, ALUOp, Function, result, zero);

initial begin

    #10;
    a = 16'b0000000000001000;
    b = 16'b0000000000000100;

    ALUOp = 2'b11;
    Function = 4'bxxxx;

    #10;
    ALUOp = 2'b10;
    Function = 4'bxxxx;

    #10;
    ALUOp = 2'b01;
    Function = 4'bxxxx;

    #10;
    ALUOp = 2'b00;
    Function = 4'b0000;

    #10;
    ALUOp = 2'b00;
    Function = 4'b0001;

    #10;
    ALUOp = 2'b00;
    Function = 4'b0010;

    #10;
    ALUOp = 2'b00;
    Function = 4'b0011;

    #10;
    ALUOp = 2'b00;
    Function = 4'b0100;

end

endmodule
