	component ledtoggle is
		port (
			clk_clk        : in  std_logic := 'X'; -- clk
			led_pin_export : out std_logic;        -- export
			reset_reset_n  : in  std_logic := 'X'; -- reset_n
			sw_pin_export  : in  std_logic := 'X'; -- export
			uart_pins_rxd  : in  std_logic := 'X'; -- rxd
			uart_pins_txd  : out std_logic         -- txd
		);
	end component ledtoggle;

	u0 : component ledtoggle
		port map (
			clk_clk        => CONNECTED_TO_clk_clk,        --       clk.clk
			led_pin_export => CONNECTED_TO_led_pin_export, --   led_pin.export
			reset_reset_n  => CONNECTED_TO_reset_reset_n,  --     reset.reset_n
			sw_pin_export  => CONNECTED_TO_sw_pin_export,  --    sw_pin.export
			uart_pins_rxd  => CONNECTED_TO_uart_pins_rxd,  -- uart_pins.rxd
			uart_pins_txd  => CONNECTED_TO_uart_pins_txd   --          .txd
		);

