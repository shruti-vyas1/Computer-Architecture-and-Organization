// Description:
// 16-bit Arithmetic Logic Unit (ALU) supporting arithmetic and logical operations.
// The design is inspired by standard educational references
// (including fpga4student.com) and was implemented,
// simulated, and verified as part of learning.

module alu(
input [15:0] a,            // Source operand 1
input [15:0] b,            // Source operand 2
input [2:0] alu_control,   // Operation select
output reg [15:0] result,  // ALU result
output zero                // Zero flag
);

always @(*) 
begin
    case(alu_control)
        3'b000: result = a + b; // ADD
        3'b001: result = a - b; // SUB
        3'b010: result = a & b; // AND
        3'b011: result = a | b; // OR
        3'b100: begin           // SET LESS THAN
            if (a < b)
                result = 16'd1;
            else
                result = 16'd0;
        end
        default: result = a + b;
    endcase
end

// Zero flag generation
assign zero = (result == 16'd0) ? 1'b1 : 1'b0;

endmodule
