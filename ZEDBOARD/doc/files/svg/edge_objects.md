# Entity: edge_objects 

- **File**: edge_objects.vhd
## Diagram

![Diagram](edge_objects.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| i_data_width | integer | 8     |             |
## Ports

| Port name | Direction | Type      | Description |
| --------- | --------- | --------- | ----------- |
| clk       | in        | std_logic |             |
| rst_l     | in        | std_logic |             |
| iRgb      | in        | channel   |             |
| oRgbRemix | out       | channel   |             |
## Signals

| Name         | Type                                      | Description |
| ------------ | ----------------------------------------- | ----------- |
| rMax         | std_logic_vector(i_data_width-1 downto 0) |             |
| rMin         | std_logic_vector(i_data_width-1 downto 0) |             |
| gMax         | std_logic_vector(i_data_width-1 downto 0) |             |
| gMin         | std_logic_vector(i_data_width-1 downto 0) |             |
| bMax         | std_logic_vector(i_data_width-1 downto 0) |             |
| bMin         | std_logic_vector(i_data_width-1 downto 0) |             |
| dGrid        | std_logic                                 |             |
| rgb1Int      | intChannel                                |             |
| rgb2Int      | intChannel                                |             |
| rgb3Int      | intChannel                                |             |
| rgb4Int      | intChannel                                |             |
| rgb1b        | channel                                   |             |
| rgb2b        | channel                                   |             |
| rgb3b        | channel                                   |             |
| rgb4b        | channel                                   |             |
| rgbMax       | integer                                   |             |
| rgbMin       | integer                                   |             |
| rgbDelta     | integer                                   |             |
| minValue     | integer                                   |             |
| maxValue     | integer                                   |             |
| rgbRInt      | integer                                   |             |
| rgbSyncValid | std_logic_vector(3 downto 0)              |             |
## Processes
- unnamed: ( clk )
- piplRgbBlurXP: ( clk )
- rgbMaxP: ( clk )
- rgbMinP: ( clk )
- rgbDeltaP: ( clk )
- rgbP: ( clk )
- ipRgbMaxUfD1P: ( clk )
- unnamed: ( clk )
