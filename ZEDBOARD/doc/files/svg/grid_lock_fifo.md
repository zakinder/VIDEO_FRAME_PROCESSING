# Entity: grid_lock_fifo 

- **File**: grid_lock_fifo.vhd
## Diagram

![Diagram](grid_lock_fifo.svg "Diagram")
## Generics

| Generic name    | Type    | Value | Description |
| --------------- | ------- | ----- | ----------- |
| FIFO_DEPTH      | integer | 24    |             |
| FIFO_DATA_WIDTH | integer | 24    |             |
| FIFO_ADDR_WIDTH | integer | 14    |             |
## Ports

| Port name | Direction | Type                                          | Description |
| --------- | --------- | --------------------------------------------- | ----------- |
| clk       | in        | std_logic                                     |             |
| clrStatus | in        | std_logic                                     |             |
| rdEn      | in        | std_logic                                     |             |
| rdAddress | in        | std_logic_vector (FIFO_ADDR_WIDTH-1 downto 0) |             |
| dataO     | out       | std_logic_vector (FIFO_DATA_WIDTH-1 downto 0) |             |
| wrEn      | in        | std_logic                                     |             |
| wrAddress | in        | std_logic_vector (FIFO_ADDR_WIDTH-1 downto 0) |             |
| dataIn    | in        | std_logic_vector (FIFO_DATA_WIDTH-1 downto 0) |             |
| wrDone    | out       | std_logic                                     |             |
| rdDone    | out       | std_logic                                     |             |
| emptyO    | out       | std_logic                                     |             |
| fullO     | out       | std_logic                                     |             |
## Signals

| Name         | Type                    | Description |
| ------------ | ----------------------- | ----------- |
| Mem          | RAM (0 to FIFO_DEPTH-1) |             |
| eqlLocations | std_logic               |             |
| wrDoneStatus | std_logic               |             |
| rdDoneStatus | std_logic               |             |
| preStatus    | std_logic               |             |
| preFull      | std_logic               |             |
| preEmpty     | std_logic               |             |
| emptyHi      | std_logic               |             |
| fullHi       | std_logic               |             |
| fifoWrAddrs  | integer                 |             |
| fifoRdAddrs  | integer                 |             |
## Types

| Name | Type                                                                     | Description |
| ---- | ------------------------------------------------------------------------ | ----------- |
| RAM  | array (integer range <>)of std_logic_vector (FIFO_DATA_WIDTH-1 downto 0) |             |
## Processes
- readPort: ( clk )
- writePort: ( clk )
- rdPointerStatus: ( wrAddress, rdAddress )
- wrPointerStatus: ( wrAddress, rdAddress )
- fifoPreStatus: ( wrDoneStatus, rdDoneStatus, clrStatus )
- fifoFullStatus: ( clk, preFull )
- fifoEmptyStatus: ( clk, preEmpty )
