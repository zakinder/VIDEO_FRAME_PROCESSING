@echo off
%~d1
setlocal enableextensions disabledelayedexpansion



set file2=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/axi_config_image_frame_sequence.html
set file3=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_agent.html
set file4=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_base_seq.html
set file5=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_configuration.html
set file6=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_driver.html
set file7=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_env.html
set file8=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_fc_subscriber.html
set file9=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_cgain_hsl_sequence.html
set file10=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_blur_test.html
set file11=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_cgain_cgain_test.html
set file12=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_cgain_hsl_test.html
set file13=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_cgain_sharp_test.html
set file14=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_cgain_test.html
set file15=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_emboss_test.html
set file16=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_hsl_test.html
set file17=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_hsv_test.html
set file18=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_rgb_test.html
set file19=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_sharp_cgain_test.html
set file20=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_sharp_test.html
set file21=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_sobel_mask_blu_test.html
set file22=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_sobel_mask_cga_test.html
set file23=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_sobel_mask_hsl_test.html
set file24=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_sobel_mask_hsv_test.html
set file25=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_sobel_mask_rgb_test.html
set file26=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_sobel_mask_shp_test.html
set file27=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_sobel_test.html
set file28=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_file_test.html
set file29=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_image_pattern_test.html
set file30=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_monitor.html
set file31=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_sequence.html
set file32=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_sequencer.html
set file33=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_camera_test.html
set file34=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_rgb_patten_test.html
set file35=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/d5m_scoreboard.html
set file36=C:/Images/REPOS/GitHub/uvm_doc/classes/SystemVerilog/vfp_registers.html
set file37=C:/Images/REPOS/GitHub/uvm_doc/files/generic_pack0-svh.html
set file38=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/d5m_camera_agent-svh.html
set file39=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/configuration/d5m_camera_config-svh.html
set file40=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/coverage/d5m_camera_coverage-svh.html
set file41=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/coverage/d5m_scoreboard-svh.html
set file42=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/driver/d5m_camera_driver-svh.html
set file43=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/monitor/d5m_camera_monitor-svh.html
set file44=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/axi_config_image_frame_sequence-svh.html
set file45=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/d5m_camera_base_seq-svh.html
set file46=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/d5m_camera_image_cgain_hsl_sequence-svh.html
set file47=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/d5m_camera_image_sharp_sequence-svh.html
set file48=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/d5m_camera_sequence-svh.html
set file49=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/d5m_camera_sequencer-svh.html
set file50=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/d5m_image_generator_sequence-svh.html
set file51=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/d5m_image_random_sequence-svh.html
set file52=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/d5m_rgb_packet-svh.html
set file53=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/d5m_rgb_sequence-svh.html
set file54=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/vfp_configuration-svh.html
set file55=C:/Images/REPOS/GitHub/uvm_doc/files/agents/d5m_agent/sequence/vfp_registers-svh.html
set file56=C:/Images/REPOS/GitHub/uvm_doc/files/env/d5m_camera_env/d5m_camera_env-sv.html
set file57=C:/Images/REPOS/GitHub/uvm_doc/files/test/d5m_camera/d5m_camera_image_file_test-sv.html
set file58=C:/Images/REPOS/GitHub/uvm_doc/files/test/d5m_camera/d5m_camera_image_pattern_test-sv.html
set file59=C:/Images/REPOS/GitHub/uvm_doc/files/test/d5m_camera/d5m_camera_test-sv.html
set file60=C:/Images/REPOS/GitHub/uvm_doc/files/test/d5m_camera/d5m_rgb_patten_test-sv.html



@GOTO start_run_from_here

:start_run_from_here
@set /p standalone=" STANDALONE(1-true): "

"C:\Program Files\wkhtmltopdf\bin\wkhtmltopdf" --disable-smart-shrinking --enable-local-file-access file:///%file2%  file:///%file3%  file:///%file4%  file:///%file5%  file:///%file6%  file:///%file7%  file:///%file8%  file:///%file9%  file:///%file10%  file:///%file11%  file:///%file12%  file:///%file13%  file:///%file14%  file:///%file15%  file:///%file16%  file:///%file17%  file:///%file18%  file:///%file19%  file:///%file20%  file:///%file21%  file:///%file22%  file:///%file23%  file:///%file24%  file:///%file25%  file:///%file26%  file:///%file27%  file:///%file28%  file:///%file29%  file:///%file30%  file:///%file31%  file:///%file32%  file:///%file33%  file:///%file34%  file:///%file35%  file:///%file36%  file:///%file37%  file:///%file38%  file:///%file39%  file:///%file40%  file:///%file41%  file:///%file42%  file:///%file43%  file:///%file44%  file:///%file45%  file:///%file46%  file:///%file47%  file:///%file48%  file:///%file49%  file:///%file50%  file:///%file51%  file:///%file52%  file:///%file53%  file:///%file54%  file:///%file55%  file:///%file56%  file:///%file57%  file:///%file58%  file:///%file59%  file:///%file60% C:\Images\REPOS\GitHub\uvm_doc_gen\VIDEO_STREAM.pdf
@GOTO start_run_from_here