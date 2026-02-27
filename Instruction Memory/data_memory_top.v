/*
Top module of a 16-bit MIPS processor integrating ALU, ALU Control,
Register File, Instruction Memory, and Data Memory. This module
connects all datapath components and performs execution based on
control signals. The file also includes a testbench used to simulate
and verify processor functionality.
*/


module top3_B(pc,clk,rst,reg_write_en,
zero,mem_to_reg,sign_or_zero,mem_write_en,mem_read,alu_src,reg_dst);

input [15:0] pc;
input clk,mem_write_en,mem_read;
input rst,sign_or_zero;
input reg_write_en;
input [1:0] mem_to_reg;
input alu_src;
input reg_dst;

output zero;

wire [15:0] reg_write_data;
wire [15:0] imm_ext;
wire [15:0] result,mem_read_data;
wire [2:0] alu_control;
wire [2:0] reg_write_dest;
wire [15:0] reg_read_data_2,reg_read_data_1,read_data2,zero_ext_im,sign_ext_im;
wire [15:0] instruction;

alu k1(reg_read_data_1, read_data2, alu_control, result, zero);

ALUControl k2(alu_control, instruction[15:14], instruction[3:0]);

register_file k3(clk,rst,reg_write_en,reg_write_dest,
reg_write_data,instruction[12:10],reg_read_data_1,
instruction[9:7],reg_read_data_2);

instr_mem k4(pc,instruction);

data_memory k5(clk, result, reg_read_data_2,
mem_write_en, mem_read, mem_read_data);

assign reg_write_data = (mem_to_reg == 2'b10) ? mem_read_data : result;

assign read_data2 = (alu_src==1'b1) ? imm_ext : reg_read_data_2;

assign imm_ext = (sign_or_zero==1'b1) ? sign_ext_im : zero_ext_im;

assign sign_ext_im = {{9{instruction[6]}},instruction[6:0]};
assign zero_ext_im = {{9{1'b0}},instruction[6:0]};

assign reg_write_dest = (reg_dst==1'b0) ? instruction[6:4] : instruction[9:7];

endmodule


//----------------Test Bench------------------
module tb_top3_B();

reg [15:0] pc;
reg clk,mem_write_en,mem_read;
reg rst,sign_or_zero;
reg reg_write_en,alu_src;
reg [1:0] mem_to_reg;
reg reg_dst;

wire zero;

top3_B k2(pc,clk,rst,reg_write_en,
zero,mem_to_reg,sign_or_zero,mem_write_en,mem_read,alu_src,reg_dst);

always
#5 clk=~clk;

initial
begin
clk=0;
rst=1;
mem_to_reg=2'b11;
reg_write_en=1;
mem_write_en=1;
alu_src=1;
reg_dst=0;

#10 rst=0;

#10 pc=16'd4;
alu_src=1;
sign_or_zero=0;
mem_read=0;
mem_write_en=1;

#50;
rst=0;
pc=16'd5;
mem_read=1;
mem_write_en=0;
mem_to_reg=2'b10;
reg_dst=1;

end

endmodule
