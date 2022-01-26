# Entity: rgb_kernal_prod 

- **File**: rgb_kernal_prod.vhd
## Diagram

![Diagram](rgb_kernal_prod.svg "Diagram")
## Ports

| Port name | Direction | Type               | Description |
| --------- | --------- | ------------------ | ----------- |
| clk       | in        | std_logic          |             |
| rst_l     | in        | std_logic          |             |
| iRgb      | in        | channel            |             |
| iCoeff    | in        | kernelCoeDWord     |             |
| iTaps     | in        | TapsRecord         |             |
| oRgbFloat | out       | rgbFloat           |             |
| oRgbSnFix | out       | rgbToSnSumTrRecord |             |
## Signals

| Name           | Type           | Description |
| -------------- | -------------- | ----------- |
| FractLevelProd | kernelCoeDWord |             |
| kCoeffProd     | kCoeffFloat    |             |
## Instantiations

- ByteToFloatTopRedinst: ByteToFloatTop
- ByteToFloatTopGreeninst: ByteToFloatTop
- ByteToFloatTopBlueinst: ByteToFloatTop
- FloatMultiplyK1Inst: FloatMultiplyTop
- FloatMultiplyK2Inst: FloatMultiplyTop
- FloatMultiplyK3Inst: FloatMultiplyTop
- FloatMultiplyK4Inst: FloatMultiplyTop
- FloatMultiplyK5Inst: FloatMultiplyTop
- FloatMultiplyK6Inst: FloatMultiplyTop
- FloatMultiplyK7Inst: FloatMultiplyTop
- FloatMultiplyK8Inst: FloatMultiplyTop
- FloatMultiplyK9Inst: FloatMultiplyTop
- FloatToFixedv1TopK1Inst: FloatToFixedv1Top
- FloatToFixedv1TopK2Inst: FloatToFixedv1Top
- FloatToFixedv1TopK3Inst: FloatToFixedv1Top
- FloatToFixedv1TopK4Inst: FloatToFixedv1Top
- FloatToFixedv1TopK5Inst: FloatToFixedv1Top
- FloatToFixedv1TopK6Inst: FloatToFixedv1Top
- FloatToFixedv1TopK7Inst: FloatToFixedv1Top
- FloatToFixedv1TopK8Inst: FloatToFixedv1Top
- FloatToFixedv1TopK9Inst: FloatToFixedv1Top
- sign_fixed_resize_inst: sign_fixed_resize
