/*
Control Unit Module

Original Source:
FPGA4Student - https://www.fpga4student.com/

This code is taken from FPGA4Student for educational and learning
purposes and used as part of a 16-bit MIPS processor implementation.
*/

module control( input[2:0] opcode,
input reset,
output reg[1:0] reg_dst,mem_to_reg,alu_op,
output reg
jump,branch,mem_read,mem_write,alu_src,reg_write,sign_or_zero
);

always @(*)
begin
if(reset == 1'b1) begin
reg_dst = 2'b00;
mem_to_reg = 2'b00;
alu_op = 2'b00;
jump = 1'b0;
branch = 1'b0;
mem_read = 1'b0;
mem_write = 1'b0;
alu_src = 1'b0;
reg_write = 1'b0;
sign_or_zero = 1'b1;
end
else begin
case(opcode)

3'b000: begin // add
reg_dst = 2'b01;
mem_to_reg = 2'b00;
alu_op = 2'b00;
jump = 1'b0;
branch = 1'b0;
mem_read = 1'b0;
mem_write = 1'b0;
alu_src = 1'b0;
reg_write = 1'b1;
sign_or_zero = 1'b1;
end

3'b001: begin // sli
reg_dst = 2'b00;
mem_to_reg = 2'b00;
alu_op = 2'b10;
jump = 1'b0;
branch = 1'b0;
mem_read = 1'b0;
mem_write = 1'b0;
alu_src = 1'b1;
reg_write = 1'b1;
sign_or_zero = 1'b0;
end

3'b010: begin // j
reg_dst = 2'b00;
mem_to_reg = 2'b00;
alu_op = 2'b00;
jump = 1'b1;
branch = 1'b0;
mem_read = 1'b0;
mem_write = 1'b0;
alu_src = 1'b0;
reg_write = 1'b0;
sign_or_zero = 1'b1;
end

3'b011: begin // jal
reg_dst = 2'b10;
mem_to_reg = 2'b10;
alu_op = 2'b00;
jump = 1'b1;
branch = 1'b0;
mem_read = 1'b0;
mem_write = 1'b0;
alu_src = 1'b0;
reg_write = 1'b1;
sign_or_zero = 1'b1;
end

3'b100: begin // lw
reg_dst = 2'b00;
mem_to_reg = 2'b01;
alu_op = 2'b11;
jump = 1'b0;
branch = 1'b0;
mem_read = 1'b1;
mem_write = 1'b0;
alu_src = 1'b1;
reg_write = 1'b1;
sign_or_zero = 1'b1;
end

3'b101: begin // sw
reg_dst = 2'b00;
mem_to_reg = 2'b00;
alu_op = 2'b11;
jump = 1'b0;
branch = 1'b0;
mem_read = 1'b0;
mem_write = 1'b1;
alu_src = 1'b1;
reg_write = 1'b0;
sign_or_zero = 1'b1;
end

3'b110: begin // beq
reg_dst = 2'b00;
mem_to_reg = 2'b00;
alu_op = 2'b01;
jump = 1'b0;
branch = 1'b1;
mem_read = 1'b0;
mem_write = 1'b0;
alu_src = 1'b0;
reg_write = 1'b0;
sign_or_zero = 1'b1;
end

3'b111: begin // addi
reg_dst = 2'b00;
mem_to_reg = 2'b00;
alu_op = 2'b11;
jump = 1'b0;
branch = 1'b0;
mem_read = 1'b0;
mem_write = 1'b0;
alu_src = 1'b1;
reg_write = 1'b1;
sign_or_zero = 1'b1;
end

default: begin
reg_dst = 2'b01;
mem_to_reg = 2'b00;
alu_op = 2'b00;
jump = 1'b0;
branch = 1'b0;
mem_read = 1'b0;
mem_write = 1'b0;
alu_src = 1'b0;
reg_write = 1'b1;
sign_or_zero = 1'b1;
end

endcase
end
end

endmodule


//----------------------Test Bench-------------------------------
module tb_control;

reg [2:0] opcode;
reg reset;

wire [1:0] reg_dst, mem_to_reg, alu_op;
wire jump, branch, mem_read, mem_write, alu_src, reg_write, sign_or_zero;

control c1
(opcode,reset,reg_dst,mem_to_reg,alu_op,jump,branch,mem_read,mem_write,
alu_src,reg_write,sign_or_zero);

initial begin
reset = 1;
opcode = 3'b000;
#10;

reset = 0;
opcode = 3'b000; #10; // add
opcode = 3'b001; #10; // sli
opcode = 3'b010; #10; // j
opcode = 3'b011; #10; // jal
opcode = 3'b100; #10; // lw
opcode = 3'b101; #10; // sw
opcode = 3'b110; #10; // beq
opcode = 3'b111; #10; // addi
opcode = 3'bxxx; #10;

end

endmodule
