vlog -f ../../includes/dut_vlg.f

vopt top -o top_optimized  +acc +cover=sbfec+top(rtl).
vsim top_optimized -coverage +UVM_TESTNAME=img_blur_test
set NoQuitOnFinish 1
onbreak {resume}
log /* -r
run -all
coverage attribute -name TESTNAME -value img_blur_test
coverage save img_blur_test.ucdb
vcover report img_blur_test.ucdb -cvg -details
coverage report -html -htmldir ../coverage_reports/questa_html_coverage_reports/img_blur_test -source -details -assert -directive -cvg -code bcefst -verbose -threshL 50 -threshH 90
coverage report -file ../coverage_reports/img_blur_test.txt -byfile -totals -assert -directive -cvg -codeAll
quit





