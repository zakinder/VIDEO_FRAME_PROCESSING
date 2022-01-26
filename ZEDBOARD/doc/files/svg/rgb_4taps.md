# Entity: rgb_4taps 

- **File**: rgb_4taps.vhd
## Diagram

![Diagram](rgb_4taps.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| img_width    | integer | 4096  |             |
| tpDataWidth  | integer | 8     |             |
## Ports

| Port name | Direction | Type                                       | Description |
| --------- | --------- | ------------------------------------------ | ----------- |
| clk       | in        | std_logic                                  |             |
| rst_l     | in        | std_logic                                  |             |
| iRgb      | in        | channel                                    |             |
| tpValid   | out       | std_logic                                  |             |
| tp0       | out       | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| tp1       | out       | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| tp2       | out       | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| tp3       | out       | std_logic_vector(tpDataWidth - 1 downto 0) |             |
## Signals

| Name             | Type                                       | Description |
| ---------------- | ------------------------------------------ | ----------- |
| tap0_data        | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| tap1_data        | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| tap2_data        | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| d6RGB            | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| d5RGB            | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| d4RGB            | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| d3RGB            | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| d2RGB            | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| d1RGB            | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| dS_1RGB          | channel                                    |             |
| dS_2RGB          | channel                                    |             |
| dS_3RGB          | channel                                    |             |
| rgbPixel         | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| readCnt          | natural range 0 to 3                       |             |
| read_en          | std_logic                                  |             |
| write_s          | std_logic                                  |             |
| writess          | std_logic                                  |             |
| writesss         | std_logic                                  |             |
| writepp          | std_logic                                  |             |
| write_p          | std_logic                                  |             |
| write_v          | std_logic                                  |             |
| tap_d0_valid     | std_logic                                  |             |
| tap_d1_valid     | std_logic                                  |             |
| tap_d2_valid     | std_logic                                  |             |
| tap_d3_valid     | std_logic                                  |             |
| xy               | cord                                       |             |
| x2y              | cord                                       |             |
| iRgb_valid_value | natural                                    |             |
## Processes
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk,rst_l )
- unnamed: ( clk,rst_l )
## Instantiations

- tapLineD0: tap4Line
- tapLineD1: tap4Line
- tapLineD2: tap4Line
