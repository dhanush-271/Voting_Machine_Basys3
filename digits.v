`timescale 1ns / 1ps
module digits(
    input clk,
    input reset,
    input BJP_FIG,
    input CONG_FIG,
    input NOTA_FIG,
    input [9:0] BJP_COUNT,
    input [9:0] NOTA_COUNT,
    input [9:0] CONG_COUNT,
    output reg [3:0] ones,
    output reg [3:0] tens,
    output reg [3:0] hundreds,
    output reg [3:0] thousands
);

reg [9:0] temp_count = 0;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        ones <= 0;
        tens <= 0;
        hundreds <= 0;
        thousands <= 0;
        temp_count<=0;
    end else begin
        if (BJP_FIG) begin
            temp_count <= BJP_COUNT;
        end else if (CONG_FIG) begin
            temp_count <= CONG_COUNT;
        end else if (NOTA_FIG) begin
            temp_count <= NOTA_COUNT;
        end else begin
            temp_count <= 0;
        end

        ones <= temp_count % 10;
        tens <= (temp_count / 10) % 10;
        hundreds <= (temp_count / 100) % 10;
        thousands <= (temp_count / 1000) % 10;
    end
end

endmodule
