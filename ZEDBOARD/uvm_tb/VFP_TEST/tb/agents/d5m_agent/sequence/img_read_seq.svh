// Class: img_read_seq
class img_read_seq extends uvm_sequence #(d5m_trans);
    `uvm_object_utils(img_read_seq) 
    
    // Function: new
    function new(string name="img_read_seq");
        super.new(name);
    endfunction: new
    
    // Method:  body
    virtual    task body();
        d5m_trans item;
        `uvm_create(item)
        item.d5p.iImageTypeTest = 1'b0;
        item.d5m_txn            = IMAGE_READ;
        `uvm_send(item);
    endtask: body
    
endclass: img_read_seq