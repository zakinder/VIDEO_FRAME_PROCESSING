# Entity: color_space_limits 

- **File**: color_space_limits.vhd
## Diagram

![Diagram](color_space_limits.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| i_data_width | integer | 8     |             |
## Ports

| Port name | Direction | Type                               | Description |
| --------- | --------- | ---------------------------------- | ----------- |
| clk       | in        | std_logic                          |             |
| reset     | in        | std_logic                          |             |
| iRgb      | in        | channel                            |             |
| rgbColors | out       | type_RgbArray(0 to i_data_width-1) |             |
## Signals

| Name          | Type          | Description |
| ------------- | ------------- | ----------- |
| Rgb1          | channel       |             |
| Rgb2          | channel       |             |
| int1Rgb       | intChannel    |             |
| int2Rgb       | intChannel    |             |
| ilm           | rgbConstraint |             |
| rgbMax        | integer       |             |
| rgbMin        | integer       |             |
| rgbDelta      | integer       |             |
| maxMinSum     | integer       |             |
| bMin          | std_logic     |             |
| gMin          | std_logic     |             |
| rMin          | std_logic     |             |
| bMax          | std_logic     |             |
| gMax          | std_logic     |             |
| rMax          | std_logic     |             |
| R_MinValue    | natural       |             |
| G_MinValue    | natural       |             |
| B_MinValue    | natural       |             |
| R_MinValueRow | natural       |             |
| rMr           | natural       |             |
| rMrm          | natural       |             |
| G_MinValueRow | natural       |             |
| B_MinValueRow | natural       |             |
| R_MinFValue   | natural       |             |
| R_MinMFValue  | natural       |             |
| G_MinFValue   | natural       |             |
| B_MinFValue   | natural       |             |
| rgbFedge      | std_logic     |             |
| rgbFedgeSync  | std_logic     |             |
## Processes
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk,reset )
- rgbMinP: ( clk )
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
