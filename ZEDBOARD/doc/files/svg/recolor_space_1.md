# Entity: recolor_space_1 

- **File**: recolor_space_1.vhd
## Diagram

![Diagram](recolor_space_1.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| img_width    | integer | 1920  |             |
| i_data_width | integer | 8     |             |
## Ports

| Port name | Direction | Type      | Description |
| --------- | --------- | --------- | ----------- |
| clk       | in        | std_logic |             |
| reset     | in        | std_logic |             |
| iRgb      | in        | channel   |             |
| oRgb      | out       | channel   |             |
## Signals

| Name                 | Type                          | Description |
| -------------------- | ----------------------------- | ----------- |
| point_five           | sfixed(4 downto -3)           |             |
| pixel_threshold_2    | sfixed(11 downto 0)           |             |
| pixel_threshold_zero | sfixed(11 downto 0)           |             |
| tpd1                 | k_3by3                        |             |
| tpd2                 | k_3by3                        |             |
| tpd3                 | k_3by3                        |             |
| tpd4                 | k_3by3                        |             |
| v1TapRGB0x           | std_logic_vector(23 downto 0) |             |
| v1TapRGB1x           | std_logic_vector(23 downto 0) |             |
| v1TapRGB2x           | std_logic_vector(23 downto 0) |             |
| v1TapRGB3x           | std_logic_vector(23 downto 0) |             |
| tpValid              | std_logic                     |             |
| Rgb1                 | channel                       |             |
| Rgb2                 | channel                       |             |
| red_on               | rgbSumProd                    |             |
| gre_on               | rgbSumProd                    |             |
| blu_on               | rgbSumProd                    |             |
| red_select           | rgb_sum_prod                  |             |
| gre_select           | rgb_sum_prod                  |             |
| blu_select           | rgb_sum_prod                  |             |
| red_add              | rgb_add_range                 |             |
| gre_add              | rgb_add_range                 |             |
| blu_add              | rgb_add_range                 |             |
| red_detect           | rgb_detect_kernal             |             |
| gre_detect           | rgb_detect_kernal             |             |
| blu_detect           | rgb_detect_kernal             |             |
| syn1KernalData_red   | kkkCoeff                      |             |
| syn2KernalData_red   | kkkCoeff                      |             |
| syn3KernalData_red   | kkkCoeff                      |             |
| syn4KernalData_red   | kkkCoeff                      |             |
| syn5KernalData_red   | kkkCoeff                      |             |
| synaKernalData_red   | kkkCoeff                      |             |
| synbKernalData_red   | kkkCoeff                      |             |
| syn6KernalData_red   | kkkCoeff                      |             |
| syn1KernalData_gre   | kkkCoeff                      |             |
| syn2KernalData_gre   | kkkCoeff                      |             |
| syn3KernalData_gre   | kkkCoeff                      |             |
| syn4KernalData_gre   | kkkCoeff                      |             |
| syn5KernalData_gre   | kkkCoeff                      |             |
| synaKernalData_gre   | kkkCoeff                      |             |
| synbKernalData_gre   | kkkCoeff                      |             |
| syn6KernalData_gre   | kkkCoeff                      |             |
| syn1KernalData_blu   | kkkCoeff                      |             |
| syn2KernalData_blu   | kkkCoeff                      |             |
| syn3KernalData_blu   | kkkCoeff                      |             |
| syn4KernalData_blu   | kkkCoeff                      |             |
| syn5KernalData_blu   | kkkCoeff                      |             |
| synaKernalData_blu   | kkkCoeff                      |             |
| synbKernalData_blu   | kkkCoeff                      |             |
| syn6KernalData_blu   | kkkCoeff                      |             |
| rgbSyncValid         | std_logic_vector(15 downto 0) |             |
## Processes
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
## Instantiations

- RGBInst: rgb_4taps
- sharp_f_valid_inst: d_valid
- rgb5_syncr_inst: sync_frames
