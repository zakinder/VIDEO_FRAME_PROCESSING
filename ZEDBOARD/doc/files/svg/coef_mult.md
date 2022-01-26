# Entity: coef_mult 

- **File**: coef_mult.vhd
## Diagram

![Diagram](coef_mult.svg "Diagram")
## Ports

| Port name  | Direction | Type           | Description |
| ---------- | --------- | -------------- | ----------- |
| clk        | in        | std_logic      |             |
| rst_l      | in        | std_logic      |             |
| iKcoeff    | in        | kernelCoeff    |             |
| iFilterId  | in        | integer        |             |
| oKcoeff    | out       | kernelCoeff    |             |
| oCoeffProd | out       | kCoefFiltFloat |             |
## Signals

| Name         | Type                          | Description |
| ------------ | ----------------------------- | ----------- |
| kCoefStates  | kCoefSt                       |             |
| kCoefVals    | kCoefFilters                  |             |
| userCoefVals | kCoefFilters                  |             |
| kCoeffDWord  | kernelCoeDWord                |             |
| kCofFrtProd  | kernelCoeDWord                |             |
| upCtr        | integer                       |             |
| kCoeffValid  | std_logic                     |             |
| fractLevel   | std_logic_vector(31 downto 0) |             |
| kCof         | kernelCoeff                   |             |
## Constants

| Name          | Type                          | Value       | Description |
| ------------- | ----------------------------- | ----------- | ----------- |
| fractValue    | std_logic_vector(31 downto 0) | x"3a83126f" |             |
| rgbLevelValue | std_logic_vector(31 downto 0) | x"43800000" |             |
| FloatMaxLat   | integer                       | 20          |             |
## Types

| Name    | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Description |
| ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| kCoefSt | (kCoefSetState,<br><span style="padding-left:20px">kCoefYcbcrState,<br><span style="padding-left:20px">kCoefCgainState,<br><span style="padding-left:20px">kCoefSharpState,<br><span style="padding-left:20px">kCoefBlureState,<br><span style="padding-left:20px">kCoefXSobeState,<br><span style="padding-left:20px">kCoefYSobeState,<br><span style="padding-left:20px">kCoefEmbosState,<br><span style="padding-left:20px">kCoefUpdaterState,<br><span style="padding-left:20px">kCoefIdleState) |             |
## Processes
- NewUserCoeffValuesP: ( clk )
- FloatMaxLatP: ( clk )
- kCoefStP: ( clk )
## Instantiations

- FloatMultiplyTopFractLevelInst: FloatMultiplyTop
- WordToFloatTopK1inst: WordToFloatTop
- WordToFloatTopK2inst: WordToFloatTop
- WordToFloatTopK3inst: WordToFloatTop
- WordToFloatTopK4inst: WordToFloatTop
- WordToFloatTopK5inst: WordToFloatTop
- WordToFloatTopK6inst: WordToFloatTop
- WordToFloatTopK7inst: WordToFloatTop
- WordToFloatTopK8inst: WordToFloatTop
- WordToFloatTopK9inst: WordToFloatTop
- FloatMultiplyTopK1Inst: FloatMultiplyTop
- FloatMultiplyTopK2Inst: FloatMultiplyTop
- FloatMultiplyTopK3Inst: FloatMultiplyTop
- FloatMultiplyTopK4Inst: FloatMultiplyTop
- FloatMultiplyTopK5Inst: FloatMultiplyTop
- FloatMultiplyTopK6Inst: FloatMultiplyTop
- FloatMultiplyTopK7Inst: FloatMultiplyTop
- FloatMultiplyTopK8Inst: FloatMultiplyTop
- FloatMultiplyTopK9Inst: FloatMultiplyTop
## State machines

![Diagram_state_machine_0]( stm_coef_mult_00.svg "Diagram")