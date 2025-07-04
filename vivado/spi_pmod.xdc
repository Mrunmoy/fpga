# Pin Connections

# PMODA Pin 1 → JA1P → LevelConverter LV4 → MAX7219 CS
# PMODA Pin 2 → JA1N → LevelConverter LV3 → MAX7219 CLK
# PMODA Pin 3 → JA2P → LevelConverter LV2 → MAX7219 DIN

# Schematics Reference Table 
# +------------+--------------------+------------------+----------------+
# | PMODA Sig  | FPGA Pin Name      | Package Pin      | Function       |
# +------------+--------------------+------------------+----------------+
# | JA1P       | IO_L17P_T2_34      | Y18              | CS             |
# | JA1N       | IO_L17N_T2_34      | Y19              | CLK            |
# | JA2P       | IO_L7P_T1_34       | Y16              | MOSI (DIN)     |
# +------------+--------------------+------------------+----------------+


# SPI Chip Select (CS) on PMODA JA1P Pin
set_property PACKAGE_PIN Y18 [get_ports ss_o_0[0]]
set_property IOSTANDARD LVCMOS33 [get_ports ss_o_0[0]]

# SPI Clock (CLK) on PMODA JA1N Pin
set_property PACKAGE_PIN Y19 [get_ports sck_o_0]
set_property IOSTANDARD LVCMOS33 [get_ports sck_o_0]

# SPI Data In (MOSI) on PMODA JA2P Pin
set_property PACKAGE_PIN Y16 [get_ports io0_o_0]
set_property IOSTANDARD LVCMOS33 [get_ports io0_o_0]
