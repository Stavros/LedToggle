
module ledtoggle (
	clk_clk,
	led_pin_export,
	reset_reset_n,
	sw_pin_export,
	uart_pins_rxd,
	uart_pins_txd);	

	input		clk_clk;
	output		led_pin_export;
	input		reset_reset_n;
	input		sw_pin_export;
	input		uart_pins_rxd;
	output		uart_pins_txd;
endmodule
