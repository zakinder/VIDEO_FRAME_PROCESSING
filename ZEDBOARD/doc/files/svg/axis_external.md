# Entity: axis_external 

- **File**: axis_external.vhd
## Diagram

![Diagram](axis_external.svg "Diagram")
## Generics

| Generic name              | Type                          | Value       | Description |
| ------------------------- | ----------------------------- | ----------- | ----------- |
| revision_number           | std_logic_vector(31 downto 0) | x"05022019" |             |
| C_rgb_m_axis_TDATA_WIDTH  | integer                       | 16          |             |
| C_rgb_s_axis_TDATA_WIDTH  | integer                       | 16          |             |
| C_m_axis_mm2s_TDATA_WIDTH | integer                       | 16          |             |
| C_vfpConfig_DATA_WIDTH    | integer                       | 32          |             |
| C_vfpConfig_ADDR_WIDTH    | integer                       | 8           |             |
| conf_data_width           | integer                       | 32          |             |
| conf_addr_width           | integer                       | 8           |             |
| i_data_width              | integer                       | 8           |             |
| s_data_width              | integer                       | 16          |             |
| b_data_width              | integer                       | 32          |             |
## Ports

| Port name           | Direction | Type                                                    | Description |
| ------------------- | --------- | ------------------------------------------------------- | ----------- |
| iMmAxi              | in        | integer                                                 |             |
| iStreamData         | in        | vStreamData                                             |             |
| oWrRegs             | out       | mRegs                                                   |             |
| iRdRegs             | in        | mRegs                                                   |             |
| rgb_m_axis_aclk     | in        | std_logic                                               |             |
| rgb_m_axis_aresetn  | in        | std_logic                                               |             |
| rgb_m_axis_tready   | in        | std_logic                                               |             |
| rgb_m_axis_tvalid   | out       | std_logic                                               |             |
| rgb_m_axis_tlast    | out       | std_logic                                               |             |
| rgb_m_axis_tuser    | out       | std_logic                                               |             |
| rgb_m_axis_tdata    | out       | std_logic_vector(C_rgb_m_axis_TDATA_WIDTH-1 downto 0)   |             |
| rgb_s_axis_aclk     | in        | std_logic                                               |             |
| rgb_s_axis_aresetn  | in        | std_logic                                               |             |
| rgb_s_axis_tready   | out       | std_logic                                               |             |
| rgb_s_axis_tvalid   | in        | std_logic                                               |             |
| rgb_s_axis_tuser    | in        | std_logic                                               |             |
| rgb_s_axis_tlast    | in        | std_logic                                               |             |
| rgb_s_axis_tdata    | in        | std_logic_vector(C_rgb_s_axis_TDATA_WIDTH-1 downto 0)   |             |
| m_axis_mm2s_aclk    | in        | std_logic                                               |             |
| m_axis_mm2s_aresetn | in        | std_logic                                               |             |
| m_axis_mm2s_tready  | in        | std_logic                                               |             |
| m_axis_mm2s_tvalid  | out       | std_logic                                               |             |
| m_axis_mm2s_tuser   | out       | std_logic                                               |             |
| m_axis_mm2s_tlast   | out       | std_logic                                               |             |
| m_axis_mm2s_tdata   | out       | std_logic_vector(C_m_axis_mm2s_TDATA_WIDTH-1 downto 0)  |             |
| m_axis_mm2s_tkeep   | out       | std_logic_vector(2 downto 0)                            |             |
| m_axis_mm2s_tstrb   | out       | std_logic_vector(2 downto 0)                            |             |
| m_axis_mm2s_tid     | out       | std_logic_vector(0 downto 0)                            |             |
| m_axis_mm2s_tdest   | out       | std_logic_vector(0 downto 0)                            |             |
| vfpconfig_aclk      | in        | std_logic                                               |             |
| vfpconfig_aresetn   | in        | std_logic                                               |             |
| vfpconfig_awaddr    | in        | std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0)     |             |
| vfpconfig_awprot    | in        | std_logic_vector(2 downto 0)                            |             |
| vfpconfig_awvalid   | in        | std_logic                                               |             |
| vfpconfig_awready   | out       | std_logic                                               |             |
| vfpconfig_wdata     | in        | std_logic_vector(C_vfpConfig_DATA_WIDTH-1 downto 0)     |             |
| vfpconfig_wstrb     | in        | std_logic_vector((C_vfpConfig_DATA_WIDTH/8)-1 downto 0) |             |
| vfpconfig_wvalid    | in        | std_logic                                               |             |
| vfpconfig_wready    | out       | std_logic                                               |             |
| vfpconfig_bresp     | out       | std_logic_vector(1 downto 0)                            |             |
| vfpconfig_bvalid    | out       | std_logic                                               |             |
| vfpconfig_bready    | in        | std_logic                                               |             |
| vfpconfig_araddr    | in        | std_logic_vector(C_vfpConfig_ADDR_WIDTH-1 downto 0)     |             |
| vfpconfig_arprot    | in        | std_logic_vector(2 downto 0)                            |             |
| vfpconfig_arvalid   | in        | std_logic                                               |             |
| vfpconfig_arready   | out       | std_logic                                               |             |
| vfpconfig_rdata     | out       | std_logic_vector(C_vfpConfig_DATA_WIDTH-1 downto 0)     |             |
| vfpconfig_rresp     | out       | std_logic_vector(1 downto 0)                            |             |
| vfpconfig_rvalid    | out       | std_logic                                               |             |
| vfpconfig_rready    | in        | std_logic                                               |             |
## Signals

| Name           | Type                                      | Description |
| -------------- | ----------------------------------------- | ----------- |
| rx_axis_tready | std_logic                                 |             |
| rx_axis_tvalid | std_logic                                 |             |
| rx_axis_tuser  | std_logic                                 |             |
| rx_axis_tlast  | std_logic                                 |             |
| rx_axis_tdata  | std_logic_vector(m_axis_mm2s_tdata'range) |             |
## Instantiations

- mAxisInst: vfp_s_axis
- mm2sInst: vfp_m_axis
- vfpConfigInst: vfp_config
