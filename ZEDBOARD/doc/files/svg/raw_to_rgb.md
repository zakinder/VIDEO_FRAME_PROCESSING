# Entity: raw_to_rgb 

- **File**: raw_to_rgb.vhd
## Diagram

![Diagram](raw_to_rgb.svg "Diagram")
## Ports

| Port name | Direction | Type      | Description |
| --------- | --------- | --------- | ----------- |
| clk       | in        | std_logic |             |
| rst_l     | in        | std_logic |             |
| iTpData   | in        | rTp       |             |
| oRgbSet   | out       | rRgb      |             |
## Signals

| Name     | Type      | Description |
| -------- | --------- | ----------- |
| rgb      | rawRgb    |             |
| tpd1     | uTp       |             |
| r1Valid  | std_logic |             |
| r2Valid  | std_logic |             |
| d1TpData | rTp       |             |
| d2TpData | rTp       |             |
## Processes
- validSyncP: ( clk )
- syncDataP: ( clk )
- rawToRgbP: ( clk )
