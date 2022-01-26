# Entity: avg_values 

- **File**: avg_values.vhd
## Diagram

![Diagram](avg_values.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| i_data_width | integer | 8     |             |
## Ports

| Port name | Direction | Type      | Description |
| --------- | --------- | --------- | ----------- |
| clk       | in        | std_logic |             |
| reset     | in        | std_logic |             |
| aRgb      | in        | channel   |             |
| bRgb      | in        | channel   |             |
| cRgb      | in        | channel   |             |
| oRgb      | out       | channel   |             |
## Signals

| Name    | Type            | Description |
| ------- | --------------- | ----------- |
| uFl1Rgb | tpToFloatRecord |             |
| uFl2Rgb | tpToFloatRecord |             |
| uFl3Rgb | tpToFloatRecord |             |
| uFl4Rgb | tpToFloatRecord |             |
| uFl5Rgb | tpToFloatRecord |             |
## Processes
- unnamed: ( clk,reset )
- unnamed: ( clk,reset )
- unnamed: ( clk,reset )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
