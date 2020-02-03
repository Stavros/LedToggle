#Update -period with clock period (in nanoseconds) of the clock driving the fpga
create_clock -name sopc_clk -period 20 [get_ports clk_clk]

#Setting LED outputs as false path, since no timing requirement
set_false_path -from * -to [get_ports led_pin_export]


derive_clock_uncertainty
set_input_delay 0 -clock clk_clk [all_inputs]
set_output_delay 0 -clock clk_clk [all_outputs] 

#Setting 0 delay for all io
#set_input_delay 0 -clock clk [all_inputs]
#set_output_delay 0 -clock clk [all_outputs] 

#Constraining JTAG interface
#TCK port
#create_clock -name altera_reserved_tck -period 100 [get_ports altera_reserved_tck]
#cut all paths to and from tck
#set_clock_groups -exclusive -group [get_clocks altera_reserved_tck]
#constrain the TDI port
#set_input_delay -clock altera_reserved_tck 20 [get_ports altera_reserved_tdi]
#constrain the TMS port
#set_input_delay -clock altera_reserved_tck 20 [get_ports altera_reserved_tms]
#constrain the TDO port
#set_output_delay -clock altera_reserved_tck 20 [get_ports altera_reserved_tdo]