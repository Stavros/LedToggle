	ledtoggle u0 (
		.clk_clk        (<connected-to-clk_clk>),        //       clk.clk
		.led_pin_export (<connected-to-led_pin_export>), //   led_pin.export
		.reset_reset_n  (<connected-to-reset_reset_n>),  //     reset.reset_n
		.sw_pin_export  (<connected-to-sw_pin_export>),  //    sw_pin.export
		.uart_pins_rxd  (<connected-to-uart_pins_rxd>),  // uart_pins.rxd
		.uart_pins_txd  (<connected-to-uart_pins_txd>)   //          .txd
	);

