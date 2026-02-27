// Description:
// 8-register, 16-bit Register File with one write port
// and two read ports. Supports synchronous write and asynchronous read operations.
// Note:
// This implementation is adapted from an online educational reference and used for academic learning and simulation.
// Reference: FPGA4Student (educational resource)
// The module was studied, integrated, and verified as part of processor datapath understanding.

module register_file
(
    input clk,
    input rst,

    // Write Port
    input reg_write_en,
    input [2:0] reg_write_dest,
    input [15:0] reg_write_data,

    // Read Port 1
    input [2:0] reg_read_addr_1,
    output [15:0] reg_read_data_1,

    // Read Port 2
    input [2:0] reg_read_addr_2,
    output [15:0] reg_read_data_2
);


reg [15:0] reg_array [7:0];


always @ (posedge clk or posedge rst)
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
    else begin
        if (reg_write_en)
            reg_array[reg_write_dest] <= reg_write_data;
    end
end

assign reg_read_data_1 =
    (reg_read_addr_1 == 3'b000) ? 16'b0 :
    reg_array[reg_read_addr_1];

assign reg_read_data_2 =
    (reg_read_addr_2 == 3'b000) ? 16'b0 :
    reg_array[reg_read_addr_2];

endmodule
