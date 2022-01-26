# Entity: vfp_config 

- **File**: vfp_config.vhd
## Diagram

![Diagram](vfp_config.svg "Diagram")
## Generics

| Generic name    | Type                          | Value       | Description |
| --------------- | ----------------------------- | ----------- | ----------- |
| revision_number | std_logic_vector(31 downto 0) | x"00000000" |             |
| conf_data_width | integer                       | 32          |             |
| conf_addr_width | integer                       | 8           |             |
## Ports

| Port name     | Direction | Type                                             | Description |
| ------------- | --------- | ------------------------------------------------ | ----------- |
| wrRegsOut     | out       | mRegs                                            |             |
| rdRegsIn      | in        | mRegs                                            |             |
| S_AXI_ACLK    | in        | std_logic                                        |             |
| S_AXI_ARESETN | in        | std_logic                                        |             |
| S_AXI_AWADDR  | in        | std_logic_vector(conf_addr_width-1 downto 0)     |             |
| S_AXI_AWPROT  | in        | std_logic_vector(2 downto 0)                     |             |
| S_AXI_AWVALID | in        | std_logic                                        |             |
| S_AXI_AWREADY | out       | std_logic                                        |             |
| S_AXI_WDATA   | in        | std_logic_vector(conf_data_width-1 downto 0)     |             |
| S_AXI_WSTRB   | in        | std_logic_vector((conf_data_width/8)-1 downto 0) |             |
| S_AXI_WVALID  | in        | std_logic                                        |             |
| S_AXI_WREADY  | out       | std_logic                                        |             |
| S_AXI_BRESP   | out       | std_logic_vector(1 downto 0)                     |             |
| S_AXI_BVALID  | out       | std_logic                                        |             |
| S_AXI_BREADY  | in        | std_logic                                        |             |
| S_AXI_ARADDR  | in        | std_logic_vector(conf_addr_width-1 downto 0)     |             |
| S_AXI_ARPROT  | in        | std_logic_vector(2 downto 0)                     |             |
| S_AXI_ARVALID | in        | std_logic                                        |             |
| S_AXI_ARREADY | out       | std_logic                                        |             |
| S_AXI_RDATA   | out       | std_logic_vector(conf_data_width-1 downto 0)     |             |
| S_AXI_RRESP   | out       | std_logic_vector(1 downto 0)                     |             |
| S_AXI_RVALID  | out       | std_logic                                        |             |
| S_AXI_RREADY  | in        | std_logic                                        |             |
## Signals

| Name         | Type                                         | Description |
| ------------ | -------------------------------------------- | ----------- |
| axi_awaddr   | std_logic_vector(conf_addr_width-1 downto 0) |             |
| axi_awready  | std_logic                                    |             |
| axi_wready   | std_logic                                    |             |
| axi_bresp    | std_logic_vector(1 downto 0)                 |             |
| axi_bvalid   | std_logic                                    |             |
| axi_araddr   | std_logic_vector(conf_addr_width-1 downto 0) |             |
| axi_arready  | std_logic                                    |             |
| axi_rdata    | std_logic_vector(conf_data_width-1 downto 0) |             |
| axi_rresp    | std_logic_vector(1 downto 0)                 |             |
| axi_rvalid   | std_logic                                    |             |
| slv_reg_rden | std_logic                                    |             |
| slv_reg_wren | std_logic                                    |             |
| reg_data_out | std_logic_vector(conf_data_width-1 downto 0) |             |
| byte_index   | integer                                      |             |
| aw_en        | std_logic                                    |             |
| localRegs    | mRegs                                        |             |
## Constants

| Name              | Type    | Value                   | Description |
| ----------------- | ------- | ----------------------- | ----------- |
| ADDR_LSB          | integer | (conf_data_width/32)+ 1 |             |
| OPT_MEM_ADDR_BITS | integer | 5                       |             |
## Processes
- unnamed: ( S_AXI_ACLK )
- unnamed: ( S_AXI_ACLK )
- unnamed: ( S_AXI_ACLK )
- unnamed: ( S_AXI_ACLK )
- unnamed: ( S_AXI_ACLK )
- unnamed: ( S_AXI_ACLK )
- unnamed: ( S_AXI_ACLK )
- unnamed: ( axi_araddr, S_AXI_ARESETN, slv_reg_rden, rdRegsIn.cfigReg0, rdRegsIn.cfigReg1, rdRegsIn.cfigReg2, rdRegsIn.cfigReg3, rdRegsIn.cfigReg4, rdRegsIn.cfigReg5, rdRegsIn.cfigReg6, rdRegsIn.cfigReg7, rdRegsIn.cfigReg8, rdRegsIn.cfigReg9, rdRegsIn.cfigReg10, rdRegsIn.cfigReg11, rdRegsIn.cfigReg12, rdRegsIn.cfigReg13, rdRegsIn.cfigReg14, rdRegsIn.cfigReg15, rdRegsIn.cfigReg16, rdRegsIn.cfigReg17, rdRegsIn.cfigReg18, rdRegsIn.cfigReg19, rdRegsIn.cfigReg20, rdRegsIn.cfigReg21, rdRegsIn.cfigReg22, rdRegsIn.cfigReg23, rdRegsIn.cfigReg24, rdRegsIn.cfigReg25, rdRegsIn.cfigReg26, rdRegsIn.cfigReg27, rdRegsIn.cfigReg28, rdRegsIn.cfigReg29, rdRegsIn.cfigReg30, rdRegsIn.cfigReg31, rdRegsIn.cfigReg32, rdRegsIn.cfigReg33, rdRegsIn.cfigReg34, rdRegsIn.cfigReg35, rdRegsIn.cfigReg36, rdRegsIn.cfigReg37, rdRegsIn.cfigReg38, rdRegsIn.cfigReg39, rdRegsIn.cfigReg40, rdRegsIn.cfigReg41, rdRegsIn.cfigReg42, rdRegsIn.cfigReg43, rdRegsIn.cfigReg44, rdRegsIn.cfigReg45, rdRegsIn.cfigReg46, rdRegsIn.cfigReg47, rdRegsIn.cfigReg48, rdRegsIn.cfigReg49, rdRegsIn.cfigReg50, rdRegsIn.cfigReg51, rdRegsIn.cfigReg52, rdRegsIn.cfigReg53, rdRegsIn.cfigReg54, rdRegsIn.cfigReg55, rdRegsIn.cfigReg56, rdRegsIn.cfigReg57, rdRegsIn.cfigReg58, rdRegsIn.cfigReg59, rdRegsIn.cfigReg60, rdRegsIn.cfigReg61, rdRegsIn.cfigReg62, rdRegsIn )
- unnamed: ( S_AXI_ACLK )
- cpuOut: ( S_AXI_ACLK )
