# Entity: frame_testpattern 

- **File**: frame_testpattern.vhd
## Diagram

![Diagram](frame_testpattern.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| s_data_width | integer | 16    |             |
## Ports

| Port name | Direction | Type        | Description |
| --------- | --------- | ----------- | ----------- |
| clk       | in        | std_logic   |             |
| iValid    | in        | std_logic   |             |
| iCord     | in        | coord       |             |
| oRgb      | out       | blurchannel |             |
## Signals

| Name     | Type    | Description |
| -------- | ------- | ----------- |
| xCounter | integer |             |
| yCounter | integer |             |
| rowdist  | integer |             |
| nrowdist | integer |             |
| coldist  | integer |             |
| ncoldist | integer |             |
| irgbSum  | integer |             |
## Processes
- tPattenP: ( clk )
- rgbSumP: ( clk )
