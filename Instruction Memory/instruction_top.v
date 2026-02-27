// Description:
// Integrates Instruction Memory, Register File, ALU Control and ALU to demonstrate instruction-driven execution.
// Instruction fields are decoded to control register access and ALU operations.

module top3(
    input clk,
    input rst,
    input reg_write_en,
    input [2:0] reg_write_dest,
    input [15:0] reg_write_data,
    input [15:0] pc,
    output [15:0] result,
    output zero
);

wire [15:0] instruction;
wire [15:0] reg_read_data_1, reg_read_data_2;

// Register File
register_file k1(
    clk,
    rst,
    reg_write_en,
    instruction[6:4],      // write destination register
    reg_write_data,
    instruction[9:7],      // read register 1
    reg_read_data_1,
    instruction[12:10],    // read register 2
    reg_read_data_2
);

// ALU Control Unit
wire [2:0] ALU_Control;

ALUControl K2(
    ALU_Control,
    instruction[15:14],    // ALUOp
    instruction[3:0]       // Function field
);

// ALU
alu k3(
    reg_read_data_1,
    reg_read_data_2,
    ALU_Control,
    result,
    zero
);

// Instruction Memory
instr_mem k4(
    pc,
    instruction
);

endmodule

//--------------Test Bench----------------
module tb_top3();
// Inputs
reg clk;
reg rst;
reg reg_write_en;
reg [2:0] reg_write_dest; // 3-bit register destination
wire [15:0] reg_write_data;
reg [15:0] pc;
wire [15:0] result;
wire zero;
top3 k(clk, rst, reg_write_en, reg_write_dest, reg_write_data, pc,result,zero);
always begin
#5 clk = ~clk;
end
initial begin
clk = 0;
rst = 0;
reg_write_en = 0;
reg_write_dest = 3'b000;
pc = 16'b0;
rst = 1;
#10; // Wait for 10 ns
rst = 0;
pc = 16'd0;
#10;
pc =16'd1;
#10;
pc = 16'd2;
#10;
pc =16'd3;
end
endmodule
