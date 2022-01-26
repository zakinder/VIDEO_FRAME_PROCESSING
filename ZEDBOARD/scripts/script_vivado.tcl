namespace eval ZQ {
  namespace eval VIV {
    # -----------------------------------------
    # ----advanced functions are currently official not supported
    # -----------------------------------------
    # -----------------------------------------
    # --export_vivado_setting: 
    proc export_vivado_setting {} {
    # hidden function: official not supported
      set old_file_data ""
      if {![file exists $ZQ::SET_PATH]} {
        file mkdir ${ZQ::SET_PATH}/
      } elseif {[file exists ${ZQ::SET_PATH}/project_settings.tcl]} {
        # additional project settings
        set fp_r [open ${ZQ::SET_PATH}/project_settings.tcl "r"]
        set old_file_data [read $fp_r]
        close $fp_r
      }
      set fp_w [open ${ZQ::SET_PATH}/project_settings.tcl "w"]
      puts $fp_w "##############################"                                       
      puts $fp_w "# -----------------------------------------"
      puts $fp_w "# --   *****************************                                  "
      puts $fp_w "# --   *   zynq Electronic GmbH   *                                   "
      puts $fp_w "# --   *   Holzweg 19A             *                                  "
      puts $fp_w "# --   *   32257 Bünde             *                                  "
      puts $fp_w "# --   *   Germany                 *                                  "
      puts $fp_w "# --   *****************************                                  "
      puts $fp_w "# -----------------------------------------"
      puts $fp_w "##############################"
      puts $fp_w "##Automatically exported settings:"
      puts $fp_w "##Creation time: [ clock format [clock seconds] -format "%Y-%m-%dT%H:%M:%S"]"
      puts $fp_w "##Board Part:    [get_property board_part [current_project]]"
      puts $fp_w "##Part:          [get_property part [current_project]]"
      puts $fp_w "#Export Settings currently not available."
      puts $fp_w "#This file will be read on project generation only."
      puts $fp_w "##############################"
      puts $fp_w "#Old file settings:"
      puts $fp_w $old_file_data
      puts $fp_w "##############################"
      puts $fp_w "#exported file settings:"
      puts $fp_w "puts \"Info:(ZQ) Automatically exported settings.\""
      puts $fp_w "#set_property \"board_part\" [get_property board_part [current_project]] \[current_project\]"
      puts $fp_w "#set_property \"part\" [get_property part [current_project]] \[current_project\]"
      close $fp_w
    } 
    # -----------------------------------------
    # --import_vivado_setting:     
    proc import_vivado_setting {} {
    # hidden function: official not supported
      if {[file exists ${ZQ::SET_PATH}/project_settings.tcl]} {
        # additional project settings
       puts "Info:(ZQ) Load additional project properties."
        source ${ZQ::SET_PATH}/project_settings.tcl
      }
    }  
    # -----------------------------------------
    # --design_exclude_boarddef: 
    proc design_exclude_boarddef {temp_only} {
      # hidden function: official not supported
      #run only if board part is defined
      if {[get_property board_part [current_project]] ne ""} {
        #get bd files
        set bd_files [list]
        if { [catch {set bd_files [glob -join -dir ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/ * *.bd]}] } {
        }
        if {[llength $bd_files]>1} {
          puts "Error:(ZQ) Exclude Board part. Only one Block Design supported for this function."; return -code error;
        }
        #run rtl for xdc export
        synth_design -rtl -name rtl_1
        set pjc_xdc_path "${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::CONST_NAME}"
        file mkdir $pjc_xdc_path
        #export io locs (needed if constrain in board part only)
        write_xdc -force -mode port  ${pjc_xdc_path}/_i_exclude_boardpart_io_loc.xdc
        #remove wrong properties
        set fp_r [open ${pjc_xdc_path}/_i_exclude_boardpart_io_loc.xdc "r"]
        set file_data [read $fp_r]
        close $fp_r
        set data [split $file_data "\n"]
        set fp_w [open ${pjc_xdc_path}/_i_exclude_boardpart_io_loc.xdc "w"]
        puts $fp_w "##############################"                                       
        puts $fp_w "# -----------------------------------------"
        puts $fp_w "# --   *****************************                                  "
        puts $fp_w "# --   *   zynq Electronic GmbH   *                                  "
        puts $fp_w "# --   *   Holzweg 19A             *                                  "
        puts $fp_w "# --   *   32257 Buende            *                                  "
        puts $fp_w "# --   *   Germany                 *                                  "
        puts $fp_w "# --   *****************************                                  "
        puts $fp_w "# -----------------------------------------"
        puts $fp_w "##############################"
        puts $fp_w "##Automatically exported port constrains from exclude board part function:"
        puts $fp_w "##Creation time: [ clock format [clock seconds] -format "%Y-%m-%dT%H:%M:%S"]"
        puts $fp_w "##Board Part:    [get_property board_part [current_project]]"
        puts $fp_w "##Part:          [get_property part [current_project]]"
        puts $fp_w "##############################"
        foreach line $data {
          #ignore some properties
          if {![string match "*set_property DIRECTION*" $line] && ![string match "*set_property IBUF_LOW_PWR*" $line] && ![string match "*current_instance -quiet*" $line]} {
            puts $fp_w $line
          }
        }
        close $fp_w
        #add constrains file
        add_files -fileset ${ZQ::CONST_NAME} ${pjc_xdc_path}/_i_exclude_boardpart_io_loc.xdc
        set_property used_in_synthesis false [get_files ${pjc_xdc_path}/_i_exclude_boardpart_io_loc.xdc]
        #modify some ip setting manually
        set mig_project ""
        # set mig_addr_offset ""
        foreach bd $bd_files {
          open_bd_design $bd
          puts "Info:(ZQ) Modify properties to Custom:$bd"
          # -------------
          #mig
          if {[catch {[get_bd_cells -hierarchical -filter {VLNV=~"*mig_7series*"}]}]} {
            puts "Warning: (ZQ) MIG was found and must be modified. Check Settings after run."
            catch {set_property CONFIG.BOARD_MIG_PARAM Custom [get_bd_cells -hierarchical -filter {VLNV=~"*mig_7series*"}]}
            catch {set mig_project [get_property CONFIG.XML_INPUT_FILE [get_bd_cells -hierarchical -filter {VLNV=~"*mig_7series*"}]]}
            # catch {set mig_addr_offset [get_property range [get_bd_addr_segs -of_objects [get_bd_cells -hierarchical -filter {VLNV=~"*mig_7series*"}]]]}
          }
          # -------------
          #ZQ ASIO
          if {[catch {[get_bd_cells -hierarchical -filter {VLNV=~"*axis_asio_gpio*"}]}]} {
            puts "Warning: (ZQ) ASIO IP was found and will be modified. Check Settings after run."
            catch {set_property CONFIG.USE_BOARD_FLOW false [get_bd_cells -hierarchical -filter {VLNV=~"*axis_asio_gpio*"}]}
            catch {set_property CONFIG.P0_BOARD_INTERFACE Custom [get_bd_cells -hierarchical -filter {VLNV=~"*axis_asio_gpio*"}]}
          }
        }
        #disable board definition
        set_property "part" "[get_property part [current_project]]" [current_project]
        #update ip's
        set ip_names [get_ips]
        if {[llength $ip_names]>0 } {
          ::report_ip_status -name ip_status 
          foreach ip $ip_names {
            puts "Info:(ZQ) Upgrade: $ip_names"
            if {[catch {::upgrade_ip [get_ips  $ip]}] } {puts "Critical Warning:(ZQ) Upgrade failed and will be ignored."}
          }
          ::report_ip_status -name ip_status 
        }
        #restore some ip setting manually
        foreach bd $bd_files {
          # -------------
          #mig
          if {[catch {[get_bd_cells -hierarchical -filter {VLNV=~"*mig_7series*"}]}]} {
            catch {set_property CONFIG.XML_INPUT_FILE $mig_project [get_bd_cells -hierarchical -filter {VLNV=~"*mig_7series*"}]}
            catch {assign_bd_address [get_bd_addr_segs -of_objects [get_bd_cells -hierarchical -filter {VLNV=~"*mig_7series*"}]]}
            # catch {set_property range $mig_addr_offset [get_bd_addr_segs -of_objects [get_bd_cells -hierarchical -filter {VLNV=~"*mig_7series*"}]]}
          }
          # -------------
          #ZQ ASIO
          if {[catch {[get_bd_cells -hierarchical -filter {VLNV=~"*axis_asio_gpio*"}]}]} {
          }
          # -------------
          validate_bd_design
          save_bd_design
          close_bd_design [current_bd_design] 
        }
        if {!$temp_only} {
          puts "Info:(ZQ) Modify Board Part removing permanently"
          # -----------------------------------------
          #copy exported xdc fie
          file copy -force ${pjc_xdc_path}/exclude_boardpart_io_loc.xdc ${ZQ::XDC_PATH}/_i_exclude_boardpart_io_loc.xdc
          # -----------------------------------------
          #backup old block designs tcl files
          set bd_folder ${ZQ::BD_PATH}/
          if {[file exists ${ZQ::BD_PATH}/${ZQ::SHORTDIR}/]} {
            set bd_folder ${ZQ::BD_PATH}/${ZQ::SHORTDIR}/
          }
          set bd_names []
          if { ![catch {set bd_names [glob -join -dir ${bd_folder}/ *.tcl]}] } {
            foreach bd $bd_names {
              if {![file exists ${bd}_backup]} {
                file copy -force ${bd} ${bd}_backup
              }
            }
          }
          # -----------------------------------------
          #write new bd file
          ZQ::hw_blockdesign_export_tcl
          # -----------------------------------------
          # write new board_files.
          set board_files ""
          if { [catch {set board_files [ glob $ZQ::BOARDDEF_PATH/*board_files.csv ] }] } {
            puts "Warning:(ZQ) No Board Definition list found in ${ZQ::BOARDDEF_PATH}/. *board_file_mod.csv generation failed."
          } else {
            set fp [open "${board_files}" r]
            set file_data [read $fp]
            close $fp
            set data [split $file_data "\n"]
            set newdata []
            #boardname:3
            foreach line $data {
                if {[string match *#* $line] != 1 && [string match *CSV_VERSION* $line] } {
                  lappend newdata $line
                  lappend newdata "#Attention:This is a modified Board part CSV files."
                } elseif {[string match *#* $line] != 1 && [string length $line] > 7} {
                #remove spaces
                set line [string map {" " ""} $line]
                #remove tabs
                set line [string map {"\t" ""} $line]
                #split and replaced
                set tmp [split $line ","]
                set tmp [lreplace $tmp[set tmp {}] 3 3 NA]
                set newstring ""
                set first 1
                foreach el $tmp {
                  if {$first} {
                    set newstring "$el"
                    set first 0
                  } else {
                    set newstring "$newstring,$el"
                  }
                }
                lappend newdata $newstring
              } else {
                lappend newdata $line
              }
            }
            #write all list elements to file
            set new_name [file tail $board_files]
            set new_name [file rootname $new_name]
            set board_files "$ZQ::BOARDDEF_PATH/${new_name}_mod.csv"
            set fp_w [open ${board_files} "w"]
            foreach line $newdata {
              puts $fp_w $line
            }
            close $fp_w
          }
          # -----------------------------------------------
        }
        puts "Warning:(ZQ) Exclude Board Part is done."
      } else {
        puts "Warning:(ZQ) No board part specified, nothing's done"
      }
    }   
    # -----------------------------------------
    # --design_include_boarddef: 
    proc design_include_boarddef {} {
     puts "Error:(ZQ) Sorry currently not available"
    }
    # -----------------------------------------
    # --import_hdl: 
    proc import_hdl {} {
    # hidden function: official not supported
      if {[file exists $ZQ::HDL_PATH]} {
        puts "------------------------------------------"
        puts "Info:(ZQ) Import HDL Files:"
        set hdl_names [ZQ::UTILS::search_hdl_files]
        add_files $hdl_names
        if {[file exists $ZQ::HDL_PATH/${ZQ::VPROJ_NAME}_top.vhd]} {
          #vhdl
          set_property top ${ZQ::VPROJ_NAME}_top [current_fileset]
          #overwrite bd_import toplevel_settings
          puts "Info:(ZQ) Use new Toplevel name:"
          set ZQ::PR_TOPLEVELNAME ${ZQ::VPROJ_NAME}_top
          puts "ZQ::PR_TOPLEVELNAME:$ZQ::PR_TOPLEVELNAME"
        } elseif {[file exists $ZQ::HDL_PATH/${ZQ::VPROJ_NAME}_top.v]} {
          #Verilog
          set_property top ${ZQ::VPROJ_NAME}_top [current_fileset]
          #overwrite bd_import toplevel_settings
          puts "Info:(ZQ) Use new Toplevel name:"
          set ZQ::PR_TOPLEVELNAME ${ZQ::VPROJ_NAME}_top
          puts "ZQ::PR_TOPLEVELNAME:$ZQ::PR_TOPLEVELNAME"
        }
        # set attributes
        foreach hdl $hdl_names {
          set hdl_name [file tail [file rootname $hdl]]
          if {[string match "*_simonly_*" $hdl_name] } {
            set_property used_in_synthesis false [get_files  $hdl]
          }
          if {[string match "*_synonly_*" $hdl_name] } {
            set_property used_in_simulation false [get_files  $hdl]
          }
        }
      }
    }     
    # -----------------------------------------
    # --import_xci: import xci files
    proc import_xci {} {
    # hidden function: official not supported
      if {[file exists $ZQ::HDL_PATH/xci]} {
        puts "------------------------"
        puts "Info:(ZQ) Import XCI Files:"
        set ip_names [ZQ::UTILS::search_xci_files]
        import_ip  -files $ip_names
        catch {set ip_names [get_ips]}
        foreach ip $ip_names {
          ##ips without block design ips
          if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/ip/${ip}/${ip}.xci] } {
            puts "Info:(ZQ) Run out of context IP: $ip"
            generate_target {instantiation_template} [get_files ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/ip/${ip}/${ip}.xci]
            update_compile_order -fileset ${ZQ::SOURCE_NAME}
            generate_target all [get_files ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/ip/${ip}/${ip}.xci]
            if {[get_property generate_synth_checkpoint [get_files ${ip}.xci]] == 1 && [get_property is_enabled [get_files ${ip}.xci]] == 1} {
              create_ip_run [get_files -of_objects [get_fileset ${ZQ::SOURCE_NAME}] ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/ip/${ip}/${ip}.xci]
              launch_run -jobs $ZQ::RUNNING_JOBS ${ip}_synth_1
            }
          }
        }
        puts "------------------------"
        foreach ip $ip_names {
          ##ips without ips from block design
          if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/ip/${ip}/${ip}.xci] } {
            if {[get_property generate_synth_checkpoint [get_files ${ip}.xci]] == 1  && [get_property is_enabled [get_files ${ip}.xci]] == 1} {
              wait_on_run -timeout ${ZQ::TIMEOUT} ${ip}_synth_1
            }
          }
        }
      }
    }
    # -----------------------------------------
    # --export_xci: export xci files
    proc export_xci {} {
    # hidden function: official not supported
      set ip_names [list]
      catch {set ip_names [get_ips]}
      if {[llength $ip_names] > 0} {
        file mkdir $ZQ::HDL_PATH/xci/${ZQ::SHORTDIR}
        puts "Info:(ZQ) Following IP designs stored in $ZQ::HDL_PATH/xci/:"
        foreach ip $ip_names {
          ##ips without block design ips
          if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/ip/${ip}/${ip}.xci] } {
            puts $ip
            file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/ip/${ip}/${ip}.xci $ZQ::HDL_PATH/xci/${ZQ::SHORTDIR}/${ip}.xci
          }
        }
      }
    }
    # -----------------------------------------
    # finished advanced function
    # -----------------------------------------
    # -----------------------------------------
    # -----------------------------------------
    # project creation functions
    # -----------------------------------------
    # -----------------------------------------
    # --create_project: create vivado project, set board definition and ip path, set default vivado properties
    proc create_project {} {
      #set board part file definition path
      ZQ::ENV::set_path_boarddef
      #create vivado project 
      ::create_project -force $ZQ::VPROJ_NAME $ZQ::VPROJ_PATH 
      #set local ip path
      ZQ::ENV::set_path_ip
      #set vivado properties
      set_vprops
    }
    # -----------------------------------------
    # --open_project: open excisting vivado project and restore importent script variables with settings from project
    proc open_project {} {
      #open vivado project
      ::open_project ${ZQ::VPROJ_NAME}.xpr
      #restore vivado properties to script variables
      restore_scriptprops
    }    
    # -----------------------------------------
    # --close_project: close excisting vivado project
    proc close_project {} {
      #close vivado project
      ::close_project
    }
    # -----------------------------------------
    # finished creation functions
    # -----------------------------------------
    # -----------------------------------------
    # project property functions
    # -----------------------------------------
    # -----------------------------------------
    # --set_vprops: 
    proc set_vprops {} {
      #set std properties
      set_property "default_lib" "xil_defaultlib" [current_project]
      set_property "simulator_language" "Mixed" [current_project]
      set_property "target_language" "VHDL" [current_project]
      if {[info exists ZQ::PARTNAME]} {
        if {![string match $ZQ::PARTNAME "NA"]} {
          set_property "part" $ZQ::PARTNAME [current_project]
        }
      }
      if {[info exists ZQ::BOARDPART]} {
        if {![string match $ZQ::BOARDPART "NA"]} {
          set_property "board_part" $ZQ::BOARDPART [current_project]
        }
      }
      # -----------------------------------------
      #hidden function write settings
      import_vivado_setting
      # -----------------------------------------
      #overwite xilinx defaults
      set_property name $ZQ::SIM_NAME     [get_filesets sim_1]
      set_property name $ZQ::SYNTH_NAME   [get_runs synth_1]
      set_property name $ZQ::IMPL_NAME    [get_runs impl_1]
      set_property name $ZQ::CONST_NAME   [get_filesets constrs_1]
      # -----------------------------------------
    } 
    # -----------------------------------------
    # --restore_scriptprops: 
    proc restore_scriptprops {} {
      set ID [get_property board_part [current_project]]
      if {$ID ne ""} {
        ZQ::INIT::init_board $ID 3
      } else {
        ZQ::INIT::init_part_only [get_property part [current_project]]
      }
      #check bd filenames for some additional functions 
      if {[catch {ZQ::INIT::check_bdtyp} result]} { puts "Error:(ZQ) Script (ZQ::INIT::check_bdtyp) failed: $result."; return -code error}
      # -----------------------------------------
      puts "------------------------------------------"
      puts "Info:(ZQ) Restore Project parameters:"
      #check board parts
      if { ![string equal $ZQ::PARTNAME [get_property part [current_project]]] } {
        puts "Warning:(ZQ) Partname ([get_property part [current_project]]) is not part of the board definition file $ZQ::BOARDPART"
      }      
      #check toplevel name
      if { ![string equal $ZQ::PR_TOPLEVELNAME [get_property top  [current_fileset]]] } {
        puts "Warning:(ZQ) Top Level Name ([get_property top  [current_fileset]]) is not same then exspected from BD-File delivery ($ZQ::PR_TOPLEVELNAME)"
        puts "Info:(ZQ) [get_property top  [current_fileset]] is used in Script settings now."
        set ZQ::PR_TOPLEVELNAME [get_property top  [current_fileset]]
      }      
      #set run paths
      set ZQ::SIM_NAME    [get_property name [get_filesets sim*]]
      set ZQ::SYNTH_NAME  [get_property name [get_runs syn*]]
      set ZQ::IMPL_NAME   [get_property name [get_runs imp*]]
      set ZQ::CONST_NAME  [get_property name [get_filesets con*]]
      puts "ZQ::SIM_NAME:       $ZQ::SIM_NAME  "
      puts "ZQ::SYNTH_NAME:     $ZQ::SYNTH_NAME"
      puts "ZQ::IMPL_NAME:      $ZQ::IMPL_NAME "
      puts "ZQ::CONST_NAME:     $ZQ::CONST_NAME"
      puts "------------------------------------------"
    }
    # -----------------------------------------
    # finished project property functions
    # -----------------------------------------
    # -----------------------------------------
    # project source functions
    # -----------------------------------------
    # -----------------------------------------
    # --import_design: 
    proc import_design {} {
      #load backup constrains and block design
      set xdc_files [ZQ::UTILS::search_xdc_files]
      import_xdc $xdc_files
      set_xdcsetting $xdc_files
      import_blockdesign
      import_hdl
      import_xci
      import_elf
    }
    # -----------------------------------------
    # --import_xdc: 
    proc import_xdc {xdc_files} {
      set target_file ""
      foreach xdc $xdc_files {
        read_xdc $xdc
        if {[file tail $xdc] eq "target_pins.xdc"} {
          set target_file $xdc
        }
      }
      set_property target_constrs_file $target_file [current_fileset -constrset]
    }
    # -----------------------------------------
    # --set_xdcsetting: 
    proc set_xdcsetting {xdc_files} {
      #set xdc properties depending on xdc name: processing order an usage
      foreach xdc_file $xdc_files {
        if {[string match *_e_* $xdc_file] == 1} {
            set_property PROCESSING_ORDER EARLY [get_files $xdc_file]
        } elseif {[string match *_l_* $xdc_file] == 1} {
            set_property PROCESSING_ORDER LATE [get_files $xdc_file]
        } else {
          set_property PROCESSING_ORDER NORMAL [get_files $xdc_file]
        }
        if {[string match *_s_* $xdc_file] == 1} {
            set_property USED_IN_IMPLEMENTATION 0 [get_files $xdc_file]
            set_property USED_IN_SYNTHESIS 1 [get_files $xdc_file]
        } elseif {[string match *_i_* $xdc_file] == 1} {
            set_property USED_IN_SYNTHESIS 0 [get_files $xdc_file]
            set_property USED_IN_IMPLEMENTATION 1 [get_files $xdc_file]
        } else {
          set_property USED_IN_SYNTHESIS 1 [get_files $xdc_file]
          set_property USED_IN_IMPLEMENTATION 1 [get_files $xdc_file]
        }
      }
    }
    # -----------------------------------------
    # --reload_blockdesign: delete all bds and load bd.tcl files from backup
    proc reload_blockdesign {} {
      set bd_files []
      if { [catch {set bd_files [glob -join -dir ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/ * *.bd]}] } {
      }
      foreach bd $bd_files {
        puts "Info:(ZQ) Remove:$bd"
          remove_files $bd
          set bd_dir [file dirname $bd]
          file delete -force $bd_dir
      }
      import_blockdesign
    }
    # -----------------------------------------
    # --import_blockdesign: imports and compile bd designs for vivado
    proc import_blockdesign {} {
      #check bd filenames for some additional functions
      if {[catch {ZQ::INIT::check_bdtyp} result]} {puts "Error:(ZQ) Script (ZQ::INIT::check_bdtyp) failed: $result."; return -code error}
      set bd_files [ZQ::UTILS::search_bd_files]
      if {[llength $bd_files]>0 } {
        #run bd tcl
        foreach bd $bd_files {
          # 
          if {[file extension $bd] eq ".tcl"} {
            source $bd
            close_bd_design [get_bd_designs]
          }
        }
        #compile bd
        set bd_files []
        if { [catch {set bd_files [glob -join -dir ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/ * *.bd]}] } {
        }
        foreach bd $bd_files {
          open_bd_design $bd
          validate_bd_design -force
          generate_target all [get_files $bd]
          #check if hdf to exists
          set bd_name [get_bd_designs]
          set tl_name "NA"
          if { [catch {set tl_name [glob -join -dir $ZQ::HDL_PATH/ ${ZQ::VPROJ_NAME}_top.*]}] } {
            puts "Info:(ZQ) Generate top level wrapper"
            make_wrapper -files [get_files $bd] -top
            add_files -norecurse ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/$bd_name/hdl/${bd_name}_wrapper.vhd
          } else {
            puts "Info:(ZQ) Use Custom HDL Toplevel File: $ZQ::HDL_PATH/${tl_name}"
          }
          close_bd_design [get_bd_designs $bd]
          #todo: use more bd files -> currently its check on init function only one is allowed
        } 
        update_compile_order -fileset ${ZQ::SOURCE_NAME}
        update_compile_order -fileset ${ZQ::SIM_NAME}      
      }
    }
    # -----------------------------------------
    # --export_blockdesign: export bd designs to clear vivado folder (if folder ${ZQ::BD_PATH}/${ZQ::SHORTDIR} exist it will be export for this boardpart only)
    # --                    create pdf for each bd and sub hierarchy
    proc export_blockdesign {{args ""}} {
    #read args
      set bd_folder ${ZQ::BD_PATH}
      set no_mig ""
      set valid_bd true
      set this_boardpart_only false
      set mod_tcl false
      set args_cnt [llength $args]
      for {set option 0} {$option < $args_cnt} {incr option} {
          switch [lindex $args $option] { 
          "-no_mig_contents"  {set no_mig [lindex $args $option]}
          "-no_validate"		  {set valid_bd false}
          "-mod_tcl"		      {set mod_tcl true}
          "-board_part_only"  {set this_boardpart_only true}
          ""		  {}
            default    { puts "Warning:(ZQ) unrecognised option [lindex $args $option]is ignored" }
          }
      }
      if {$this_boardpart_only} {
        file mkdir ${ZQ::BD_PATH}/${ZQ::SHORTDIR}/
      }
      if {[file exists ${ZQ::BD_PATH}/${ZQ::SHORTDIR}/]} {
        set bd_folder ${ZQ::BD_PATH}/${ZQ::SHORTDIR}/
      }
      #search for open projects
      set bd_open false
      set bd_open_file ""
      set bd_open_name ""
      if {[current_bd_design -quiet] ne ""} {
        #save currend bd configuration
        # validate_bd_design -force
        save_bd_design
        set bd_open true
        set bd_open_name "[current_bd_design]"
        puts "Info:(ZQ) BD-Files $bd_open_name is saved."
        set bd_open_file ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/${bd_open_name}/${bd_open_name}.bd
        # close_bd_design [get_bd_designs $bd_open_file]
      }
      set bd_files []
      if { [catch {set bd_files [glob -join -dir ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/ * *.bd]}] } {
        puts "Warning:(ZQ) No BD-File found."
      }
      if {!$ZQ::BD_MULTI} {
        if {[llength $bd_files]>1 } {
          puts "Warning:(ZQ) Currently only one block design supported, deleted unused bd.tcl from  ${bd_folder}"
        }
      }
      foreach bd $bd_files {
       open_bd_design $bd
       if {$valid_bd} {
        puts "Info:(ZQ) Validate Design."
        validate_bd_design
        } else {
          puts "Info:(ZQ) Design not validated."
        }
      }
      set vivado_bd_design_name []
      if { [catch {set vivado_bd_design_name [get_bd_designs]}] } {
       puts "Warning:(ZQ) No block designs found"
      } else {
        puts "-----------------------------------"
        puts "Info:(ZQ) Following Block designs stored in ${bd_folder}:"
        foreach bd $vivado_bd_design_name {
          set txt "BD_Name: ${bd}"
          # puts "-exclude Layout, IP-Version and MIG-content"
          # write_bd_tcl -force -exclude_layout -no_ip_version -no_mig_contents ${bd_folder}/${bd}_bd.tcl
          set bf_tcl_name ${bd_folder}/${bd}_bd.tcl
          if {$no_mig eq ""} {
            set txt "${txt} - option: No parameter selected"
            write_bd_tcl -force ${bf_tcl_name}
          } else {
            set txt "${txt} - option: Remove MIG-Contents"
            write_bd_tcl -force $no_mig ${bf_tcl_name}
          }
          # modify bd
           if {[catch {ZQ::UTILS::modify_block_design_tcl ${bf_tcl_name} ${mod_tcl}} result]} { puts "Error:(ZQ) Script (ZQ::UTILS::modify_block_design_tcl) failed: $result."; return -code error}
          #export blockdesign as pdf
          #sel doc_path
          set doc_path ${ZQ::DOC_PATH}/
          if {[file exists ${ZQ::BD_PATH}/${ZQ::SHORTDIR}/]} {
            set doc_path ${ZQ::DOC_PATH}/${ZQ::SHORTDIR}/
          }
          file mkdir ${doc_path}/
          #delete old bd_*.pdf
          set old_pdfs []
           if { [catch {set old_pdfs [glob -join -dir ${doc_path}/ bd_*.pdf]}] } {
          } else {
            puts "Info:(ZQ) Delete old BD-PDFs from ${doc_path}"
            foreach old_pdf $old_pdfs {
              if {[catch {file delete -force ${old_pdf}}]} {
                puts "Warning:(ZQ) Could not delete ${old_pdf}"
              }
            }
          }
          set txt "${txt} -option : Write PDF-Layouts."
          set sname bd_${ZQ::VPROJ_NAME}_hier_top.pdf
          if {[catch {write_bd_layout -force -format pdf -scope all -orientation landscape  ${doc_path}/${sname}}]} {
            puts "Warning:(ZQ) Could not write ${doc_path}/${sname}"
          }
          set allsubs [get_bd_cells -filter {TYPE == hier}]
          foreach sub $allsubs {
            set tmp [string map {"/" ""} [join $sub]]
            set sname bd_${ZQ::VPROJ_NAME}_hier_${tmp}.pdf
            if {[catch {write_bd_layout -force -format pdf -hierarchy [get_bd_cells $sub] -orientation landscape  ${doc_path}/${sname}}]} {
              puts "Warning:(ZQ) Could not write ${doc_path}/${sname}"
            }
          }
          # save is needed because print subsystem mod bd file 
          save_bd_design
          #
          if { $bd ne $bd_open_name || !$bd_open} {
            close_bd_design [get_bd_designs ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/${bd}/${bd}.bd]
          }
          puts "Info:(ZQ) $txt"
        }
        puts "-----------------------------------"
      }
    }
    # -----------------------------------------
    # --import_elf: 
    proc import_elf {} {
      if {[file exists $ZQ::FIRMWARE_PATH]} {
        puts "------------------------------------------"
        puts "Info:(ZQ) Import elf-Files:"
        set elf_names [ZQ::UTILS::search_elf_files]
        # set microblaze elf
        foreach elf_f $elf_names {
          add_files -norecurse $elf_f
          set tmp [split $elf_f "/"]
          set tmpLength [llength $tmp]
          if {$tmpLength>2} {
            set elf_file [lindex $tmp [expr $tmpLength-1]]
            set m_name [lindex $tmp [expr $tmpLength-2]]
            set f_obj "*${m_name}/${elf_file}"
            #todo multi bd design
            set bd_files [list]
            if { [catch {set bd_files [glob -join -dir ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/ * *.bd]}] } {
            }
            foreach bd $bd_files {
              set bd_name [file tail [file rootname $bd]]
              set_property SCOPED_TO_REF $bd_name [get_files -all -of_objects [get_fileset sources_1] ${f_obj}]
              #mcs only used if name contains SYSCONTROL or MCS
              if {[string match *SYSCONTROL* $m_name] || [string match *MCS* $m_name]} {
                set_property SCOPED_TO_CELLS "${m_name}/U0/microblaze_I" [get_files -all -of_objects [get_fileset sources_1] ${f_obj}]
              } else {
                set_property SCOPED_TO_CELLS "${m_name}" [get_files -all -of_objects [get_fileset sources_1] ${f_obj}]
              }
            }
          }
        }
      }
    }    
    # -----------------------------------------
    # finished project source functions
    # -----------------------------------------
    # -----------------------------------------
    # project new block design functions
    # -----------------------------------------
    # -----------------------------------------
    # --creat_new_blockdesign: create empty block design with zynq initialisation: fsys,msys,zynq_soc,zusys
    proc create_new_blockdesign {{type fsys} {msys_conf {local_mem "8KB" ecc "None" cache "None" debug_module "Debug Only" axi_periph "Enabled" axi_intc "0" clk "None"}}} {
      #check other bd files exists, currently only one is supported with this function
      set bd_files []
      if { [catch {set bd_files [glob -join -dir ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/ * *.bd]}] } {
        create_bd_design $type
        if {$type eq "fsys"} {
          puts "Info:(ZQ) For fsys Block Design is currently no additional initialisation intended.";
        } elseif {$type eq "zusys"} {
          create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e zynq_ultra_ps_e_0
          apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e -config {apply_board_preset "1" }  [get_bd_cells zynq_ultra_ps_e_0]
          set tcl_ext []
          if { [catch {set tcl_ext [glob -join -dir ${ZQ::BOARDDEF_PATH}/carrier_extension/ *_preset.tcl]}] } {
          }
          foreach carrier_ext $tcl_ext {
            puts "Info:(ZQ) Import carrier_settings from:[file tail $carrier_ext].";
            source  $carrier_ext
          }
        } elseif {$type eq "zynq_soc"} {
          create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7 processing_system7_0
          apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]
          set tcl_ext []
          if { [catch {set tcl_ext [glob -join -dir ${ZQ::BOARDDEF_PATH}/carrier_extension/ *_preset.tcl]}] } {
          }
          foreach carrier_ext $tcl_ext {
            puts "Info:(ZQ) Import carrier_settings from:[file tail $carrier_ext].";
            source  $carrier_ext
          }
        } elseif {$type eq "msys"} {
          create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze microblaze_0
          #set test {local_mem "8KB" ecc "None" cache "None" debug_module "Debug Only" axi_periph "Enabled" axi_intc "0" clk "None"}
          apply_bd_automation -rule xilinx.com:bd_rule:microblaze -config $msys_conf  [get_bd_cells microblaze_0]
        } else { 
          puts "Critical Warning:(ZQ) Unknown Block-Design Type. No Type specific initialisation is done.";
        }
      } else {
        puts "Error:(ZQ) Currently ZQ-Scripts supports only one Block-Design. Generation is cancelled."; return -code error
      }      
    }
    # -----------------------------------------
    # finished new block design functions
    # -----------------------------------------
    # -----------------------------------------
    # project build functions
    # -----------------------------------------
    # -----------------------------------------
    # --build_design: 
    proc build_design {{bitgen true} {mcsgen true} {reportgen true} {hdfgen true}} {
      if {[catch {run_synth} result]} { puts "Error:(ZQ) Script (ZQ::VIV::run_synth) failed: $result."; return -code error}
      if {[catch {run_impl} result]} { puts "Error:(ZQ) Script (ZQ::VIV::run_impl) failed: $result."; return -code error}
      if {$bitgen} {
        if {[catch {write_viv_bitfile} result]} { puts "Error:(ZQ) Script (ZQ::VIV::write_viv_bitfile) failed: $result."; return -code error}
      } else {
        #delete old one if exists
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit]} {
          if {[catch {file delete -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit} result]} {puts "Warning:(ZQ) $result"}
        }
        puts "Warning:(ZQ) Bit-file generation is disabled on build design run."
      }
      if {$mcsgen} {
        if {[catch {write_viv_cfgmem} result]} { puts "Error:(ZQ) Script (ZQ::VIV::write_viv_cfgmem) failed: $result."; return -code error}
      } else {
        #delete old one if exists
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mcs]} {
          if {[catch {file delete -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mcs} result]} {puts "Warning:(ZQ) $result"}
        }
        puts "Warning:(ZQ) MCS-file generation is disabled on build design run."
      }
      if {$reportgen} {
        if {[catch {report_design} result]} { puts "Error:(ZQ) Script (ZQ::VIV::report_design) failed: $result."; return -code error}
      } else {
        #delete old one if exists
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_ip_status_report.txt]} {
          if {[catch {file delete -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_ip_status_report.txt} result]} {puts "Warning:(ZQ) $result"}
        }
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.txt]} {
          if {[catch {file delete -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.txt} result]} {puts "Warning:(ZQ) $result"}
        }
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.csv]} {
          if {[catch {file delete -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.csv} result]} {puts "Warning:(ZQ) $result"}
        }
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.xdc]} {
          if {[catch {file delete -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.xdc} result]} {puts "Warning:(ZQ) $result"}
        }
        puts "Warning:(ZQ) Report-files generation is disabled on build design run."
      }
      if {$hdfgen} {
        #is done automatically with bitgen -> *.sysdef 
      } else {
        #delete old one if exists
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef]} {
          if {[catch {file delete -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef} result]} {puts "Warning:(ZQ) $result"}
        }
        puts "Warning:(ZQ) HDF-files generation is disabled on build design run."
      }
    }
    # -----------------------------------------
    # --run_synth: 
    proc run_synth {} {
      #syntheses
      reset_run $ZQ::SYNTH_NAME
      launch_runs $ZQ::SYNTH_NAME -jobs $ZQ::RUNNING_JOBS
      wait_on_run -timeout $ZQ::TIMEOUT $ZQ::SYNTH_NAME
    }
    # -----------------------------------------
    # --run_impl: 
    proc run_impl {} {
      #implementation and bitgen
      reset_run $ZQ::IMPL_NAME
      # launch_runs $ZQ::IMPL_NAME
      launch_runs $ZQ::IMPL_NAME -to_step route_design -jobs $ZQ::RUNNING_JOBS
      wait_on_run -timeout $ZQ::TIMEOUT $ZQ::IMPL_NAME
    }
   # -----------------------------------------
    # --write_viv_bitfile: 
    proc write_viv_bitfile {} {
      launch_runs $ZQ::IMPL_NAME -to_step write_bitstream -jobs $ZQ::RUNNING_JOBS
      wait_on_run -timeout $ZQ::TIMEOUT $ZQ::IMPL_NAME
    }
    # -----------------------------------------
    # --write_viv_cfgmem: 
    proc write_viv_cfgmem {} {
      #used only if bd name is no zynq design (without processor system)!
      if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mcs]} { file delete -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mcs }
      if {!$ZQ::IS_zynq_soc && !$ZQ::IS_ZUSYS} {
        if {$ZQ::CFGMEM_MEMSIZE_MB ne "NA"} {
          #check supported from *board_files.csv
          #write mcs with *board_files.csv settings
          if {[catch { write_cfgmem -force -format mcs -interface $ZQ::CFGMEM_IF -size $ZQ::CFGMEM_MEMSIZE_MB \
                                    -loadbit "up 0x0 ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit" \
                                    -file ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mcs\
          }]} {
          #if failed try SPIX1 (default ) (faster than open design)
            puts "Info:(ZQ) Generate MCS failed with $ZQ::CFGMEM_IF from *board_files.csv specification, try to generate SPIx1."
            if {[catch { write_cfgmem -force -format mcs -interface SPIX1 -size $ZQ::CFGMEM_MEMSIZE_MB \
                                      -loadbit "up 0x0 ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit" \
                                      -file ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mcs\
            }]} {
              #if failed get propery from design (needs some time) 
              puts "Info:(ZQ) Generate MCS failed with SPIx1, try to get information from implemented Design."
              open_run $ZQ::IMPL_NAME
              set tmp_cfgmem_if "SPIx[get_property BITSTREAM.CONFIG.SPI_BUSWIDTH [current_design]]"
              close_design
              write_cfgmem -force -format mcs -interface $tmp_cfgmem_if -size $ZQ::CFGMEM_MEMSIZE_MB \
                           -loadbit "up 0x0 ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit" \
                           -file ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mcs
              puts "Info:(ZQ) Generate MCS with  $tmp_cfgmem_if from current design setting (BITSTREAM.CONFIG.SPI_BUSWIDTH), but current Board Part supports $ZQ::CFGMEM_IF"
            } else {
              puts "Info:(ZQ) Generate MCS with  SPIX1 (BITSTREAM.CONFIG.SPI_BUSWIDTH 1) from Bitfile, but current Board Part supports $ZQ::CFGMEM_IF too!"
            }
          }
        } else {
          puts "Warning:(ZQ) FPGAFLASHTYP Mem Size in MB is not specified in *.board_files.csv. *.mcs file is not generated."
        }
      }
    }
    # -----------------------------------------
    # finished built functions
    # -----------------------------------------
    # -----------------------------------------
    # report functions (todo to utilities)
    # -----------------------------------------
    # -----------------------------------------
    # --report_design: 
    proc report_design {} {
      # -------------check toplevel name (if modified)
      if { ![string equal $ZQ::PR_TOPLEVELNAME [get_property top  [current_fileset]]] } {
        puts "Warning:(ZQ) Top Level Name ([get_property top  [current_fileset]]) is not same then exspected from BD-File delivery ($ZQ::PR_TOPLEVELNAME)"
        puts "Info:(ZQ) [get_property top  [current_fileset]] is used in Script settings now."
        set ZQ::PR_TOPLEVELNAME [get_property top  [current_fileset]]
      }  
      # -------------block design reports
      # -------------synthese reports
      # -------------implement reports
      open_run $ZQ::IMPL_NAME
      #todo:
      # report_debug_core -file ${ZQ::VPROJ_NAME}_debug_cores.txt
      report_ip_status -file ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_ip_status_report.txt
      report_io -force -file ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.txt -format text
      write_csv -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.csv
      write_xdc -force -mode port ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.xdc
      report_summary
      close_design
    }
    # -----------------------------------------
    # --report_run: 
    proc report_run {} {
      #todo eventuell auftrennen und dann noch report schreiben, wenn nicht alles durch geht
      set date "[ clock format [clock seconds] -format "%Y-%m-%dT%H:%M:%S"]"
      set status "Error"
      set founderror -1
      #synth
      set sythn_counts [extract_synth_summary]
      set sythn_counts_split [split $sythn_counts ","]
      set value [lindex $sythn_counts_split [expr [llength $sythn_counts_split]-1]]
      if {$value != 0} {set founderror 1}
      #impl
      set impl_counts [extract_impl_summary]
      set impl_counts_split [split $impl_counts ","]
      set value [lindex $impl_counts_split [expr [llength $impl_counts_split]-1]]
      if {$value != 0} {set founderror 1}
      #drc
      set drc_counts [extract_drc_summary]
      set drc_counts_split [split $drc_counts ","]
      set value [lindex $drc_counts_split [expr [llength $drc_counts_split]-1]]
      if {$value != 0} {set founderror 1}
      #timing
      set timing_counts [extract_timing_summary]
      set timing_counts_split [split $timing_counts ","]
      set value [lindex $timing_counts_split [expr [llength $timing_counts_split]-1]]
      if {[string compare "NA" $value ]==0} {set founderror 0} elseif {$value != 0} {set founderror 1}
      if {$founderror == -1} {set status "Ok"} elseif {$founderror == 0} {set status "Ok(NA)"}
      #write report
      set report "[format "%-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s," "$date" "$status" "$ZQ::VPROJ_NAME" "$ZQ::SHORTDIR" "$ZQ::BOARDPART" "$ZQ::SYNTH_NAME" "$ZQ::IMPL_NAME" "[lindex $sythn_counts_split 0]" "[lindex $sythn_counts_split 1]" "[lindex $sythn_counts_split 2]" "[lindex $sythn_counts_split 3]" "[lindex $impl_counts_split 0]" "[lindex $impl_counts_split 1]" "[lindex $impl_counts_split 2]" "[lindex $impl_counts_split 3]" "[lindex $drc_counts_split 0]" "[lindex $drc_counts_split 1]"  "[lindex $timing_counts_split 0]" "[lindex $timing_counts_split 1]" "[lindex $timing_counts_split 2]"]"
      return $report
    }
    # -----------------------------------------
    # --report_summary: 
    proc report_summary {} {
      set fp_w [open ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}_summary.csv "w"]
      #write header
      puts $fp_w [format "%-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s, %-40s," "Date" "Status" "ProjName" "BoardDefShortName" "BoardDefName" "SynthName" "ImplName" "SynthInfo" "SynthWarnings" "SynthCritWarnings" "SynthError" "ImplInfo" "ImplWarnings" "ImplCritWarnings" "ImplError" "ImplDRCWarnings" "ImplDRCError" "ImplTimingWNS" "ImplTimingFaildEndpoints" "ImplTimingTNS"]
      puts $fp_w [report_run]
      close $fp_w
    }    
    # -----------------------------------------
    # --extract_synth_summary: 
    proc extract_synth_summary {} {
      set synth_returns "0,0,0,FileNotFound" 
      set report_file ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::SYNTH_NAME}/${ZQ::PR_TOPLEVELNAME}.vds
      if { ![file exists ${report_file}]} {return $synth_returns}
      set fp_r [open ${report_file} "r"]
      set file_data [read $fp_r]
      set data [split $file_data "\n"]
      close $fp_r
      foreach line $data {
        if {[string match "*Infos*Warnings*Critical Warnings*Errors encountered*" $line]} {
          set tmp [string map {"and" "," " " "" "Infos" "" "Warnings" "" "Critical" "" "Errors" "" "encountered." ""} "$line"]
          #use only last log output
          #return Infos, Warnings, Critical Warnings , Errors
          set synth_returns $tmp
        }
      }
      return $synth_returns
    }   
    # -----------------------------------------
    # --extract_impl_summary: 
    proc extract_impl_summary {} {
      set impl_returns "0,0,0,FileNotFound"
      set report_file ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.vdi
      if { ![file exists ${report_file}]} {return $impl_returns}
      set fp_r [open ${report_file} "r"]
      set file_data [read $fp_r]
      set data [split $file_data "\n"]
      close $fp_r
      foreach line $data {
        if {[string match "*Infos*Warnings*Critical Warnings*Errors encountered*" $line]} {
          set tmp [string map {"and" "," " " "" "Infos" "" "Warnings" "" "Critical" "" "Errors" "" "encountered." ""} "$line"]
          #use only last log output
          #return Infos, Warnings, Critical Warnings , Errors
          set impl_returns $tmp
        }
      }
      return $impl_returns
    }  
    # -----------------------------------------
    # --extract_drc_summary: 
    proc extract_drc_summary {} {
      set drc_returns "0,FileNotFound"
      set report_file ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.vdi
      if { ![file exists ${report_file}]} {return $drc_returns}
      set fp_r [open ${report_file} "r"]
      set file_data [read $fp_r]
      set data [split $file_data "\n"]
      close $fp_r
      set err_count 0
      set warn_count 0
      foreach line $data {
        if {[string match "*DRC finished with*" $line]} {
          set index [string first "with" $line 0]
          set tmp [string range $line $index [string length $line]]
          set tmp [string map {" " "" "with" "" "Errors" "" "Warnings" "" "Advisories" ""} "$tmp"]
          set tmp [split $tmp ","]
          if {[llength $tmp]==1} {
            if {[string is integer [lindex $tmp 0]]} {
              set err_count [expr $err_count + [lindex $tmp 0]]
            } else {
              set err_count 999999
            }
          } else {
            if {[string is integer [lindex $tmp 0]]} {
              set err_count [expr $err_count + [lindex $tmp 0]]
            } else {
              set err_count 999999
            }
            if {[string is integer [lindex $tmp 1]]} {
              set warn_count [expr $warn_count + [lindex $tmp 1]]
            } else {
              set warn_count 999999
            }
          }
        }
      }
      #return Warnings, Errors
      set drc_returns "$warn_count, $err_count"
      return $drc_returns
    }  
    # -----------------------------------------
    # --extract_timing_summary:
    proc extract_timing_summary {} {
      set timing_returns "0,0,FileNotFound"
      set report_file ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}_timing_summary_routed.rpt
      if { ![file exists ${report_file}]} {return $timing_returns}
      set fp_r [open ${report_file} "r"]
      set file_data [read $fp_r]
      set data [split $file_data "\n"]
      close $fp_r
      set lineindex -1
      foreach line $data {
        incr lineindex
        if {[string match "*Design Timing Summary*" $line]} {
          break;
        }
      }
      set lineindex [expr $lineindex +6]
      set tmp [join [lindex $data $lineindex] " "]
      set timing_returns "[lindex $tmp 0],[lindex $tmp 2],[lindex $tmp 1]"
      #return WNS, Faild Endpoints, TNS
      return $timing_returns
    }
    # -----------------------------------------
    # finished report functions
    # -----------------------------------------
  # -----------------------------------------
  }
  # -----------------------------------------
  # -----------------------------------------
  # -----------------------------------------
  # -----------------------------------------
  namespace eval VLAB {
   # -----------------------------------------
    # vlab project functions
    # -----------------------------------------
    # -----------------------------------------
    # --create_project: 
    proc create_project {} {
      #create vivado lab project 
      ::create_project -force $ZQ::VPROJ_NAME $ZQ::VLABPROJ_PATH 
      #set props..
    }
    # -----------------------------------------
    # --open_project: 
    proc open_project {} {
      #open vivado lab project
      ::open_project ${ZQ::VPROJ_NAME}.lpr
    }    
    # -----------------------------------------
    # --close_project: 
    proc close_project {} {
      #close vivado project
      ::close_project
    }
    # -----------------------------------------
    # --hw_open_jtag: 
    proc hw_open_jtag {} {
      #start new session
      ::open_hw
      if {[current_hw_server -quiet] eq ""} {
        ::connect_hw_server
      }
      if {[current_hw_device -quiet] eq ""} {
      ::open_hw_target
        return true
      } else {
        return false
      }
    }
    # -----------------------------------------
    # --hw_close_jtag: 
    proc hw_close_jtag {} {
      ::close_hw
    }
    # -----------------------------------------
    # finished vlab project functions
    # -----------------------------------------
    # -----------------------------------------
    # device functions
    # -----------------------------------------
    # -----------------------------------------
    # --hw_create_flash_device: 
    proc hw_create_flash_device {{fname ""}} {
      #todo configs auswählbar
      set partname_int ""
      set flashtyp_int ""
      if {$fname ne ""} {
        set partname_int "[ZQ::BDEF::find_partname $fname]"
        set id "[ZQ::BDEF::find_id $fname]"
        set tmp [ZQ::BDEF::get_fpgaflashtyp $id 0]
        set tmp [split $tmp "|"]
        if {[llength $tmp] eq 3} {
          set flashtyp_int [lindex $tmp 0]
        } else {
          set flashtyp_int $tmp
        }
      } else {
        set partname_int $ZQ::PARTNAME
        set flashtyp_int $ZQ::FPGAFLASHTYP
      }
      set hw_fpga_name [hw_get_fpga $partname_int]
      set_property PROBES.FILE "" $hw_fpga_name
      #reset old propefiles
      create_hw_cfgmem -hw_device  $hw_fpga_name -mem_dev  [lindex [get_cfgmem_parts ${flashtyp_int}] 0]
      set_property PROGRAM.BLANK_CHECK  0 [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]
      set_property PROGRAM.ERASE  1 [ get_property PROGRAM.HW_CFGMEM  $hw_fpga_name]
      set_property PROGRAM.CFG_PROGRAM  1 [ get_property PROGRAM.HW_CFGMEM  $hw_fpga_name]
      set_property PROGRAM.VERIFY  0 [ get_property PROGRAM.HW_CFGMEM  $hw_fpga_name]
      set_property PROGRAM.CHECKSUM  0 [ get_property PROGRAM.HW_CFGMEM  $hw_fpga_name]
      if {[catch {refresh_hw_device $hw_fpga_name}] } {}
    }   
    # -----------------------------------------
    # --hw_get_fpga: 
    proc hw_get_fpga {{partname ""}} {
      set partname_int $partname
      if {$partname_int eq ""} {set partname_int $ZQ::PARTNAME}
      set hw_fpga_name NA
      set hw_fpga_found false
      foreach hwd [get_hw_devices] {
        set name [lindex [split $hwd "_"] 0]
        set hw_fpga_found [string match *$name* $partname_int]
        if {$hw_fpga_found} {set hw_fpga_name $hwd}
      }
      if {$hw_fpga_found} {
        # ::refresh_hw_device $hw_fpga_name
      } else {
        # change compared name from automotive and defense grade fpga (same hw-id than commercial)
        set alt_partname [string map {xa xc xq xc} $partname_int] 
        foreach hwd [get_hw_devices] {
          set name [lindex [split $hwd "_"] 0]
          set hw_fpga_found [string match *$name* $alt_partname]
          if {$hw_fpga_found} {set hw_fpga_name $hwd}
        }
        if {$hw_fpga_found} {
          # ::refresh_hw_device $hw_fpga_name
        } else {
          puts "Warning:(ZQ) $partname_int Devive not found."
          foreach hwd [get_hw_devices] {
            set name [lindex [split $hwd "_"] 0]
            puts "$partname_int and $alt_partname compare with *$name* faild."
          }
        }
      }
      return $hw_fpga_name
    }
    # -----------------------------------------
    # --hw_fpga_boot_from_memory: 
    proc hw_fpga_boot_from_memory {{fname ""}} {
      set partname_int ""
      if {$fname ne ""} {
        set partname_int "[ZQ::BDEF::find_partname $fname]"
      } else {
        set partname_int $ZQ::PARTNAME
      }
      set hw_fpga_name [hw_get_fpga $partname_int]
      if {$hw_fpga_name ne "NA"} {
        ::boot_hw_device $hw_fpga_name 
        puts "Info(ZQ): Reboot Device is done."
        ::refresh_hw_device $hw_fpga_name
        puts "Info:(ZQ) Refresh Device is done."
      } else {
        puts "Error:(ZQ) Boot From Memory faild. Device not found."
      }
    }   
    # -----------------------------------------
    # finished device functions
    # -----------------------------------------
    # -----------------------------------------
    # property functions
    # ----------------------------------------- 
    # -----------------------------------------
    # --hw_set_bit_and_ltx_files: setup for bitfile configuration via labtools/vivado   
    proc hw_set_bit_and_ltx_files {use_basefolder app_name {fname ""}} {
      set return_filename ""
      set partname_int ""
      set shortdir_int ""
      if {$fname ne ""} {
        set partname_int "[ZQ::BDEF::find_partname $fname]"
        set shortdir_int "[ZQ::BDEF::find_shortdir $fname]"
      } else {
        set partname_int $ZQ::PARTNAME
        set shortdir_int $ZQ::SHORTDIR
      }
      set hw_fpga_name [hw_get_fpga $partname_int]
      if {$hw_fpga_name ne "NA"} {
        if {$use_basefolder} {
          set bitfilename ""
          if { ![catch {set bitfilename [glob -join -dir ${ZQ::BASEFOLDER}/ *.bit]}] } {
            puts "Info:(ZQ) Used file:${bitfilename}"
            set return_filename  ${bitfilename}
            set_property PROGRAM.FILE ${bitfilename} $hw_fpga_name
          } else {
              puts "Warning:(ZQ) No no Bitfile found in ${ZQ::BASEFOLDER}. Nothings done."
              return -code error
          }
        } else {
          if {$app_name eq "" || $app_name eq "NA"} {
            if {[file exists ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.bit]} {
              #use bitfile from hardware folder (with bootloop for microblaze systems)
              set_property PROGRAM.FILE ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.bit $hw_fpga_name
              if {[file exists ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx]} {
                set_property PROBES.FILE ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx $hw_fpga_name
              } else {
                puts "Info:(ZQ) No PROBES file (${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx) found." 
                set_property PROBES.FILE "" $hw_fpga_name
              }
              puts "Info:(ZQ) Used file:${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.bit"
              set return_filename  ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.bit
            } else {
              #use default bit from hardware folder (with bootloop for microblaze systems)
              if {[file exists ${ZQ::PREBUILT_HW_PATH}/default/${ZQ::VPROJ_NAME}.bit]} {
                set_property PROGRAM.FILE ${ZQ::PREBUILT_HW_PATH}/default/${ZQ::VPROJ_NAME}.bit $hw_fpga_name
                if {[file exists ${ZQ::PREBUILT_HW_PATH}/default/${ZQ::VPROJ_NAME}/${ZQ::VPROJ_NAME}.ltx]} {
                  set_property PROBES.FILE ${ZQ::PREBUILT_HW_PATH}/default/${ZQ::VPROJ_NAME}.ltx $hw_fpga_name
                } else {
                  puts "Info:(ZQ) No PROBES file (${ZQ::PREBUILT_HW_PATH}/default/${ZQ::VPROJ_NAME}.ltx) found." 
                  set_property PROBES.FILE "" $hw_fpga_name
                }
                puts "Info:(ZQ) Used file:${ZQ::PREBUILT_HW_PATH}/default/${ZQ::VPROJ_NAME}.bit"
                set return_filename  ${ZQ::PREBUILT_HW_PATH}/default/${ZQ::VPROJ_NAME}.bit
              } else {
                puts "Warning:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.bit not found. Nothings done."
                return -code error
              }
            }
          } else {
            #use bitfile from bootimage folder (with programmed apps for microblaze systems)
            set bitfilename ""
            if { ![catch {set bitfilename [glob -join -dir ${ZQ::PREBUILT_BI_PATH}/${shortdir_int}/${app_name}/ *.bit]}] } {
              set_property PROGRAM.FILE ${bitfilename} $hw_fpga_name
              #search in hardware folder for ltx
              if {[file exists ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx]} {
                set_property PROBES.FILE ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx $hw_fpga_name
              } else {
                puts "Info:(ZQ) No PROBES file (${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx) found." 
                set_property PROBES.FILE "" $hw_fpga_name
              }
              puts "Info:(ZQ) Used file:${bitfilename}"
              set return_filename  ${bitfilename}
            } else {
              puts "Warning:(ZQ) ${ZQ::PREBUILT_BI_PATH}/${shortdir_int}/${app_name}/*.bit not found. Nothings done."
              return -code error
            }
          }
        }
      } else {
        puts "Error:(ZQ) Program FPGA faild. Device not found."
        return -code error
      }
      return $return_filename
    }
    # -----------------------------------------
    # --hw_set_bin_and_ltx_files: setup for binfile configuration via labtools/vivado   
    proc hw_set_bin_and_ltx_files {use_basefolder app_name fname} {
      set return_filename ""
      set partname_int ""
      set shortdir_int ""
      if {$fname ne ""} {
        set partname_int "[ZQ::BDEF::find_partname $fname]"
        set shortdir_int "[ZQ::BDEF::find_shortdir $fname]"
      } else {
        set partname_int $ZQ::PARTNAME
        set shortdir_int $ZQ::SHORTDIR
      }
      set hw_fpga_name [hw_get_fpga $partname_int]
      if {$hw_fpga_name ne "NA"} {
        if {$use_basefolder} {
          set binfilename ""
          set ltxfilename ""
          if { ![catch {set binfilename [glob -join -dir ${ZQ::BASEFOLDER}/ *.bin]}] } {
            puts "Info:(ZQ) Used file:${binfilename}"
            set return_filename  ${binfilename}
            set_property PROGRAM.ADDRESS_RANGE  {use_file} [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]
            set_property PROGRAM.FILES [list "${binfilename}" ] [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]              
            if { ![catch {set ltxfilename [glob -join -dir ${ZQ::BASEFOLDER}/ *.ltx]}] } {
              set_property PROBES.FILE ${ltxfilename} $hw_fpga_name
            } else {
              set_property PROBES.FILE "" $hw_fpga_name
            }
          } else {
              puts "Warning:(ZQ) No no Binfile found in ${ZQ::BASEFOLDER}. Nothings done."
              return -code error
          }
        } else {
          set binfilename ""
          if { ![catch {set binfilename [glob -join -dir ${ZQ::PREBUILT_BI_PATH}/${shortdir_int}/${app_name}/ *.bin]}] } {
            set_property PROGRAM.ADDRESS_RANGE  {use_file} [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]
            set_property PROGRAM.FILES [list "${binfilename}" ] [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]              
            if {[file exists ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx]} {
              set_property PROBES.FILE ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx $hw_fpga_name
            } else {
              puts "Info:(ZQ) No PROBES file (${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx) found." 
              set_property PROBES.FILE "" $hw_fpga_name
            }
            puts "Info:(ZQ) Used files :${binfilename}"
            set return_filename  ${binfilename}
          } else {
            puts "Warning:(ZQ) ${ZQ::PREBUILT_BI_PATH}/${shortdir_int}/${app_name}/*.bin not found. Nothings done."
            return -code error
          }
        }
      } else {
        puts "Error:(ZQ) Program FPGA faild. Device not found."
        return -code error
      }
      return $return_filename
    }
    # -----------------------------------------
    # --hw_set_mcs_and_ltx_files: setup for mcsfile configuration via labtools/vivado   
    proc hw_set_mcs_and_ltx_files {use_basefolder term app_name fname} {
      set return_filename ""
      set partname_int ""
      set shortdir_int ""
      if {$fname ne ""} {
        set partname_int "[ZQ::BDEF::find_partname $fname]"
        set shortdir_int "[ZQ::BDEF::find_shortdir $fname]"
      } else {
        set partname_int $ZQ::PARTNAME
        set shortdir_int $ZQ::SHORTDIR
      }
      set hw_fpga_name [hw_get_fpga $partname_int]
      if {$hw_fpga_name ne "NA"} {
        if {$use_basefolder} {
          set mcsfilename ""
          set ltxfilename ""
          if { ![catch {set mcsfilename [glob -join -dir ${ZQ::BASEFOLDER}/ *.mcs]}] } {
            puts "Info:(ZQ) Used file:${mcsfilename}"
            set return_filename  ${mcsfilename}
            set_property PROGRAM.ADDRESS_RANGE  {use_file} [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]
            set_property PROGRAM.FILES [list "${mcsfilename}" ] [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]         
            set_property PROGRAM.UNUSED_PIN_TERMINATION ${term} [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]                
            if { ![catch {set ltxfilename [glob -join -dir ${ZQ::BASEFOLDER}/ *.ltx]}] } {
              set_property PROBES.FILE ${ltxfilename} $hw_fpga_name
            } else {
              set_property PROBES.FILE "" $hw_fpga_name
            }
          } else {
            puts "Warning:(ZQ) No no MCSfile found in ${ZQ::BASEFOLDER}. Nothings done."
            return -code error
          }
        } else {
          if {$app_name eq "" || $app_name eq "NA"} {
            #use mcs from hardware folder (with bootloop for microblaze systems)
            if {[file exists ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.mcs]} {
              set_property PROGRAM.ADDRESS_RANGE  {use_file} [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]
              set_property PROGRAM.FILES [list "${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.mcs" ] [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]   
              set_property PROGRAM.UNUSED_PIN_TERMINATION ${term} [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]          
              if {[file exists ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx]} {
                set_property PROBES.FILE ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx $hw_fpga_name
              } else {
                puts "Info:(ZQ) No PROBES file (${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx) found." 
                set_property PROBES.FILE "" $hw_fpga_name
              }
              puts "Info:(ZQ) Used files:${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.mcs"
              set return_filename  ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.mcs
            } else {
              puts "Warning:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.mcs not found. Nothings done."
              return -code error
            }
          } else {
            #use mcs from bootimage folder (with configured app for microblaze systems)
            set mcsfilename ""
            if { ![catch {set mcsfilename [glob -join -dir ${ZQ::PREBUILT_BI_PATH}/${shortdir_int}/${app_name}/ *.mcs]}] } {
              set_property PROGRAM.ADDRESS_RANGE  {use_file} [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]
              set_property PROGRAM.FILES [list "${mcsfilename}" ] [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]   
              set_property PROGRAM.UNUSED_PIN_TERMINATION ${term} [ get_property PROGRAM.HW_CFGMEM $hw_fpga_name]     
              #search ltx from hardware folder
              if {[file exists ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx]} {
                set_property PROBES.FILE ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx $hw_fpga_name
              } else {
                puts "Info:(ZQ) No PROBES file (${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx) found." 
                set_property PROBES.FILE "" $hw_fpga_name
              }
              puts "Info:(ZQ) Used files:${mcsfilename}"
              set return_filename  ${mcsfilename}
            } else {
              puts "Warning:(ZQ) ${ZQ::PREBUILT_BI_PATH}/${shortdir_int}/${app_name}/*.mcs not found. Nothings done."
              return -code error
            }
          }
        }
      } else {
        puts "Error:(ZQ) Program FPGA faild. Device not found."
        return -code error
      }
      return $return_filename
    }
    # -----------------------------------------
    # --hw_reload_prope_file_device: 
    proc hw_reload_prope_file_device {{fname ""}} {
      set partname_int ""
      set shortdir_int ""
      if {$fname ne ""} {
        set partname_int "[ZQ::BDEF::find_partname $fname]"
        set shortdir_int "[ZQ::BDEF::find_shortdir $fname]"
      } else {
        set partname_int $ZQ::PARTNAME
        set shortdir_int $ZQ::SHORTDIR
      }
      set hw_fpga_name [hw_get_fpga $partname_int]
      if {[file exists ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx]} {
        set_property PROBES.FILE ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx $hw_fpga_name
        puts "Info:(ZQ) New Propefile is set: ${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx"
      } else {
        puts "Info:(ZQ) No PROBES file (${ZQ::PREBUILT_HW_PATH}/${shortdir_int}/${ZQ::VPROJ_NAME}.ltx) found." 
        set_property PROBES.FILE "" $hw_fpga_name
      }
    }  
    # -----------------------------------------
    # finished property functions
    # -----------------------------------------
    # -----------------------------------------
    # programming functions
    # -----------------------------------------
    # -----------------------------------------
    # --hw_program_fpga_device: 
    proc hw_program_fpga_device { use_basefolder appname {fname ""}} {
      #bitfile
      set return_filename ""
      set partname_int ""
      if {$fname ne ""} {
        set partname_int "[ZQ::BDEF::find_partname $fname]"
      } else {
        set partname_int $ZQ::PARTNAME
      }
      set hw_fpga_name [hw_get_fpga $partname_int]
      if {![catch {set return_filename [hw_set_bit_and_ltx_files $use_basefolder $appname $fname]}] } {
        program_hw_devices $hw_fpga_name
        puts "Info:(ZQ) Programming Bitfile finished"
        if {[catch {refresh_hw_device $hw_fpga_name}] } {}
      } else {
        puts "Error:(ZQ) Program FPGA faild."
        return -code error
      }
      return $return_filename
    }   
    # -----------------------------------------
    # --hw_program_fpga_flash: 
    proc hw_program_fpga_flash {use_basefolder term bin appname {fname ""}} {
      set return_filename ""
      set partname_int ""
      if {$fname ne ""} {
        set partname_int "[ZQ::BDEF::find_partname $fname]"
      } else {
        set partname_int $ZQ::PARTNAME
      }
      set hw_fpga_name [hw_get_fpga $partname_int]
      if {$bin eq "bin"} {
        #program bin file
        if {![catch {set return_filename [hw_set_bin_and_ltx_files $use_basefolder $appname $fname]}] } {
          program_hw_cfgmem -hw_cfgmem [get_property PROGRAM.HW_CFGMEM $hw_fpga_name]
          puts "Info:(ZQ) Programming Binfile finished"
          if {[catch {refresh_hw_device $hw_fpga_name}] } {}
        } else {
          puts "Error:(ZQ) Program Flash faild."
          return -code error
        }
      } else {
        #program mcs file
        if {![catch {set return_filename [hw_set_mcs_and_ltx_files $use_basefolder $term $appname $fname]}] } {
          if {![string equal [get_property PROGRAM.HW_CFGMEM_TYPE  $hw_fpga_name] [get_property MEM_TYPE [get_property CFGMEM_PART [get_property PROGRAM.HW_CFGMEM $hw_fpga_name]]]] }  { create_hw_bitstream -hw_device $hw_fpga_name [get_property PROGRAM.HW_CFGMEM_BITFILE $hw_fpga_name]; program_hw_devices $hw_fpga_name; }; 
          program_hw_cfgmem -hw_cfgmem [get_property PROGRAM.HW_CFGMEM $hw_fpga_name]
          puts "Info:(ZQ) Programming Mcsfile finished"
          if {[catch {refresh_hw_device $hw_fpga_name}] } {}
        } else {
          puts "Error:(ZQ) Program Flash faild."
          return -code error
        }
      }
      return $return_filename
    }
    # -----------------------------------------
    # finished programming functions
    # -----------------------------------------
  # -----------------------------------------
  }
  puts "Info:(ZQ) Load Vivado script finished"
}
