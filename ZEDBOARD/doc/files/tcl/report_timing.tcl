report_timing -nworst 5 -path_type full -input_pins
report_timing_summary -delay_type min_max -path_type full_clock_expanded -report_unconstrained -check_timing_verbose -max_paths 10 -nworst 1 -significant_digits 3 -input_pins -name timing_1
