// Top Module with Register File and ALU Integration
// Description:
// Top-level datapath module integrating Register File, ALU Control Unit, and ALU.
// This module was designed and implemented to understand processor datapath operation and hierarchical hardware design.

module top_2(
    input clk,
    input rst,
    input reg_write_en,
    input [2:0] reg_write_dest,
    input [15:0] reg_write_data,
    input [2:0] reg_read_addr_1,
    input [2:0] reg_read_addr_2,
    input [1:0] ALUOp,
    input [3:0] Function,
    output [15:0] result,
    output zero
);

wire [15:0] reg_read_data_1, reg_read_data_2;

// Register File
register_file K1(
    clk,
    rst,
    reg_write_en,
    reg_write_dest,
    reg_write_data,
    reg_read_addr_1,
    reg_read_data_1,
    reg_read_addr_2,
    reg_read_data_2
);

// ALU Control Unit
wire [2:0] ALU_Control;

ALUControl K2(
    ALU_Control,
    ALUOp,
    Function
);

// ALU
alu K3(
    reg_read_data_1,
    reg_read_data_2,
    ALU_Control,
    result,
    zero
);

endmodule



// ------------------------------------------------------------
// Testbench for Top Module
// ------------------------------------------------------------

module tb_top2();

reg clk, rst;
reg reg_write_en;
reg [2:0] reg_write_dest;
reg [15:0] reg_write_data;
reg [2:0] reg_read_addr_1;
reg [2:0] reg_read_addr_2;
reg [1:0] ALUOp;
reg [3:0] Function;

wire [15:0] result;
wire zero;

// Instantiate Top Module
top_2 L1(
    clk,
    rst,
    reg_write_en,
    reg_write_dest,
    reg_write_data,
    reg_read_addr_1,
    reg_read_addr_2,
    ALUOp,
    Function,
    result,
    zero
);

// Clock generation
always
    #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    // Write values into registers
    reg_write_en = 1;
    reg_write_dest = 3'd1;
    reg_write_data = 16'd20;

    #10;
    reg_write_dest = 3'd2;
    reg_write_data = 16'd10;

    #10;
    reg_write_en = 0;

    // Read registers and perform ALU operations
    reg_read_addr_1 = 3'd1;
    reg_read_addr_2 = 3'd2;

    ALUOp = 2'b11; Function = 4'bxxxx;
    #10;
    ALUOp = 2'b10; Function = 4'bxxxx;
    #10;
    ALUOp = 2'b01; Function = 4'bxxxx;
    #10;
    ALUOp = 2'b00; Function = 4'b0000;
    #10;
    ALUOp = 2'b00; Function = 4'b0001;
    #10;
    ALUOp = 2'b00; Function = 4'b0010;
    #10;
    ALUOp = 2'b00; Function = 4'b0011;
    #10;
    ALUOp = 2'b00; Function = 4'b0100;

end

endmodule
