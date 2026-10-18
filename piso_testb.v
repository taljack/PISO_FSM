`timescale 1ps/1ps

module tb_piso;
    reg clk,rst,valid_in,shift_en;
    wire serial_out,valid_out;
    reg [7:0] data;

    piso test(
        .clk(clk),
        .data(data),
        .rst(rst),
        .load(valid_in),
        .valid_out(valid_out),
        .shift_en(shift_en),
        .out(serial_out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    
initial begin
    $dumpfile("sc.vcd");
    $dumpvars(0, tb_piso);

    rst = 1;
    valid_in = 0;
    data = 0;
    shift_en = 0;

    repeat (2) @(negedge clk);
    rst = 0;

    data = 8'b10101010;
    valid_in = 1;
    @(negedge clk);
    valid_in = 0;

    shift_en = 1;
    repeat (8) @(negedge clk);
    shift_en = 0;

    repeat (2) @(negedge clk);
    valid_in = 1;
    shift_en = 0;
    data = 8'b11011101;
    @(negedge clk);
    valid_in = 0;
    shift_en = 1;
    repeat (8) @(negedge clk);
    shift_en = 0;
    $finish;
end

    
endmodule