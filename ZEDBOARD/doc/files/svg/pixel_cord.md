# Entity: pixel_cord 

- **File**: pixel_cord.vhd
## Diagram

![Diagram](pixel_cord.svg "Diagram")
## Ports

| Port name | Direction | Type      | Description |
| --------- | --------- | --------- | ----------- |
| clk       | in        | std_logic |             |
| iRgb      | in        | channel   |             |
| iPixelEn  | in        | std_logic |             |
| iEof      | in        | std_logic |             |
| iCord     | in        | cord      |             |
| oRgb      | out       | channel   |             |
## Signals

| Name      | Type           | Description |
| --------- | -------------- | ----------- |
| frameSize | intersectPoint |             |
| initCord  | intersectPoint |             |
| newCord   | intersectPoint |             |
| grid1Cord | intersectPoint |             |
| grid2Cord | intersectPoint |             |
| grid3Cord | intersectPoint |             |
| grid4Cord | intersectPoint |             |
| rgb       | channel        |             |
## Processes
- dataOutP: ( clk )
- pixelCordP: ( clk )
