# Entity: tap4Line 

- **File**: tap4Line.vhd
## Diagram

![Diagram](tap4Line.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| img_width    | integer | 4095  |             |
| tpDataWidth  | integer | 12    |             |
## Ports

| Port name | Direction | Type                                       | Description |
| --------- | --------- | ------------------------------------------ | ----------- |
| clk       | in        | std_logic                                  |             |
| rst_l     | in        | std_logic                                  |             |
| write_en  | in        | std_logic                                  |             |
| idata     | in        | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| read_en   | in        | std_logic                                  |             |
| odata     | out       | std_logic_vector(tpDataWidth - 1 downto 0) |             |
## Signals

| Name        | Type                                       | Description |
| ----------- | ------------------------------------------ | ----------- |
| rowbuffer   | ram_type                                   |             |
| oregister   | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| i1register  | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| i2register  | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| i3register  | std_logic_vector(tpDataWidth - 1 downto 0) |             |
| write1s_enb | std_logic                                  |             |
| write2s_enb | std_logic                                  |             |
| write3s_enb | std_logic                                  |             |
| rAddres1Cnt | natural range 0 to (img_width-1)           |             |
| rAddres2Cnt | natural range 0 to (img_width-1)           |             |
| rAddres3Cnt | natural range 0 to (img_width-1)           |             |
| rAddres4Cnt | natural range 0 to (img_width-1)           |             |
| wAddres1Cnt | natural range 0 to (img_width-1)           |             |
| wAddres2Cnt | natural range 0 to (img_width-1)           |             |
| wAddres3Cnt | natural range 0 to (img_width-1)           |             |
| wAddres4Cnt | natural range 0 to (img_width-1)           |             |
| ramWaddr    | natural range 0 to (img_width-1)           |             |
| ram_Waddr   | natural range 0 to (img_width-1)           |             |
| ram2Waddr   | natural range 0 to (img_width-1)           |             |
## Types

| Name     | Type | Description |
| -------- | ---- | ----------- |
| ram_type |      |             |
## Processes
- unnamed: ( clk,rst_l )
- unnamed: ( clk,rst_l )
- unnamed: ( clk,rst_l )
- unnamed: ( clk )
- unnamed: ( clk,rst_l )
- unnamed: ( clk,rst_l )
