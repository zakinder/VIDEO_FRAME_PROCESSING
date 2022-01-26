# Entity: buffer_controller 

- **File**: buffer_controller.vhd
## Diagram

![Diagram](buffer_controller.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| img_width    | integer | 4096  |             |
| adwrWidth    | integer | 16    |             |
| dataWidth    | integer | 12    |             |
| addrWidth    | integer | 12    |             |
## Ports

| Port name | Direction | Type                                     | Description |
| --------- | --------- | ---------------------------------------- | ----------- |
| aclk      | in        | std_logic                                |             |
| i_enable  | in        | std_logic                                |             |
| i_data    | in        | std_logic_vector(dataWidth - 1 downto 0) |             |
| i_wadd    | in        | std_logic_vector(adwrWidth - 1 downto 0) |             |
| i_radd    | in        | std_logic_vector(adwrWidth - 1 downto 0) |             |
| en_datao  | out       | std_logic                                |             |
| taps0x    | out       | std_logic_vector(dataWidth - 1 downto 0) |             |
| taps1x    | out       | std_logic_vector(dataWidth - 1 downto 0) |             |
| taps2x    | out       | std_logic_vector(dataWidth - 1 downto 0) |             |
## Signals

| Name       | Type                                     | Description |
| ---------- | ---------------------------------------- | ----------- |
| wrchx0_io  | std_logic                                |             |
| wrchx1_io  | std_logic                                |             |
| wrchx2_io  | std_logic                                |             |
| wrchx3_io  | std_logic                                |             |
| w1rchx0_io | std_logic                                |             |
| w1rchx1_io | std_logic                                |             |
| w1rchx2_io | std_logic                                |             |
| w1rchx3_io | std_logic                                |             |
| w2rchx0_io | std_logic                                |             |
| w2rchx1_io | std_logic                                |             |
| w2rchx2_io | std_logic                                |             |
| w2rchx3_io | std_logic                                |             |
| w3rchx0_io | std_logic                                |             |
| w3rchx1_io | std_logic                                |             |
| w3rchx2_io | std_logic                                |             |
| w3rchx3_io | std_logic                                |             |
| write_chs  | integer range 0 to 3                     |             |
| write_s    | std_logic                                |             |
| write_p    | std_logic                                |             |
| tap0_data  | std_logic_vector(dataWidth - 1 downto 0) |             |
| tap1_data  | std_logic_vector(dataWidth - 1 downto 0) |             |
| tap2_data  | std_logic_vector(dataWidth - 1 downto 0) |             |
| tap3_data  | std_logic_vector(dataWidth - 1 downto 0) |             |
## Processes
- unnamed: ( aclk )
- unnamed: ( aclk )
- unnamed: ( aclk )
- tap1_readout: ( aclk )
## Instantiations

- int_line_d0: tap_buffer
- int_line_d1: tap_buffer
- int_line_d2: tap_buffer
- int_line_d3: tap_buffer
