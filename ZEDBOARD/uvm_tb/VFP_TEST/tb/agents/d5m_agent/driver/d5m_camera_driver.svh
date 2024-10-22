// Class: d5m_drv
// This class which extended from uvm driver pull data items generated by a sequencer and drive it to the DUT. In run phase methods are used for read and write operation to dut through dut interface handle.

class d5m_drv extends uvm_driver #(d5m_trans);

    // handle: d5m_camera_vif
    // Interface to d5m dut
    protected virtual d5m_camera_if d5m_camera_vif;

    protected int     id;
    
    `uvm_component_utils_begin(d5m_drv)
        `uvm_field_int(id, UVM_DEFAULT)
    `uvm_component_utils_end
    
    // Function: new
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    // Function: build_phase
    // In this phase, config the dut interface handle through get method.
    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual d5m_camera_if)::get(this, "", "d5m_camera_vif", d5m_camera_vif))
        `uvm_fatal("NOVIF", {"virtual interface must be set for: ",get_full_name(), ".d5m_camera_vif"});
    endfunction: build_phase

    // Method: run_phase
    // In this method, fork join constructs are used to separate threads that drive each of the channels.
    //
    //- reset_signals : this method reset the signals to dut.
    //- d5m_frame     : this method drive data to dut and get response from dut.
    virtual task run_phase (uvm_phase phase);
        fork
        reset_signals();
        d5m_frame();
        join
    endtask: run_phase

    // Function: reset_signals
    // Reset the dut axi4 lite and d5m_cam_mod input signals when system reset is asserted from low to high.
    virtual protected task reset_signals();
        forever begin
            @(posedge d5m_camera_vif.ARESETN);
            d5m_camera_vif.axi4.AWADDR        <=  8'h0;
            d5m_camera_vif.axi4.AWPROT        <=  3'h0;
            d5m_camera_vif.axi4.AWVALID       <=  1'b0;
            d5m_camera_vif.axi4.WDATA         <= 32'h0;
            d5m_camera_vif.axi4.WSTRB         <=  4'h0;
            d5m_camera_vif.axi4.WVALID        <=  1'b0;
            d5m_camera_vif.axi4.BREADY        <=  1'b0;
            d5m_camera_vif.axi4.ARADDR        <=  8'h0;
            d5m_camera_vif.axi4.ARPROT        <=  3'h0;
            d5m_camera_vif.axi4.ARVALID       <=  1'b0;
            d5m_camera_vif.axi4.RREADY        <=  1'b0;
            d5m_camera_vif.d5p.iImageTypeTest <=  1'b0;
            d5m_camera_vif.d5p.iReadyToRead   <=  1'b0;
            d5m_camera_vif.d5p.fvalid         <=  1'b0;
            d5m_camera_vif.d5p.lvalid         <=  1'b0;
        end
    endtask: reset_signals

    // Function: d5m_frame
    // In this method, drive the signals from defined seq in uvm_sequence.
    //
    //- seq_item_port.get_next_item : Get next item from the sequencer.
    //- drive_transfer : this method drive data to dut and get response from dut.
    //- seq_item_port.item_done : Tell the sequence that driver has finished current item.
    virtual protected task d5m_frame();
        forever begin
            @(posedge d5m_camera_vif.clkmm);
            seq_item_port.get_next_item(req);
            drive_transfer(req);
            seq_item_port.item_done();
        end
    endtask: d5m_frame

    // Function: drive_transfer
    // This method which is master to dut axi4lite interface read or write data at given address using axi4 lite bus handshaking protocol.First valid address is transmit and then wait for valid response in given time of 61 clock cycles in axi4_address method. Timeout accord on 62 clock cycle, if no response is asserted high on bvalid signal from dut and timeout is flagged using uvm_error macro. If valid response is asserted then axi4_data method write or read data depending on case statement.
    //
    //- axi4_address : drive the axi4lite write/read address channels.
    //- axi4_data    : write/read the data at given address.
    //- d5m_pixel    : write/read the camera image per pixel.
    virtual protected task drive_transfer (d5m_trans d5m_tx);
        axi4_address(d5m_tx);
        axi4_data(d5m_tx);
        d5m_pixel(d5m_tx);
    endtask: drive_transfer

    // Function: axi4_address
    // In this method, write/read axi4 address channel.
    // 
    //- axi4_write_address  : On selected AXI4_WRITE case write address to axi4 bus.
    //- axi4_wread_address  : On selected AXI4_READ case write read address to axi4 bus.
    virtual protected task axi4_address (d5m_trans d5m_tx);
        case (d5m_tx.d5m_txn)
            AXI4_WRITE : axi4_write_address(d5m_tx);
            AXI4_READ  : axi4_wread_address(d5m_tx);
        endcase
    endtask: axi4_address

    // Function: axi4_data
    // In this method, write/read axi4 data channel.
    //
    //- axi4_write_data : On selected AXI4_WRITE case write data to axi4 bus.
    //- axi4_read_data  : On selected AXI4_READ case read axi4 bus data.
    virtual protected task axi4_data (d5m_trans d5m_tx);
        bit[31:0] rw_data;
        bit err;
        //rw_data = d5m_tx.axi4_lite.data;
        case (d5m_tx.d5m_txn)
            AXI4_WRITE : axi4_write_data(d5m_tx);
            AXI4_READ  : axi4_read_data(rw_data, err);
        endcase
    endtask: axi4_data
    
    // Function: d5m_pixel
    // In this method, d5m read/write frame rgb pixel per transaction.
    //
    //- d5m_write_pixel_data : On selected D5M_WRITE case write data to d5m mod.
    //- d5m_read_pixel_data  : On selected IMAGE_READ case read data from d5m mod.
    virtual protected task d5m_pixel (d5m_trans d5m_tx);
        case (d5m_tx.d5m_txn)
            D5M_WRITE  : d5m_write_pixel_data(d5m_tx);
            IMAGE_READ : d5m_read_pixel_data(d5m_tx);
        endcase
    endtask: d5m_pixel

    // Function: d5m_read_pixel_data
    // In this method, config test type during read operation and wait for end of frame pulse
    //
    //- iImageTypeTest : Image type signal
    //- iReadyToRead   : Enable or disable signal for image read mod in interface.
    //- eof            : End of frame signal
    virtual protected task d5m_read_pixel_data(d5m_trans d5m_tx);
            @(posedge d5m_camera_vif.clkmm);
            d5m_camera_vif.d5p.iImageTypeTest  <= low;
            d5m_camera_vif.d5p.iReadyToRead    <= high;
        forever begin
            @(posedge d5m_camera_vif.clkmm);
            if (d5m_camera_vif.d5m.eof) break;
        end
    endtask: d5m_read_pixel_data

    // Function: d5m_write_pixel_data
    // In this method, write data to d5m camera mod from d5m_trans sequence.
    //
    //- iReadyToRead   : assert low value to this signal to disable image reader module.
    //- iImageTypeTest : provide image type test either seq pattern or from image file.
    //- rgb            : write data to d5m mod
    //- fvalid         : frame valid
    //- lvalid         : line valid
    virtual protected task d5m_write_pixel_data (d5m_trans d5m_tx);
        d5m_camera_vif.d5p.iReadyToRead   <= low;
        d5m_camera_vif.d5p.iImageTypeTest <= d5m_tx.d5p.iImageTypeTest;
        d5m_camera_vif.d5p.rgb            <= d5m_tx.d5p.rgb;
        d5m_camera_vif.d5p.fvalid         <= d5m_tx.d5p.fvalid;
        d5m_camera_vif.d5p.lvalid         <= d5m_tx.d5p.lvalid;
    endtask: d5m_write_pixel_data

    // Function: axi4_write_address
    // In this method, write address and assert write valid high and then wait for response from dut BVALID signal within 62 clock cycles.
    virtual protected task axi4_write_address (d5m_trans d5m_tx);
    
        int axi_lite_ctr;
        d5m_camera_vif.axi4.AWADDR  <= d5m_tx.axi4_lite.addr;
        d5m_camera_vif.axi4.AWPROT  <= 3'h0;
        d5m_camera_vif.axi4.AWVALID <= 1'b1;
        d5m_camera_vif.read_bmp     <= "hsl_v0";
        
        for(axi_lite_ctr = 0; axi_lite_ctr <= time_out; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.clkmm);
            if (d5m_camera_vif.axi4.BVALID) break;
        end
        
        if (axi_lite_ctr == time_out) begin
            `uvm_error("axi_lite_master_driver","AWVALID timeout");
        end   
        
    endtask: axi4_write_address

    // Function: axi4_write_data
    // In this method, axi4lite write data
    //
    //- WDATA   : axi4 write address
    //- WVALID  : axi4 read address
    //- WREADY  : write data to d5m mod
    //- AWVALID : read data from d5m mod
    virtual protected task axi4_write_data (d5m_trans d5m_tx);
        int axi_lite_ctr;
        d5m_camera_vif.axi4.WDATA  <= d5m_tx.axi4_lite.data;
        d5m_camera_vif.axi4.WSTRB  <= 4'hf;
        d5m_camera_vif.axi4.WVALID <= 1'b1;
        @(posedge d5m_camera_vif.clkmm);
            for(axi_lite_ctr = 0; axi_lite_ctr <= time_out; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.clkmm);
            if (d5m_camera_vif.axi4.WREADY) 
                d5m_camera_vif.axi4.AWADDR  <= 8'h0;
                d5m_camera_vif.axi4.AWPROT  <= 3'h0;
                d5m_camera_vif.axi4.AWVALID <= 1'b0; 
            break;
            end
            if (axi_lite_ctr == time_out) begin
            `uvm_error("axi_lite_master_driver","AWVALID timeout");
            end
        @(posedge d5m_camera_vif.clkmm);
            d5m_camera_vif.axi4.WDATA  <= 32'h0;
            d5m_camera_vif.axi4.WSTRB  <= 4'h0;
            d5m_camera_vif.axi4.WVALID <= 1'b0;
        //wait for write response
        for(axi_lite_ctr = 0; axi_lite_ctr <= time_out; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.clkmm);
            if (d5m_camera_vif.axi4.BVALID) break;
        end
        if (axi_lite_ctr == time_out) begin
            `uvm_error("axi_lite_master_driver","BVALID timeout");
        end
        else begin
            if (d5m_camera_vif.axi4.BVALID == 1'b1 && d5m_camera_vif.axi4.BRESP != 2'h0)
            `uvm_error("axi_lite_master_driver","Received ERROR Write Response");
            d5m_camera_vif.axi4.BREADY <= d5m_camera_vif.axi4.BVALID;
         @(posedge d5m_camera_vif.clkmm);
        end
    endtask: axi4_write_data

    // Function: axi4_wread_address
    // In this method, axi4lite write read address
    //
    //- ARADDR : axi4 write address
    //- ARVALID : axi4 read address
    //- ARREADY : write data to d5m mod
    //- ARPROT : read data from d5m mod
    virtual protected task axi4_wread_address (d5m_trans d5m_tx);
    
        int axi_lite_ctr;
        d5m_camera_vif.axi4.ARADDR  <= d5m_tx.axi4_lite.addr;
        d5m_camera_vif.axi4.ARPROT  <= 3'h0;
        d5m_camera_vif.axi4.ARVALID <= 1'b1;
        
        for(axi_lite_ctr = 0; axi_lite_ctr <= time_out; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.clkmm);
            if (d5m_camera_vif.axi4.ARREADY) break;
        end
        
        if (axi_lite_ctr == time_out) begin
            `uvm_error("axi_lite_master_driver","ARVALID timeout");
        end
        
        @(posedge d5m_camera_vif.clkmm);
            d5m_camera_vif.axi4.ARADDR  <= 8'h0;
            d5m_camera_vif.axi4.ARPROT  <= 3'h0;
            d5m_camera_vif.axi4.ARVALID <= 1'b0;
            
    endtask: axi4_wread_address

    // Function: axi4_read_data
    // In this method, axi4lite read data
    //
    //- RDATA  : axi4 write address
    //- RVALID : axi4 read address
    //- RREADY : write data to d5m mod
    //- RRESP  : read data from d5m mod
    virtual protected task axi4_read_data (output bit [31:0] rdata, output bit error);
        int axi_lite_ctr;
        
        for(axi_lite_ctr = 0; axi_lite_ctr <= time_out; axi_lite_ctr ++) begin
            @(posedge d5m_camera_vif.clkmm);
            if (d5m_camera_vif.axi4.RVALID) break;
        end
        
        rdata = d5m_camera_vif.axi4.RDATA;
    
        if (axi_lite_ctr == time_out) begin
            `uvm_error("axi_lite_master_driver","RVALID timeout");
        end else begin
    
        if (d5m_camera_vif.axi4.RVALID == 1'b1 && d5m_camera_vif.axi4.RRESP != 2'h0)
            `uvm_error("axi_lite_master_driver","Received ERROR Read Response");
            d5m_camera_vif.axi4.RREADY <= d5m_camera_vif.axi4.RVALID;
            @(posedge d5m_camera_vif.clkmm);
        end
        
    endtask: axi4_read_data
endclass: d5m_drv