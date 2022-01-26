# Entity: rgb_histogram 

- **File**: rgb_histogram.vhd
## Diagram

![Diagram](rgb_histogram.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| img_width    | integer | 1920  |             |
| img_height   | integer | 8     |             |
## Ports

| Port name | Direction | Type      | Description |
| --------- | --------- | --------- | ----------- |
| clk       | in        | std_logic |             |
| reset     | in        | std_logic |             |
| txCord    | in        | coord     |             |
| iRgb      | in        | channel   |             |
| oRgb      | out       | channel   |             |
## Signals

| Name            | Type                         | Description |
| --------------- | ---------------------------- | ----------- |
| red_rowbuffer   | ram_type                     |             |
| gre_rowbuffer   | ram_type                     |             |
| blu_rowbuffer   | ram_type                     |             |
| red_io1data     | natural                      |             |
| gre_io1data     | natural                      |             |
| blu_io1data     | natural                      |             |
| red_io3data     | std_logic_vector(7 downto 0) |             |
| gre_io3data     | std_logic_vector(7 downto 0) |             |
| blu_io3data     | std_logic_vector(7 downto 0) |             |
| red_rowdist     | natural                      |             |
| red_rowdistNv   | natural                      |             |
| red_rowdistNext | natural                      |             |
| red_lines       | pix_line_array(0 to 10)      |             |
| gre_rowdist     | natural                      |             |
| gre_rowdistNv   | natural                      |             |
| gre_rowdistNext | natural                      |             |
| gre_lines       | pix_line_array(0 to 10)      |             |
| blu_rowdist     | natural                      |             |
| blu_rowdistNv   | natural                      |             |
| blu_rowdistNext | natural                      |             |
| blu_lines       | pix_line_array(0 to 10)      |             |
| cordinates      | cord                         |             |
| cord_xy         | cord                         |             |
| frame_done      | std_logic                    |             |
| frame_valid     | std_logic                    |             |
| valid_on        | std_logic                    |             |
| cord_xy_x       | natural                      |             |
| pWrAdr          | natural                      |             |
## Types

| Name     | Type | Description |
| -------- | ---- | ----------- |
| ram_type |      |             |
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
