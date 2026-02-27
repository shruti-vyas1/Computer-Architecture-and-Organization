// ===================== ALU =====================
module alu(
input [15:0] a,
input [15:0] b,
input [2:0] alu_control,
output reg [15:0] result,
output zero
);

always @(*) begin
    case(alu_control)
        3'b000: result = a + b;
        3'b001: result = a - b;
        3'b010: result = a & b;
        3'b011: result = a | b;
        3'b100: result = (a < b) ? 16'd1 : 16'd0;
        default: result = a + b;
    endcase
end

assign zero = (result == 16'd0) ? 1'b1 : 1'b0;

endmodule


// ===================== ALU CONTROL =====================
module ALUControl(
output reg [2:0] ALU_Control,
input [1:0] ALUOp,
input [3:0] Function
);

wire [5:0] ALUControlIn;
assign ALUControlIn = {ALUOp, Function};

always @(ALUControlIn)
begin
    casex(ALUControlIn)
        6'b11xxxx: ALU_Control = 3'b000;
        6'b10xxxx: ALU_Control = 3'b100;
        6'b01xxxx: ALU_Control = 3'b001;
        6'b000000: ALU_Control = 3'b000;
        6'b000001: ALU_Control = 3'b001;
        6'b000010: ALU_Control = 3'b010;
        6'b000011: ALU_Control = 3'b011;
        6'b000100: ALU_Control = 3'b100;
        default:   ALU_Control = 3'b000;
    endcase
end

endmodule


// ===================== JR CONTROL =====================
module JR_Control(
input [1:0] alu_op,
input [3:0] funct,
output JRControl
);

assign JRControl = ({alu_op, funct} == 6'b001000) ? 1'b1 : 1'b0;

endmodule


// ===================== REGISTER FILE =====================
module register_file(
input clk,
input rst,
input reg_write_en,
input [2:0] reg_write_dest,
input [15:0] reg_write_data,
input [2:0] reg_read_addr_1,
output [15:0] reg_read_data_1,
input [2:0] reg_read_addr_2,
output [15:0] reg_read_data_2
);

reg [15:0] reg_array [7:0];

always @(posedge clk or posedge rst)
begin
    if (rst) begin
        reg_array[0] <= 16'b0;
        reg_array[1] <= 16'b0;
        reg_array[2] <= 16'b0;
        reg_array[3] <= 16'b0;
        reg_array[4] <= 16'b0;
        reg_array[5] <= 16'b0;
        reg_array[6] <= 16'b0;
        reg_array[7] <= 16'b0;
    end
    else if (reg_write_en) begin
        reg_array[reg_write_dest] <= reg_write_data;
    end
end

assign reg_read_data_1 =
    (reg_read_addr_1 == 0) ? 16'b0 : reg_array[reg_read_addr_1];

assign reg_read_data_2 =
    (reg_read_addr_2 == 0) ? 16'b0 : reg_array[reg_read_addr_2];

endmodule


// ===================== INSTRUCTION MEMORY =====================
module instr_mem(
input [15:0] pc,
output wire [15:0] instruction
);

wire [3:0] rom_addr = pc[4:1];
reg [15:0] rom [15:0];

initial begin
    rom[0] = 16'b1000000110000000;
    rom[1] = 16'b0010110010110010;
    rom[2] = 16'b1101110001100111;
    rom[3] = 16'b1101110111011001;
    rom[4] = 16'b1111110110110001;
    rom[5] = 16'b1100000001111011;
    rom[6] = 16'b0;
    rom[7] = 16'b0;
    rom[8] = 16'b0;
    rom[9] = 16'b0;
    rom[10] = 16'b0;
    rom[11] = 16'b0;
    rom[12] = 16'b0;
    rom[13] = 16'b0;
    rom[14] = 16'b0;
    rom[15] = 16'b0;
end

assign instruction =
    (pc < 16'd32) ? rom[rom_addr] : 16'd0;

endmodule


// ===================== DATA MEMORY =====================
module data_memory(
input clk,
input [15:0] mem_access_addr,
input [15:0] mem_write_data,
input mem_write_en,
input mem_read,
output [15:0] mem_read_data
);

integer i;
reg [15:0] ram [255:0];
wire [7:0] ram_addr = mem_access_addr[8:1];

initial begin
    for(i = 0; i < 256; i = i + 1)
        ram[i] <= 16'd0;
end

always @(posedge clk)
begin
    if(mem_write_en)
        ram[ram_addr] <= mem_write_data;
end

assign mem_read_data =
    (mem_read == 1'b1) ? ram[ram_addr] : 16'd0;

endmodule


// ===================== CONTROL UNIT =====================
module control(
input [2:0] opcode,
input reset,
output reg [1:0] reg_dst, mem_to_reg, alu_op,
output reg jump, branch, mem_read, mem_write,
output reg alu_src, reg_write, sign_or_zero
);

always @(*) begin
    if(reset) begin
        reg_dst=0; mem_to_reg=0; alu_op=0;
        jump=0; branch=0; mem_read=0; mem_write=0;
        alu_src=0; reg_write=0; sign_or_zero=1;
    end
    else begin
        case(opcode)
            3'b000: begin reg_dst=1; mem_to_reg=0; alu_op=0; jump=0; branch=0; mem_read=0; mem_write=0; alu_src=0; reg_write=1; sign_or_zero=1; end
            3'b001: begin reg_dst=0; mem_to_reg=0; alu_op=2; jump=0; branch=0; mem_read=0; mem_write=0; alu_src=1; reg_write=1; sign_or_zero=0; end
            3'b010: begin reg_dst=0; mem_to_reg=0; alu_op=0; jump=1; branch=0; mem_read=0; mem_write=0; alu_src=0; reg_write=0; sign_or_zero=1; end
            3'b011: begin reg_dst=2; mem_to_reg=2; alu_op=0; jump=1; branch=0; mem_read=0; mem_write=0; alu_src=0; reg_write=1; sign_or_zero=1; end
            3'b100: begin reg_dst=0; mem_to_reg=1; alu_op=3; jump=0; branch=0; mem_read=1; mem_write=0; alu_src=1; reg_write=1; sign_or_zero=1; end
            3'b101: begin reg_dst=0; mem_to_reg=0; alu_op=3; jump=0; branch=0; mem_read=0; mem_write=1; alu_src=1; reg_write=0; sign_or_zero=1; end
            3'b110: begin reg_dst=0; mem_to_reg=0; alu_op=1; jump=0; branch=1; mem_read=0; mem_write=0; alu_src=0; reg_write=0; sign_or_zero=1; end
            3'b111: begin reg_dst=0; mem_to_reg=0; alu_op=3; jump=0; branch=0; mem_read=0; mem_write=0; alu_src=1; reg_write=1; sign_or_zero=1; end
            default:begin reg_dst=1; mem_to_reg=0; alu_op=0; jump=0; branch=0; mem_read=0; mem_write=0; alu_src=0; reg_write=1; sign_or_zero=1; end
        endcase
    end
end

endmodule


// ===================== SINGLE CYCLE MIPS =====================
module mips_16(
input clk,
input reset,
output [15:0] pc_out,
output [15:0] alu_result
);

reg [15:0] pc_current;
wire [15:0] pc_next, pc2;
wire [15:0] instr;
wire [1:0] reg_dst, mem_to_reg, alu_op;
wire jump, branch, mem_read, mem_write, alu_src, reg_write, sign_or_zero;

always @(posedge clk or posedge reset)
begin
    if(reset)
        pc_current <= 16'd0;
    else
        pc_current <= pc_next;
end

assign pc2 = pc_current + 16'd2;

instr_mem im(.pc(pc_current), .instruction(instr));

assign pc_next = pc2;

assign pc_out = pc_current;
assign alu_result = 16'd0;

endmodule


// ===================== TESTBENCH =====================
module tb_mips16;

reg clk;
reg reset;

wire [15:0] pc_out;
wire [15:0] alu_result;

mips_16 uut(
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out),
    .alu_result(alu_result)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    reset = 1;
    #100;
    reset = 0;
end

endmodule
