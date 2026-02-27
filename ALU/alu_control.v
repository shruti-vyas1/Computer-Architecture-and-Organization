// ALU Control Unit
// Description:
// Generates ALU control signals based on ALUOp and Function fields.
// The design is inspired by standard educational references
// and was implemented and verified for learning purposes.

module ALUControl(
    output reg [2:0] ALU_Control,
    input [1:0] ALUOp,
    input [3:0] Function
);

wire [5:0] ALUControlIn;

assign ALUControlIn = {ALUOp, Function};

always @(ALUControlIn)
begin
    casex (ALUControlIn)
        6'b11xxxx: ALU_Control = 3'b000; // ADD
        6'b10xxxx: ALU_Control = 3'b100; // SLT
        6'b01xxxx: ALU_Control = 3'b001; // SUB
        6'b000000: ALU_Control = 3'b000; // ADD
        6'b000001: ALU_Control = 3'b001; // SUB
        6'b000010: ALU_Control = 3'b010; // AND
        6'b000011: ALU_Control = 3'b011; // OR
        6'b000100: ALU_Control = 3'b100; // SLT
        default:   ALU_Control = 3'b000;
    endcase
end

endmodule

module JR_Control(
    input [1:0] alu_op,
    input [3:0] funct,
    output JRControl
);

assign JRControl = ({alu_op, funct} == 6'b001000) ? 1'b1 : 1'b0;

endmodule
