/*
===============================================================================
Data Memory Module (16-bit MIPS Processor)

Original Source:
FPGA4Student - https://www.fpga4student.com/
This module is adapted from educational material provided by FPGA4Student.

Modifications by Repository Author:
- Added documentation and formatting improvements
- Integrated into complete 16-bit MIPS processor design
- Used for simulation and verification in Xilinx Vivado
===============================================================================
*/

module data_memory
(
    input clk,

    // Address input (shared by read and write ports)
    input [15:0] mem_access_addr,

    // Write port
    input [15:0] mem_write_data,
    input mem_write_en,

    // Read control
    input mem_read,

    // Read port output
    output [15:0] mem_read_data
);

integer i;

/* 256 locations of 16-bit memory */
reg [15:0] ram [255:0];

/* Address mapping */
wire [15:0] ram_addr = mem_access_addr[15:0];

/* Initialize memory to zero */
initial begin
    for(i = 0; i < 256; i = i + 1)
        ram[i] <= 16'd0;
end

/* Write operation (synchronous) */
always @(posedge clk) begin
    if (mem_write_en)
        ram[ram_addr] <= mem_write_data;
end

/* Read operation (combinational) */
assign mem_read_data = (mem_read == 1'b1) ? ram[ram_addr] : 16'd0;

endmodule
