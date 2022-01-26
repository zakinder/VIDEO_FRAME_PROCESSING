# Entity: rgb_ycbcr 

- **File**: rgb_ycbcr.vhd
## Diagram

![Diagram](rgb_ycbcr.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| i_data_width | integer | 8     |             |
| i_precision  | integer | 12    |             |
| i_full_range | boolean | FALSE |             |
## Ports

| Port name | Direction | Type                                      | Description |
| --------- | --------- | ----------------------------------------- | ----------- |
| clk       | in        | std_logic                                 |             |
| rst_l     | in        | std_logic                                 |             |
| iRgb      | in        | channel                                   |             |
| y         | out       | std_logic_vector(i_data_width-1 downto 0) |             |
| cb        | out       | std_logic_vector(i_data_width-1 downto 0) |             |
| cr        | out       | std_logic_vector(i_data_width-1 downto 0) |             |
| oValid    | out       | std_logic                                 |             |
## Signals

| Name       | Type                              | Description |
| ---------- | --------------------------------- | ----------- |
| C_I32_Y_R  | unsigned(31 downto 0)             |             |
| C_I32_Y_G  | unsigned(31 downto 0)             |             |
| C_I32_Y_B  | unsigned(31 downto 0)             |             |
| C_I32_CB_R | unsigned(31 downto 0)             |             |
| C_I32_CB_G | unsigned(31 downto 0)             |             |
| C_I32_CB_B | unsigned(31 downto 0)             |             |
| C_I32_CR_R | unsigned(31 downto 0)             |             |
| C_I32_CR_G | unsigned(31 downto 0)             |             |
| C_I32_CR_B | unsigned(31 downto 0)             |             |
| C_I_Y_R    | unsigned(i_precision-1 downto 0)  |             |
| C_I_Y_G    | unsigned(i_precision-1 downto 0)  |             |
| C_I_Y_B    | unsigned(i_precision-1 downto 0)  |             |
| C_I_CB_R   | unsigned(i_precision-1 downto 0)  |             |
| C_I_CB_G   | unsigned(i_precision-1 downto 0)  |             |
| C_I_CB_B   | unsigned(i_precision-1 downto 0)  |             |
| C_I_CR_R   | unsigned(i_precision-1 downto 0)  |             |
| C_I_CR_G   | unsigned(i_precision-1 downto 0)  |             |
| C_I_CR_B   | unsigned(i_precision-1 downto 0)  |             |
| C_I_128    | unsigned(i_data_width-1 downto 0) |             |
| C_I_16     | unsigned(i_data_width-1 downto 0) |             |
| r_0        | unsigned(i_data_width-1 downto 0) |             |
| g_0        | unsigned(i_data_width-1 downto 0) |             |
| b_0        | unsigned(i_data_width-1 downto 0) |             |
| en_0       | std_logic                         |             |
| y_r        | unsigned(i_precision-1 downto 0)  |             |
| y_g        | unsigned(i_precision-1 downto 0)  |             |
| y_b        | unsigned(i_precision-1 downto 0)  |             |
| cb_r       | unsigned(i_precision-1 downto 0)  |             |
| cb_g       | unsigned(i_precision-1 downto 0)  |             |
| cb_b       | unsigned(i_precision-1 downto 0)  |             |
| cr_r       | unsigned(i_precision-1 downto 0)  |             |
| cr_g       | unsigned(i_precision-1 downto 0)  |             |
| cr_b       | unsigned(i_precision-1 downto 0)  |             |
| en_1       | std_logic                         |             |
| y_2        | unsigned(i_data_width downto 0)   |             |
| cb_2       | unsigned(i_data_width downto 0)   |             |
| cr_2       | unsigned(i_data_width downto 0)   |             |
| en_2       | std_logic                         |             |
| y_3        | unsigned(i_data_width-1 downto 0) |             |
| cb_3       | unsigned(i_data_width-1 downto 0) |             |
| cr_3       | unsigned(i_data_width-1 downto 0) |             |
| en_3       | std_logic                         |             |
## Constants

| Name    | Type                             | Value                                                           | Description |
| ------- | -------------------------------- | --------------------------------------------------------------- | ----------- |
| C_1_PRE | unsigned(i_precision-1 downto 0) | to_unsigned(1,<br><span style="padding-left:20px"> i_precision) |             |
## Processes
- STAGE_0_PROC: ( clk, rst_l, iRgb.red, iRgb.green, iRgb.blue, iRgb )
- STAGE_1_PROC: ( clk, rst_l, en_0, r_0, g_0, b_0 )
- STAGE_2_PROC: ( clk, rst_l, en_1,y_r, y_g, y_b,cb_r, cb_g, cb_b,cr_r, cr_g, cr_b )
- STAGE_3_PROC: ( clk, rst_l, en_2,y_r, y_g, y_b,cb_r, cb_g, cb_b,cr_r, cr_g, cr_b )
