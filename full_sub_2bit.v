module full_sub_2bit (
	input  [1:0] A,
	input  [1:0] B,
	output [1:0] D,
	output       Borrow
);

	// 使用 3 位元暫存加法結果：最高位用來判斷是否借位
	wire [2:0] sum_temp;

	// 2 的補數減法：A - B = A + (~B + 1)
	assign sum_temp = {1'b0, A} + {1'b0, (~B + 2'b01)};

	// 低 2 位元即為差值
	assign D = sum_temp[1:0];

	// 最高位進位為 0 代表發生借位，因此 Borrow = ~CarryOut
	assign Borrow = ~sum_temp[2];

endmodule
