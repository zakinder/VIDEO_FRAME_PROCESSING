# Entity: color_correction 

- **File**: color_correction.vhd
## Diagram

![Diagram](color_correction.svg "Diagram")
## Generics

| Generic name      | Type    | Value | Description |
| ----------------- | ------- | ----- | ----------- |
| i_k_config_number | integer | 8     |             |
## Ports

| Port name | Direction | Type        | Description |
| --------- | --------- | ----------- | ----------- |
| clk       | in        | std_logic   |             |
| rst_l     | in        | std_logic   |             |
| iRgb      | in        | channel     |             |
| als       | in        | coefficient |             |
| oRgb      | out       | channel     |             |
## Signals

| Name         | Type                         | Description |
| ------------ | ---------------------------- | ----------- |
| cc           | ccKernel                     |             |
| ccRgb        | ccRgbRecord                  |             |
| threshold    | sfixed(9 downto 0)           |             |
| rgbSyncValid | std_logic_vector(7 downto 0) |             |
## Processes
- rgbToSf_P: ( clk,rst_l )
- syncValid_P: ( clk,rst_l )
- ccSfConfig_P: ( clk,rst_l )
- ccProdSf_P: ( clk,rst_l )
- ccProdToSn_P: ( clk,rst_l )
- ccRgbSum_P: ( clk,rst_l )
- rgbSnSumTr_P: ( clk, rst_l )
