
vlog -f ../../includes/dut_vlg.f

vopt top -o top_optimized  +acc +cover=sbfec+top(rtl).
vsim top_optimized -coverage +UVM_TESTNAME=img_hsl_test
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all






