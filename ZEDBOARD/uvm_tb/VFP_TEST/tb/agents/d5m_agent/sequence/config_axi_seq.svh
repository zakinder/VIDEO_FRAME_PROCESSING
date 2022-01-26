// Class: config_axi4_seq
class config_axi4_seq extends uvm_sequence #(d5m_trans);
   `uvm_object_utils(config_axi4_seq)
   
    int rgb_sharp           = reg_00_rgb_sharp;
    int edge_type           = reg_01_edge_type;
    int config_threshold    = reg_04_config_threshold;
    int video_channel       = reg_05_video_channel;
    int c_channel           = reg_07_c_channel;
    int en_ycbcr_or_rgb     = reg_06_en_ycbcr_or_rgb;
    int point_interest      = reg_31_point_interest;
    int delta_config        = reg_32_delta_config;
    int cpu_ack_go_again    = reg_33_cpu_ack_go_again;
    int cpu_wgrid_lock      = reg_34_cpu_wgrid_lock;
    int cpu_ack_off_frame   = reg_35_cpu_ack_off_frame;
    int fifo_read_address   = reg_36_fifo_read_address;
    int clear_fifo_data     = reg_37_clear_fifo_data;
    int rgb_cord_rl         = reg_50_rgb_cord_rl;
    int rgb_cord_rh         = reg_51_rgb_cord_rh;
    int rgb_cord_gl         = reg_52_rgb_cord_gl;
    int rgb_cord_gh         = reg_53_rgb_cord_gh;
    int rgb_cord_bl         = reg_54_rgb_cord_bl;
    int rgb_cord_bh         = reg_55_rgb_cord_bh;
    int lum_th              = reg_56_lum_th;
    int hsv_per_ch          = reg_57_hsv_per_ch;
    int ycc_per_ch          = reg_58_ycc_per_ch;
    
    // Function: new
   function new(string name="config_axi4_seq");
       super.new(name);
   endfunction: new

    // Method:  body
   virtual    task body();
       d5m_trans item;
       axi_write_channel(oRgbOsharp,rgb_sharp);
       axi_write_channel(oEdgeType,edge_type);
       axi_write_channel(threshold,config_threshold);
       axi_write_channel(videoChannel,video_channel);
       axi_write_channel(cChannel,c_channel);
       axi_write_channel(dChannel,reg_06_en_ycbcr_or_rgb);
       axi_write_channel(pReg_pointInterest,point_interest);
       axi_write_channel(pReg_deltaConfig,delta_config);
       axi_write_channel(pReg_cpuAckGoAgain,cpu_ack_go_again);
       axi_write_channel(pReg_cpuWgridLock,cpu_wgrid_lock);
       axi_write_channel(pReg_cpuAckoffFrame,cpu_ack_off_frame);
       axi_write_channel(pReg_fifoReadAddress,fifo_read_address);
       axi_write_channel(pReg_clearFifoData,clear_fifo_data);
       axi_write_channel(rgbCoord_rl,rgb_cord_rl);
       axi_write_channel(rgbCoord_rh,rgb_cord_rh);
       axi_write_channel(rgbCoord_gl,rgb_cord_gl);
       axi_write_channel(rgbCoord_gh,rgb_cord_gh);
       axi_write_channel(rgbCoord_bl,rgb_cord_bl);
       axi_write_channel(rgbCoord_bh,rgb_cord_bh);
       axi_write_channel(oLumTh,lum_th);
       axi_write_channel(oHsvPerCh,hsv_per_ch);
       axi_write_channel(oYccPerCh,ycc_per_ch);

   endtask: body

    // Method:  axi_write_channel
    virtual task axi_write_channel (bit[7:0] addr,bit[31:0] data);
        d5m_trans item;
        `uvm_create(item)
        item.axi4_lite.addr           = addr;
        item.axi4_lite.data           = data;
        item.d5m_txn                  = AXI4_WRITE;
        `uvm_send(item);
        axi_read_back_channel(addr);
    endtask: axi_write_channel
    
    // Method:  axi_read_back_channel
    virtual task axi_read_back_channel(bit[7:0] addr);
        d5m_trans item;
        `uvm_create(item)
        item.axi4_lite.addr           = addr;
        item.d5m_txn                  = AXI4_READ;
        `uvm_send(item);
   endtask: axi_read_back_channel
   
endclass: config_axi4_seq