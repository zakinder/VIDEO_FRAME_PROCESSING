// package: d5m_camera_agent_pkg
package d5m_camera_agent_pkg;
  import uvm_pkg::*;
  import generic_pack::*;
  import filters_coef_pack::*;
  import vfp_structs_pack::*;
  `include "uvm_macros.svh"
  `include "../../defin_lib.svh"
  `include "transaction/d5m_trans.svh"
  `include "sequence/vfp_reg.svh"
  `include "sequence/vfp_config.svh"
  `include "sequence/rgb_cell_unit.svh"
  `include "sequence/rgb_set_cell.svh"
  `include "sequence/rgb_per_cell.svh"
  `include "sequence/rgb_set_rows.svh"
  `include "sequence/rgb_set_cols.svh"
  `include "sequence/rgb_set_frame.svh"
  `include "sequence/img_seqr.svh"
  `include "sequence/config_axi_seq.svh"
  `include "sequence/img_base_seq.svh"
  `include "sequence/camera_seq.svh"
  `include "sequence/img_read_seq.svh"
  `include "sequence/img_random_seq.svh"
  `include "sequence/img_file_seq.svh"
  `include "sequence/d5m_rgb_seq.svh"
  `include "sequence/img_cga_seq.svh"
  `include "sequence/img_shp_seq.svh"
  `include "sequence/img_blu_seq.svh"
  `include "sequence/img_hsv_seq.svh"
  `include "sequence/img_hsl_seq.svh"
  `include "sequence/img_emb_seq.svh"
  `include "sequence/img_rgb_seq.svh"
  `include "sequence/img_cga_hsl_seq.svh"
  `include "sequence/img_shp_cga_seq.svh"
  `include "sequence/img_cga_cga_seq.svh"
  `include "sequence/img_cga_shp_seq.svh"
  `include "sequence/img_sb_seq.svh"
  `include "sequence/img_sbmk_blu_seq.svh"
  `include "sequence/img_sbmk_cga_seq.svh"
  `include "sequence/img_sbmk_hsl_seq.svh"
  `include "sequence/img_sbmk_hsv_seq.svh"
  `include "sequence/img_sbmk_rgb_seq.svh"
  `include "sequence/img_sbmk_shp_seq.svh"
  `include "sequence/img_pattern_seq.svh"
  `include "configuration/d5m_camera_config.svh"
  `include "driver/d5m_camera_driver.svh"
  `include "monitor/d5m_camera_monitor.svh"
  `include "monitor/d5m_monitor_dut.svh"
  `include "monitor/d5m_monitor_predict.svh"
  `include "coverage/d5m_camera_coverage.svh"
  `include "d5m_camera_agent.svh"
  //`include "coverage/d5m_scoreboard.svh"
endpackage:d5m_camera_agent_pkg