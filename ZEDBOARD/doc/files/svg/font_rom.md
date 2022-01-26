# Entity: font_rom 

- **File**: font_rom.vhd
## Diagram

![Diagram](font_rom.svg "Diagram")
## Ports

| Port name | Direction | Type                                    | Description |
| --------- | --------- | --------------------------------------- | ----------- |
| clk       | in        | std_logic                               |             |
| addr      | in        | integer                                 |             |
| fontRow   | out       | std_logic_vector(FONT_WIDTH-1 downto 0) |             |
## Signals

| Name | Type     | Description |
| ---- | -------- | ----------- |
| ROM  | rom_type |             |
## Types

| Name     | Type | Description |
| -------- | ---- | ----------- |
| rom_type |      |             |
## Processes
- pixelOn: ( clk )
