# Entity: hsv_c 

- **File**: hsv.vhd
## Diagram

![Diagram](hsv.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| i_data_width | natural | 8     |             |
## Ports

| Port name | Direction | Type      | Description |
| --------- | --------- | --------- | ----------- |
| clk       | in        | std_logic |             |
| reset     | in        | std_logic |             |
| iRgb      | in        | channel   |             |
| oHsv      | out       | channel   |             |
## Signals

| Name         | Type                 | Description |
| ------------ | -------------------- | ----------- |
| uFs1Rgb      | intChannel           |             |
| uFs2Rgb      | intChannel           |             |
| uFs3Rgb      | intChannel           |             |
| uFs11Rgb     | intChannel           |             |
| uFs22Rgb     | intChannel           |             |
| rgbMax       | natural              |             |
| rgb2Max      | natural              |             |
| rgbMin       | natural              |             |
| maxValue     | natural              |             |
| minValue     | natural              |             |
| rgbDelta     | natural              |             |
| hue_quot     | ufixed(17 downto 0)  |             |
| uuFiXhueQuot | ufixed(17 downto -9) |             |
| uuFiXhueTop  | ufixed(17 downto 0)  |             |
| uuFiXhueBot  | ufixed(8 downto 0)   |             |
| uFiXhueTop   | natural              |             |
| uFiXhueBot   | natural              |             |
| uFiXhueQuot  | natural              |             |
| hueQuot1x    | natural              |             |
| hueDeg       | natural              |             |
| hueDeg1x     | natural              |             |
| h_value      | natural              |             |
| s1value      | unsigned(7 downto 0) |             |
| s2value      | unsigned(7 downto 0) |             |
| s3value      | unsigned(7 downto 0) |             |
| v1value      | unsigned(7 downto 0) |             |
| v2value      | unsigned(7 downto 0) |             |
| v3value      | unsigned(7 downto 0) |             |
| v4value      | unsigned(7 downto 0) |             |
| v5value      | unsigned(7 downto 0) |             |
| valid1_rgb   | std_logic            |             |
| valid2_rgb   | std_logic            |             |
| valid3_rgb   | std_logic            |             |
| sHsl         | channel              |             |
| lHsl         | channel              |             |
| rgb_ol1_red  | sfixed(9 downto 0)   |             |
| rgb_ol2_red  | sfixed(9 downto 0)   |             |
| rgb_ol3_red  | sfixed(9 downto 0)   |             |
| rgb_ol4_red  | sfixed(9 downto 0)   |             |
| rgb_ool4     | channel              |             |
| rgb_colo     | rgbToSfRecord        |             |
| rgb_oolo     | rgbToSfRecord        |             |
| rgb_ool2     | rgbToSf12Record      |             |
| rgb_ool3     | rgbToSfRecord        |             |
| valid4_rgb   | std_logic            |             |
| valid5_rgb   | std_logic            |             |
| valid6_rgb   | std_logic            |             |
| valid7_rgb   | std_logic            |             |
| valid8_rgb   | std_logic            |             |
## Processes
- rgbToUfP: ( clk,reset )
- rgbMaxP: ( clk )
- rgbMinP: ( clk )
- pipRgbMaxUfD1P: ( clk )
- rgbDeltaP: ( clk )
- pipRgbD2P: ( clk )
- hueP: ( clk )
- hueBottomP: ( clk )
- hueDegreeP: ( clk )
- hueDividerResizeP: ( clk )
- hueValueP: ( clk )
- satValueP: ( clk )
- valValueP: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk,reset )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- pipRgbwD2P: ( clk )
## Instantiations

- rgb_ool1_inst: sync_frames
