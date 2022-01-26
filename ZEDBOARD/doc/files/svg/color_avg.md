# Entity: color_avg 

- **File**: color_avg.vhd
## Diagram

![Diagram](color_avg.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| i_data_width | integer | 8     |             |
## Ports

| Port name | Direction | Type      | Description |
| --------- | --------- | --------- | ----------- |
| clk       | in        | std_logic |             |
| reset     | in        | std_logic |             |
| iRgb      | in        | channel   |             |
| oRgb      | out       | channel   |             |
## Signals

| Name             | Type                          | Description |
| ---------------- | ----------------------------- | ----------- |
| int1Rgb          | intChannel                    |             |
| int2Rgb          | intChannel                    |             |
| int3Rgb          | intChannel                    |             |
| int4Rgb          | intChannel                    |             |
| int5Rgb          | intChannel                    |             |
| int6Rgb          | intChannel                    |             |
| intRg6b          | intChannel                    |             |
| color_limit      | std_logic                     |             |
| rgbSyncValid     | std_logic_vector(11 downto 0) |             |
| rgbRed12Max      | integer                       |             |
| rgbGre12Max      | integer                       |             |
| rgbBlu12Max      | integer                       |             |
| rgbRed12Min      | integer                       |             |
| rgbGre12Min      | integer                       |             |
| rgbBlu12Min      | integer                       |             |
| rgbRed13Max      | integer                       |             |
| rgbGre13Max      | integer                       |             |
| rgbBlu13Max      | integer                       |             |
| rgbRed13Min      | integer                       |             |
| rgbGre13Min      | integer                       |             |
| rgbBlu13Min      | integer                       |             |
| rgbRedM12Sum     | integer                       |             |
| rgbGreM12Sum     | integer                       |             |
| rgbBluM12Sum     | integer                       |             |
| rgbRedM12Limit   | integer                       |             |
| rgbGreM12Limit   | integer                       |             |
| rgbBluM12Limit   | integer                       |             |
| rgbRedM13Limit   | integer                       |             |
| rgbGreM13Limit   | integer                       |             |
| rgbBluM13Limit   | integer                       |             |
| rgbLimit         | channel                       |             |
| rgbAvg           | channel_9bi                   |             |
| uFs1Rgb          | rgbToUfRecord                 |             |
| uFs2Rgb          | rgbToUfRecord                 |             |
| uFs3Rgb          | rgbToUfRecord                 |             |
| uFs4Rgb          | rgbToUfRecord                 |             |
| uFs5Rgb          | rgbToUfRecord                 |             |
| rgbRedAvg        | ufixed(7 downto 0)            |             |
| rgbSumRedAvg     | ufixed(9 downto -10)          |             |
| rgbSumRed        | ufixed(9 downto 0)            |             |
| rgbGreAvg        | ufixed(7 downto 0)            |             |
| rgbSumGreAvg     | ufixed(9 downto -10)          |             |
| rgbSumGre        | ufixed(9 downto 0)            |             |
| rgbBluAvg        | ufixed(7 downto 0)            |             |
| rgbSumBluAvg     | ufixed(9 downto -10)          |             |
| rgbSumBlu        | ufixed(9 downto 0)            |             |
| rgb1sRedM13Limit | integer                       |             |
| rgb2sRedM13Limit | integer                       |             |
## Processes
- unnamed: ( clk,reset )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk,reset )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
- unnamed: ( clk )
