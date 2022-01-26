// Class: img_file_seq
class img_file_seq extends img_base_seq;
    `uvm_object_utils(img_file_seq)
    // Function: new
    function new(string name="img_file_seq");
        super.new(name);
    endfunction
    // Method:  body
    virtual    task body();
        d5m_trans item;
        int number_frames;
        int lval_lines;
        int lval_offset;
        int image_width;
        bit [31:0] fifo_read_enable      = 32'h10000;//180
        bit [7:0] pReg_fifoReadAddress   = 8'h90;//116 // pReg_fifoReadEnable --fifo read enable
        bit [31:0] max_fifo_read_address = 32'h400f;//180
        bit [7:0] aBusSelect             = 8'h0C;//12 
        bit enable_pattern  = 1'b0;
        typedef enum { pattern, random } type_idata;
        type_idata  data_type;
        //----------------------------------------------------
        `uvm_create(item)
        item.d5p.rgb            = 0;
        item.d5p.lvalid         = 1'b0;
        item.d5p.fvalid         = 1'b0;
        item.d5p.iImageTypeTest = 1'b0;
        item.d5m_txn            = D5M_WRITE;
        `uvm_send(item);
        //----------------------------------------------------
        axi_write_config_reg();
        d5m_read();
    endtask: body
    // -------------------------------------------------------
    virtual protected task axi_write_config_reg ();
        bit [7:0] initAddr               = 8'h00;//0   [15]  
        bit [7:0] oRgbOsharp             = 8'h00;//0   [15]         
        bit [7:0] oEdgeType              = 8'h04;//4   [15]        
        bit [7:0] aBusSelect             = 8'h0C;//12  [15]           
        bit [7:0] threshold              = 8'h10;//16  [15]          
        bit [7:0] videoChannel           = 8'h14;//20  [15]         
        bit [7:0] dChannel               = 8'h18;//24  [15]        
        bit [7:0] cChannel               = 8'h1C;//28  [15]          
        bit [7:0] kls_k1                 = 8'h20;//32  [15]
        bit [7:0] kls_k2                 = 8'h24;//36  [15]
        bit [7:0] kls_k3                 = 8'h28;//40  [15]
        bit [7:0] kls_k4                 = 8'h2C;//44  [15]
        bit [7:0] kls_k5                 = 8'h30;//48  [15]
        bit [7:0] kls_k6                 = 8'h34;//52  [15]
        bit [7:0] kls_k7                 = 8'h38;//56  [15]
        bit [7:0] kls_k8                 = 8'h3C;//60  [15]
        bit [7:0] kls_k9                 = 8'h40;//64  [15]
        bit [7:0] kls_config             = 8'h44;//68  [15]
        bit [7:0] kCoefDisabIndex        = 8'h00;//84  [15]
        bit [7:0] kCoefYcbcrIndex        = 8'h01;//84  [15]
        bit [7:0] kCoefCgainIndex        = 8'h02;//84  [15]
        bit [7:0] kCoefSharpIndex        = 8'h03;//84  [15]
        bit [7:0] kCoefBlureIndex        = 8'h04;//84  [15]
        bit [7:0] kCoefSobeXIndex        = 8'h05;//84  [15]
        bit [7:0] kCoefSobeYIndex        = 8'h06;//84  [15]
        bit [7:0] kCoefEmbosIndex        = 8'h07;//84  [19]
        bit [7:0] kCoefCgai1Index        = 8'h08;//84  [20]
        bit [7:0] als_k1                 = 8'h54;//84  [21]
        bit [7:0] als_k2                 = 8'h58;//88  [22]
        bit [7:0] als_k3                 = 8'h5C;//92  [23]
        bit [7:0] als_k4                 = 8'h60;//96  [24]
        bit [7:0] als_k5                 = 8'h64;//100 [25]
        bit [7:0] als_k6                 = 8'h68;//104 [26]
        bit [7:0] als_k7                 = 8'h6C;//108 [27]
        bit [7:0] als_k8                 = 8'h70;//112 [28]
        bit [7:0] als_k9                 = 8'h74;//116 [29]
        bit [7:0] als_config             = 8'h78;//120 [30]
        bit [7:0] pReg_pointInterest     = 8'h7C;//124 [31]
        bit [7:0] pReg_deltaConfig       = 8'h80;//128 [32]
        bit [7:0] pReg_cpuAckGoAgain     = 8'h84;//132 [33]
        bit [7:0] pReg_cpuWgridLock      = 8'h88;//136 [34]
        bit [7:0] pReg_cpuAckoffFrame    = 8'h8C;//140 [35]
        bit [7:0] pReg_fifoReadAddress   = 8'h90;//144 [36] // pReg_fifoReadEnable --fifo read enable
        bit [7:0] pReg_clearFifoData     = 8'h94;//148 [37]
        bit [7:0] rgbCoord_rl            = 8'hC8;//84  [50]
        bit [7:0] rgbCoord_rh            = 8'hCC;//88  [51]
        bit [7:0] rgbCoord_gl            = 8'hD0;//156 [52]
        bit [7:0] rgbCoord_gh            = 8'hD4;//160 [53]
        bit [7:0] rgbCoord_bl            = 8'hD8;//164 [54]
        bit [7:0] rgbCoord_bh            = 8'hDC;//220 [55]
        bit [7:0] oLumTh                 = 8'hE0;//224 [56]
        bit [7:0] oHsvPerCh              = 8'hE4;//228 [57]
        bit [7:0] oYccPerCh              = 8'hE8;//232 [58]
        bit [31:0] select_ycbcr          = 32'h0;//180
        bit [31:0] select_rgb_not_ycbcr  = 32'h1;//180
        bit [31:0] select_rgb            = 32'h5;//180
        bit [31:0] select_cgain          = 32'h0;//180
        bit [31:0] select_sharp          = 32'h1;//180
        bit [31:0] select_hsv            = 32'h4;//180
        bit [31:0] select_hsl            = 32'h3;//180
        bit [31:0] select_sobel          = 32'h6;//180
        bit [31:0] select_emboss         = 32'h7;//180
        bit [31:0] select_rgbCorrect     = 32'h2d;//180
        bit [31:0] select_rgbRemix       = 32'h2e;//180
        bit [31:0] select_rgbDetect      = 32'h2f;//180
        bit [31:0] select_rgbPoi         = 32'h30;//180
        bit [31:0] max_num_video_select  = 32'h32;//180
        axi_write_channel(oRgbOsharp,reg_00_rgb_sharp);
        axi_write_channel(oEdgeType,reg_01_edge_type);
        axi_write_channel(threshold,reg_04_config_threshold);
        axi_write_channel(videoChannel,reg_05_video_channel);
        axi_write_channel(cChannel,reg_07_c_channel);
        axi_write_channel(dChannel,reg_06_en_ycbcr_or_rgb);
        axi_write_channel(pReg_pointInterest,10);
        axi_write_channel(pReg_deltaConfig,5);
        axi_write_channel(pReg_cpuAckGoAgain,1);
        axi_write_channel(pReg_cpuWgridLock,1);
        axi_write_channel(pReg_cpuAckoffFrame,6);
        axi_write_channel(pReg_fifoReadAddress,6);
        axi_write_channel(pReg_clearFifoData,5);
        axi_write_channel(rgbCoord_rl,0);
        axi_write_channel(rgbCoord_rh,255);
        axi_write_channel(rgbCoord_gl,0);
        axi_write_channel(rgbCoord_gh,255);
        axi_write_channel(rgbCoord_bl,0);
        axi_write_channel(rgbCoord_bh,255);
        axi_write_channel(oLumTh,36);
        axi_write_channel(oHsvPerCh,0);
        axi_write_channel(oYccPerCh,0);
    endtask: axi_write_config_reg
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_trans item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn        = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_channel
    virtual protected task d5m_read ();
            d5m_trans item;
            `uvm_create(item)
            item.d5p.iImageTypeTest = 1'b0;
            item.d5m_txn        = IMAGE_READ;
            `uvm_send(item);
    endtask: d5m_read
endclass: img_file_seq