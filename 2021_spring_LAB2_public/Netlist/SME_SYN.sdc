###################################################################

# Created by write_sdc on Wed Jan 17 20:33:37 2024

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_load -pin_load 0.05 [get_ports out_valid]
set_load -pin_load 0.05 [get_ports match]
set_load -pin_load 0.05 [get_ports {match_index[4]}]
set_load -pin_load 0.05 [get_ports {match_index[3]}]
set_load -pin_load 0.05 [get_ports {match_index[2]}]
set_load -pin_load 0.05 [get_ports {match_index[1]}]
set_load -pin_load 0.05 [get_ports {match_index[0]}]
set_ideal_network -no_propagate  [get_ports clk]
create_clock [get_ports clk]  -period 5  -waveform {0 2.5}
set_input_delay -clock clk  0  [get_ports clk]
set_input_delay -clock clk  0  [get_ports rst_n]
set_input_delay -clock clk  2.5  [get_ports {chardata[7]}]
set_input_delay -clock clk  2.5  [get_ports {chardata[6]}]
set_input_delay -clock clk  2.5  [get_ports {chardata[5]}]
set_input_delay -clock clk  2.5  [get_ports {chardata[4]}]
set_input_delay -clock clk  2.5  [get_ports {chardata[3]}]
set_input_delay -clock clk  2.5  [get_ports {chardata[2]}]
set_input_delay -clock clk  2.5  [get_ports {chardata[1]}]
set_input_delay -clock clk  2.5  [get_ports {chardata[0]}]
set_input_delay -clock clk  2.5  [get_ports isstring]
set_input_delay -clock clk  2.5  [get_ports ispattern]
set_output_delay -clock clk  2.5  [get_ports out_valid]
set_output_delay -clock clk  2.5  [get_ports match]
set_output_delay -clock clk  2.5  [get_ports {match_index[4]}]
set_output_delay -clock clk  2.5  [get_ports {match_index[3]}]
set_output_delay -clock clk  2.5  [get_ports {match_index[2]}]
set_output_delay -clock clk  2.5  [get_ports {match_index[1]}]
set_output_delay -clock clk  2.5  [get_ports {match_index[0]}]
