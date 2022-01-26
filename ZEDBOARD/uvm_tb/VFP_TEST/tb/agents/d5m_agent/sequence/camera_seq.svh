// Class: camera_seq
class camera_seq extends img_base_seq;
    `uvm_object_utils(camera_seq)
    
    // Function: new
    function new(string name="camera_seq");
        super.new(name);
    endfunction: new
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
        bit enable_pattern               = 1'b0;
        
        typedef enum { pattern, random } type_idata;
        type_idata  data_type;

        `uvm_create(item)
        item.d5p.rgb                    = 0;
        item.d5p.lvalid                 = 1'b0;
        item.d5p.fvalid                 = 1'b0;
        item.d5p.iImageTypeTest         = 1'b0;
        item.d5m_txn                    = D5M_WRITE;
        `uvm_send(item);

        axi_write_config_reg();
        d5m_read();

        //d5m_write_pre_set_ifval();
        //number_frames  = item.cof.number_frames;
        //lval_lines     = item.cof.lval_lines;
        //lval_offset    = item.cof.lval_offset;
        //image_width    = item.image_width;
        //axi_write_channel(aBusSelect,0);
        //d5m_write_create_frames(number_frames,lval_lines,lval_offset,image_width,enable_pattern);
        //axi_write_channel(aBusSelect,1);
        //enable_pattern  = 1'b1;
        //d5m_write_create_frames(number_frames,lval_lines,lval_offset,image_width,enable_pattern);
        //axi_write_channel(aBusSelect,2);
        //d5m_write_create_frames(number_frames,lval_lines,lval_offset,image_width,enable_pattern);
        //axi_write_channel(aBusSelect,3);
        //d5m_write_create_frames(number_frames,lval_lines,lval_offset,image_width,enable_pattern);
        //axi_write_channel(pReg_fifoReadAddress,fifo_read_enable);
        //axi_multi_writes_to_address(pReg_fifoReadAddress,max_fifo_read_address);
        //----------------------------------------------------
    endtask: body
    // Method:  axi_write_config_reg
    virtual protected task axi_write_config_reg ();
    
        axi_write_channel(initAddr,initAddr);
        
        //axi_write_channel_test();
        //axi_read_channel_test();
        //axi_multi_writes_to_address(videoChannel,max_num_video_select);
        
        axi_write_channel(kls_k1,kCoeffCgain_k1);
        axi_write_channel(kls_k2,kCoeffCgain_k2);
        axi_write_channel(kls_k3,kCoeffCgain_k3);
        axi_write_channel(kls_k4,kCoeffCgain_k4);
        axi_write_channel(kls_k5,kCoeffCgain_k5);
        axi_write_channel(kls_k6,kCoeffCgain_k6);
        axi_write_channel(kls_k7,kCoeffCgain_k7);
        axi_write_channel(kls_k8,kCoeffCgain_k8);
        axi_write_channel(kls_k9,kCoeffCgain_k9);
        axi_write_channel(kls_config,kCoeffCgain_kSet);

        
        axi_write_channel(filter_id,kCoeffCgain_kSet);
        axi_read_back_channel(kls_k1);
        axi_read_back_channel(kls_k2);
        axi_read_back_channel(kls_k3);
        axi_read_back_channel(kls_k4);
        axi_read_back_channel(kls_k5);
        axi_read_back_channel(kls_k6);
        axi_read_back_channel(kls_k7);
        axi_read_back_channel(kls_k8);
        axi_read_back_channel(kls_k9);
        axi_read_back_channel(kls_config);
        
        
        
        axi_write_channel(oRgbOsharp,reg_00_rgb_sharp);
        axi_write_channel(oEdgeType,reg_01_edge_type);
        axi_write_channel(threshold,reg_04_config_threshold);
        axi_write_channel(videoChannel,reg_05_video_channel);
        axi_write_channel(cChannel,reg_07_c_channel);
        axi_write_channel(dChannel,reg_06_en_ycbcr_or_rgb);

        //axi_write_channel(kls_config,kCoefDisabIndex);
        //axi_write_channel(kls_config,kCoefYcbcrIndex);
        //axi_write_channel(kls_config,kCoefCgainIndex);
        //axi_write_channel(kls_config,kCoefSharpIndex);
        //axi_write_channel(kls_config,kCoefBlureIndex);
        //axi_write_channel(kls_config,kCoefSobeXIndex);
        //axi_write_channel(kls_config,kCoefSobeYIndex);
        //axi_write_channel(kls_config,kCoefEmbosIndex);
        //axi_write_channel(kls_config,kCoefCgai1Index);
        //axi_write_channel(als_k1,6);
        //axi_write_channel(als_k2,5);
        //axi_write_channel(als_k3,6);
        //axi_write_channel(als_k4,5);
        //axi_write_channel(als_k5,6);
        //axi_write_channel(als_k6,6);
        //axi_write_channel(als_k7,5);
        //axi_write_channel(als_k8,6);
        //axi_write_channel(als_k9,5);
        //axi_write_channel(als_config,kCoefDisabIndex);
        //axi_write_channel(als_config,kCoefYcbcrIndex);
        //axi_write_channel(als_config,kCoefCgainIndex);
        //axi_write_channel(als_config,kCoefSharpIndex);
        //axi_write_channel(als_config,kCoefBlureIndex);
        //axi_write_channel(als_config,kCoefSobeXIndex);
        //axi_write_channel(als_config,kCoefSobeYIndex);
        //axi_write_channel(als_config,kCoefEmbosIndex);
        //axi_write_channel(als_config,kCoefCgai1Index);

        axi_write_channel(pReg_deltaConfig,reg_32_delta_config);
        axi_write_channel(pReg_cpuAckGoAgain,reg_33_cpu_ack_go_again);
        axi_write_channel(pReg_cpuWgridLock,reg_34_cpu_wgrid_lock);
        axi_write_channel(pReg_cpuAckoffFrame,reg_35_cpu_ack_off_frame);
        axi_write_channel(pReg_fifoReadAddress,reg_36_fifo_read_address);
        axi_write_channel(pReg_clearFifoData,reg_37_clear_fifo_data);
        axi_write_channel(rgbCoord_rl,reg_50_rgb_cord_rl);
        axi_write_channel(rgbCoord_rh,reg_51_rgb_cord_rh);
        axi_write_channel(rgbCoord_gl,reg_52_rgb_cord_gl);
        axi_write_channel(rgbCoord_gh,reg_53_rgb_cord_gh);
        axi_write_channel(rgbCoord_bl,reg_54_rgb_cord_bl);
        axi_write_channel(rgbCoord_bh,reg_55_rgb_cord_bh);
        axi_write_channel(oLumTh,reg_56_lum_th);
        axi_write_channel(oHsvPerCh,reg_57_hsv_per_ch);
        axi_write_channel(oYccPerCh,reg_58_ycc_per_ch);

    endtask: axi_write_config_reg
    // Method:  axi_write_channel_test
    virtual protected task axi_write_channel_test();
            d5m_trans item;
            bit[7:0] addr;
            bit[31:0] data;
        for(addr = 0; addr  <255; addr++) begin
            data++;
            `uvm_create(item)
            item.axi4_lite.addr           = {14'h0,addr[7:0]};
            item.d5m_txn        = AXI4_WRITE;
            item.axi4_lite.data           = data;
            `uvm_send(item);
        end
    endtask: axi_write_channel_test
    // Method:  axi_read_channel_test
    virtual protected task axi_read_channel_test();
            d5m_trans item;
            bit[7:0] addr;
            bit[31:0] data;
        for(addr = 0; addr <255; addr++) begin
            data++;
            `uvm_create(item)
            item.axi4_lite.addr           = {14'h0,addr[7:0]};
            item.d5m_txn                  = AXI4_READ;
            item.axi4_lite.data           = 0;
            `uvm_send(item);
        end
    endtask: axi_read_channel_test
    // Method:  axi_multi_writes_to_address
    virtual protected task axi_multi_writes_to_address (bit[7:0] waddr,bit[31:0] max_value);
       bit[31:0] data;
       for(data = 0; data  <= max_value; data++) begin
           axi_write_channel(waddr,data);
       end
    endtask: axi_multi_writes_to_address
    // Method:  axi_write_channel
    virtual protected task axi_write_channel (bit[7:0] addr,bit[31:0] data);
            d5m_trans item;
            `uvm_create(item)
            item.axi4_lite.addr = addr;
            item.axi4_lite.data = data;
            item.d5m_txn        = AXI4_WRITE;
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
    // Method:  axi_read_channel
    virtual protected task axi_read_channel();
            d5m_trans item;
            bit[7:0] addr;
        for(addr = 0; addr < 256; addr+=4) begin
            `uvm_create(item)
            item.axi4_lite.addr           = {14'h0,addr[7:0]};
            item.d5m_txn        = AXI4_READ;
            `uvm_send(item);
        end
    endtask: axi_read_channel
    // Method:  d5m_write_pre_set_ifval
    virtual protected task d5m_write_pre_set_ifval();
        d5m_trans item;
        int preset_cycles;
        //init d5m clear
        for(preset_cycles = 0; preset_cycles <= 10; preset_cycles++) begin
            `uvm_create(item)
            item.d5p.iImageTypeTest = 1'b1;
            item.d5p.rgb           = 0;
            item.d5p.lvalid        = 1'b0;
            item.d5p.fvalid        = 1'b1;
            item.d5m_txn        = D5M_WRITE;
            if (preset_cycles > 9 )begin //>200
                item.d5p.fvalid      = 1'b1;//init default sof valid line high
            end
            `uvm_send(item);
        end
    endtask: d5m_write_pre_set_ifval
    // Method:  d5m_write_create_frames
    virtual protected task d5m_write_create_frames(int number_frames,int lval_lines,int lval_offset,int image_width,bit enable_pattern);
        d5m_trans item;
        int y_cord;
        int n_frames;
        int n_pixel;
        axi_write_aBusSelect_channel(8'h0C,$urandom_range(0,3));
        for(n_frames = 0; n_frames <= number_frames; n_frames++) begin
            for(y_cord = 0; y_cord <= lval_lines; y_cord++) begin
                for(n_pixel = 1; n_pixel <= ((image_width) + (lval_offset)); n_pixel++) begin
                    `uvm_create(item)
                        item.d5p.iImageTypeTest = 1'b1;
                        item.d5p.iReadyToRead   = 1'b0;
                        item.d5m_txn            = D5M_WRITE;
                    if (y_cord > 0 && y_cord < lval_lines) begin
                        item.d5p.fvalid         = 1'b1;
                        item.d5p.lvalid         = 1'b1;// sol[start of line]
                        item.d5p.rgb          = enable_pattern ? $urandom_range(0,4095) : n_pixel;
                        if (n_pixel >= (image_width)) begin   
                            item.d5p.lvalid      = 1'b0;// eol[end of line]
                            item.d5p.rgb         = 0;
                        end
                    end else begin
                        item.d5p.lvalid          = 1'b0;
                        item.d5p.rgb             = 0;
                        if (y_cord == 0) begin
                            if (n_pixel >= ((image_width) + (lval_offset)) - 10)begin   
                                item.d5p.fvalid      = 1'b1;// sof[start of frame]
                            end
                        end
                        if (y_cord == lval_lines) begin
                            if (n_pixel >= (image_width) + 2)begin   
                                item.d5p.fvalid      = 1'b0;// eof[end of frame]
                            end
                        end
                    end
                    `uvm_send(item);
                end
            end
        end
    endtask: d5m_write_create_frames
    
    virtual protected task axi_write_aBusSelect_channel (bit[7:0] addr,bit[31:0] data);
            d5m_trans item;
            `uvm_create(item)
            item.axi4_lite.addr           = {7'h0,addr};
            item.axi4_lite.data           = data;
            item.d5m_txn        = AXI4_WRITE;
            `uvm_send(item);
    endtask: axi_write_aBusSelect_channel
    
    virtual protected task d5m_read ();
            d5m_trans item;
            `uvm_create(item)
            item.d5p.iImageTypeTest = 1'b0;
            item.d5m_txn            = IMAGE_READ;
            `uvm_send(item);
    endtask: d5m_read
    
endclass: camera_seq