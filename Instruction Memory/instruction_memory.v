// Reference: Adapted from fpga4student.com
// Description:
// Synthesizable ROM used as Instruction Memory for a simplified
// 16-bit MIPS processor implementation.

module instr_mem
(
    input  [15:0] pc,          // Program Counter input
    output wire [15:0] instruction // Instruction output
);

// ROM address derived from PC
wire [3:0] rom_addr;
assign rom_addr = pc[4:1];

// Instruction ROM (16 locations × 16-bit)
reg [15:0] rom [15:0];

/*
 Example Program (Encoded Instructions)

 lw   $3, 0($0)
 Loop:
 slti $1, $3, 50
 beq  $1, $0, Skip
 add  $4, $4, $3
 addi $3, $3, 1
 beq  $0, $0, Loop
 Skip:
*/

initial
begin
    rom[0]  = 16'b000_010_011_001_0000;
    rom[1]  = 16'b000_010_011_001_0001;
    rom[2]  = 16'b000_010_011_001_0010;
    rom[3]  = 16'b000_010_011_001_0011;
    rom[4]  = 16'b000_111_010_0000111;
    rom[5]  = 16'b000_010_100_0000111;

    // Remaining memory initialized to zero
    rom[6]  = 16'b0000000000000000;
    rom[7]  = 16'b0000000000000000;
    rom[8]  = 16'b0000000000000000;
    rom[9]  = 16'b0000000000000000;
    rom[10] = 16'b0000000000000000;
    rom[11] = 16'b0000000000000000;
    rom[12] = 16'b0000000000000000;
    rom[13] = 16'b0000000000000000;
    rom[14] = 16'b0000000000000000;
    rom[15] = 16'b0000000000000000;
end

// Instruction fetch logic
assign instruction = (pc < 16'd32) ? rom[rom_addr] : 16'd0;

endmodule
