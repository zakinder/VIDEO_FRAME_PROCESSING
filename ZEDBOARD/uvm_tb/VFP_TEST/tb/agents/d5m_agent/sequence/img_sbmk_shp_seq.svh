// Class: img_sbmk_shp_seq
class img_sbmk_shp_seq extends uvm_sequence #(uvm_sequence_item);

   `uvm_object_utils(img_sbmk_shp_seq);
   
   
   img_read_seq            img_seq_h;
   config_axi4_seq         axi_cnf_seq_h;
   protected img_seqr      d5m_sqr_h;
   uvm_component           uvm_component_h;

    // Function: new
     function new(string name = "img_sbmk_shp_seq");
        super.new(name);
        uvm_component_h   =  uvm_top.find("*d5m_sqr_h");
        if (uvm_component_h == null)
            `uvm_fatal("RUNALL SEQUENCE", "Failed to get the img_seqr")
        if (!$cast(d5m_sqr_h, uvm_component_h))
            `uvm_fatal("RUNALL SEQUENCE", "Failed to cast from uvm_component_h.")
        img_seq_h 	    = img_read_seq::type_id::create("img_seq_h");
        axi_cnf_seq_h 	= config_axi4_seq::type_id::create("axi_cnf_seq_h");
     endfunction : new
 

    // Method:  body
    task body();
        //-------------------------------------------
        // Override axi config data
        //-------------------------------------------
        axi_cnf_seq_h.rgb_sharp           = reg_00_rgb_sharp;
        axi_cnf_seq_h.edge_type           = reg_01_edge_type;
        axi_cnf_seq_h.config_threshold    = reg_04_config_threshold;
        axi_cnf_seq_h.video_channel       = reg_05_video_channel;
        axi_cnf_seq_h.c_channel           = reg_07_c_channel;
        axi_cnf_seq_h.en_ycbcr_or_rgb     = reg_06_en_ycbcr_or_rgb;
        axi_cnf_seq_h.point_interest      = reg_31_point_interest;
        axi_cnf_seq_h.delta_config        = reg_32_delta_config;
        axi_cnf_seq_h.cpu_ack_go_again    = reg_33_cpu_ack_go_again;
        axi_cnf_seq_h.cpu_wgrid_lock      = reg_34_cpu_wgrid_lock;
        axi_cnf_seq_h.cpu_ack_off_frame   = reg_35_cpu_ack_off_frame;
        axi_cnf_seq_h.fifo_read_address   = reg_36_fifo_read_address;
        axi_cnf_seq_h.clear_fifo_data     = reg_37_clear_fifo_data;
        axi_cnf_seq_h.rgb_cord_rl         = reg_50_rgb_cord_rl;
        axi_cnf_seq_h.rgb_cord_rh         = reg_51_rgb_cord_rh;
        axi_cnf_seq_h.rgb_cord_gl         = reg_52_rgb_cord_gl;
        axi_cnf_seq_h.rgb_cord_gh         = reg_53_rgb_cord_gh;
        axi_cnf_seq_h.rgb_cord_bl         = reg_54_rgb_cord_bl;
        axi_cnf_seq_h.rgb_cord_bh         = reg_55_rgb_cord_bh;
        axi_cnf_seq_h.lum_th              = reg_56_lum_th;
        axi_cnf_seq_h.hsv_per_ch          = reg_57_hsv_per_ch;
        axi_cnf_seq_h.ycc_per_ch          = reg_58_ycc_per_ch;
        //-------------------------------------------
        axi_cnf_seq_h.start(d5m_sqr_h);
        img_seq_h.start(d5m_sqr_h);
    endtask : body
 
 
endclass : img_sbmk_shp_seq