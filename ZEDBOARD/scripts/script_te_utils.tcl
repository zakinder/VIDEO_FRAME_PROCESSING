namespace eval ZQ {
  namespace eval UTILS {
    # -----------------------------------------
    # search source files functions
    # -----------------------------------------
    # -----------------------------------------
    # --search_bd_files: search in ZQ::BD_PATH for *.tcl files return list
    proc search_bd_files {} {
      # search for block design for the board part only  (folder with tcl must exist, otherwise base BD_Path is used!)
      #currently only on bd.tcl is allowed
      set bd_files []
      if { [catch {set bd_files [glob -join -dir ${ZQ::BD_PATH}/${ZQ::SHORTDIR} *.tcl]}] } {
        if { [catch {set bd_files [glob -join -dir ${ZQ::BD_PATH}/ *.tcl]}] } {
          if { [catch {set bd_files [glob -join -dir ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.srcs/${ZQ::SOURCE_NAME}/bd/ * *.bd]}] } {
            puts "Warning:(ZQ) No Block-Design was found in ${ZQ::BD_PATH}, start vivado without bd-design"
          } else {
            puts "Warning:(ZQ) Found no Block-Design Backup file, use current Vivado Project Block-Designs (*.bd)."
          }
        } 
      }
      puts "-----------------------------------"
      puts "Info:(ZQ) Following Block designs are found:"
      foreach bd $bd_files {
        puts $bd
      }
      puts "-----------------------------------"
      if {!$ZQ::BD_MULTI} {
        if {[llength $bd_files]>1 } {
            return -code error "Error:(ZQ) Currently only one block design supported with this scripts, deleted or rename file-extention from unused *.tcl in ${ZQ::BD_PATH} or ${ZQ::BD_PATH}/${ZQ::SHORTDIR}."
        }
      }
      return $bd_files
    }
    # -----------------------------------------
    # --search_xdc_files: search in ZQ::XDC_PATH for *xdc files return list
    proc search_xdc_files {} {
      # search for xdc file if bord part folder exist, this used too
      set xdc_files []
      set base_xdc_files []
      set bp_xdc_files []
      if { [catch {set base_xdc_files [ glob $ZQ::XDC_PATH/*.xdc ] }] } {
        puts "Warning:(ZQ) No *.xdc files found in ${ZQ::XDC_PATH}/"
      }
      if {[file exists ${ZQ::XDC_PATH}/${ZQ::SHORTDIR}/]} {
        if { [catch {set bp_xdc_files [ glob $ZQ::XDC_PATH/${ZQ::SHORTDIR}/*.xdc ] }] } {
          puts "Warning:(ZQ) No *.xdc files found in ${ZQ::XDC_PATH}/${ZQ::SHORTDIR}/"
        }
        #generate empty target xdc for gui constrains
        if { ![file exists ${ZQ::XDC_PATH}/${ZQ::SHORTDIR}/target_pins.xdc]} {
          puts "Info:(ZQ) Generate target_pins.xdc files in ${ZQ::XDC_PATH}/${ZQ::SHORTDIR}/"
          close [ open ${ZQ::XDC_PATH}/${ZQ::SHORTDIR}/target_pins.xdc w ]
          lappend bp_xdc_files ${ZQ::XDC_PATH}/${ZQ::SHORTDIR}/target_pins.xdc
        }
        set xdc_files [concat $base_xdc_files $bp_xdc_files]
      } else {
        set xdc_files $base_xdc_files
        #generate empty target xdc for gui constrains
        if { ![file exists ${ZQ::XDC_PATH}/target_pins.xdc]} {
          puts "Info:(ZQ) Generate target_pins.xdc files in ${ZQ::XDC_PATH}/"
          close [ open ${ZQ::XDC_PATH}/target_pins.xdc w ]
          lappend xdc_files ${ZQ::XDC_PATH}/target_pins.xdc
        }
      }
      puts "-----------------------------------"
      puts "Info:(ZQ) Following XDC Files are found:"
      foreach xdc $xdc_files {
        puts $xdc
      }
      puts "-----------------------------------"
      return $xdc_files
    }
    # -----------------------------------------
    # --search_xci_files: search in ZQ::HDL_PATH for *.xci files return list
    proc search_xci_files {} {
      set xci_files [list]
      set xci_files_main [list]
      set xci_files_sub [list]
      catch {set xci_files_main [glob -join -dir $ZQ::HDL_PATH/xci/ *.xci]}
      catch {set xci_files_sub [glob -join -dir $ZQ::HDL_PATH/xci/${ZQ::SHORTDIR}/ *.xci]}
      set xci_files [concat $xci_files_main $xci_files_sub]
      puts "-----------------------------------"
      puts "Info:(ZQ) Following XCI designs are found:"
      foreach xci_f $xci_files {
        puts $xci_f
      }
      puts "-----------------------------------"
      return $xci_files
    }
    # -----------------------------------------
    # --search_elf_files: search in ZQ::FIRMWARE_PATH for *.elf files return list
    proc search_elf_files {} {
      set elf_files_sub [list]
      catch {set elf_files_sub [glob -join -dir ${ZQ::FIRMWARE_PATH} */*.elf]}
      puts "-----------------------------------"
      puts "Info:(ZQ) Following elf files are found:"
      foreach elf_f $elf_files_sub {
        puts $elf_f
      }
      puts "-----------------------------------"
      return $elf_files_sub
    }
    # -----------------------------------------
    # --search_hdl_files: search in ZQ::HDL_PATH for *.vhd and *.v files return list
    proc search_hdl_files {} {
      set hdl_files [list]
      set vhd_files [list]
      set vhd_files_sub [list]
      set v_files [list]
      set v_files_sub [list]
      set sv_files [list]
      set sv_files_sub [list]
      catch {set vhd_files [glob -join -dir ${ZQ::HDL_PATH} *.vhd]}
      catch {set vhd_files_sub [glob -join -dir ${ZQ::HDL_PATH} */*.vhd]}
      catch {set v_files [glob -join -dir ${ZQ::HDL_PATH} *.v]}
      catch {set v_files_sub [glob -join -dir ${ZQ::HDL_PATH} */*.v]}
      catch {set sv_files [glob -join -dir ${ZQ::HDL_PATH} *.sv]}
      catch {set sv_files_sub [glob -join -dir ${ZQ::HDL_PATH} */*.sv]}
      set hdl_files [concat $vhd_files $vhd_files_sub $v_files $v_files_sub $sv_files $sv_files_sub]
      puts "-----------------------------------"
      puts "Info:(ZQ) Following HDL designs are found:"
      foreach hdl_f $hdl_files {
        puts $hdl_f
      }
      puts "-----------------------------------"
      return $hdl_files
    }
    # -----------------------------------------
    # finished search source files functions
    # -----------------------------------------
    # -----------------------------------------
    # modify block design functions
    # -----------------------------------------
    # -----------------------------------------
    # --modify_block_design_tcl:
    proc setinfo_to_block_design_tcl {datalist mod_file} {
      set data $datalist
      if {$mod_file} {
        set data [linsert $data[set data {}] 0 "puts \"Info:(ZQ) This block design file has been modified. Modifications labelled with comment tag  # #TE_MOD# on the Block-Design tcl-file.\""]
      }
      set data [linsert $data[set data {}] 0 "puts \"Info:(ZQ) This block design file has been exported with Reference-Design Scripts from zynq Electronic GmbH for Board Part:${ZQ::BOARDPART} with FPGA ${ZQ::PARTNAME} at [ clock format [clock seconds] -format "%Y-%m-%dT%H:%M:%S"].\""]
      return $data
    }
    # -----------------------------------------
    # --modify_block_design_tcl: load and save block design tcl (sub functions used for modifications) 
    proc modify_block_design_tcl {file_name mod_file} {
      puts "Info:(ZQ) Edit [file tail [file rootname $file_name]]"
      #read file to string list
      set fp_r [open ${file_name} "r"]
      set file_data [read $fp_r]
      close $fp_r
      set data [split $file_data "\n"]
      #modify list elements ()
      if {$mod_file} {
        puts "Info:(ZQ) Modify [file tail [file rootname $file_name]]"
        if {[catch {set data [modify_block_design_commentlines $data]} result]} { puts "Error:(ZQ) Script (ZQ::UTILS::modify_block_design_commentlines) failed: $result."; return -code error}
        if {[catch {set data [modify_block_design_commentdesignprops $data]} result]} { puts "Error:(ZQ) Script (ZQ::UTILS::modify_block_design_commentdesignprops) failed: $result."; return -code error}
        if {[catch {set data [modify_block_design_add_lines $data]} result]} { puts "Error:(ZQ) Script (ZQ::UTILS::modify_block_design_add_lines) failed: $result."; return -code error}
        if {[catch {set data [modify_block_design_add_designprops $data]} result]} { puts "Error:(ZQ) Script (ZQ::UTILS::modify_block_design_add_designprops) failed: $result."; return -code error}
      }
      # write info header
       if {[catch {set data [ZQ::UTILS::setinfo_to_block_design_tcl $data $mod_file]} result]} { puts "Error:(ZQ) Script (ZQ::UTILS::setinfo_to_block_design_tcl) failed: $result."; return -code error}
      #write all list elements to file
      set fp_w [open ${file_name} "w"]
      foreach line $data {
        puts $fp_w $line
      }
      close $fp_w
    } 
    # -----------------------------------------
    # --modify_block_design_commentlines: 
    proc modify_block_design_commentlines {datalist} {
      #data=tcl content
      set data $datalist
      #modify list elements
      set line_index -1
      set mod_count 0
      foreach line $data {
        incr line_index
        foreach cname $ZQ::BD_MOD_COMMENT {
          set line_check [lindex $cname 1]
          #comment lines on tcl file, modified lines are ignored
          if {[string match $line_check $line]  && ![string match *#TE_MOD#* $line]} {
            set data [lreplace $data[set data {}] $line_index $line_index "# #TE_MOD# $line"]
            incr mod_count
          }
        }
      }
      puts "Info:(ZQ) $mod_count lines are commented."
      return $data
    }
    # -----------------------------------------
    # --modify_block_design_commentdesignprops: 
    proc modify_block_design_commentdesignprops {datalist} {
      #data=tcl content
      set data $datalist
      #modify list elements
      set mod_count 0
      foreach cname $ZQ::BD_MOD_PCOMMENT {
        set prop_start_name "set_property -dict"
        #get instant name
        set inst_name [lindex $cname 1]
        set prop_stop_name  "\] \$$inst_name"
        #modify list elements
        set line_index -1
        set prop_start -1
        set prop_stop -1
        #search for property boundaries
        foreach line $data {
          incr line_index
          if {[string match *$prop_start_name* $line] && ![string match *#TE_MOD#* $line]} {
            set prop_start $line_index
          }
          if {[string match *$prop_stop_name $line] && ![string match *#TE_MOD#* $line]} {
            set prop_stop $line_index
            break;
          }
        }
        #only if component found
        if {$prop_start>=0 && $prop_stop>$prop_start} {
          set removed_items [list]
          set item_cnt -1
          #removed items
          foreach item $cname {
            incr item_cnt
            #ignore id and line_check
            if {$item_cnt>1} {
              set i $prop_stop
              while {$i >= $prop_start} {
                set i [expr $i-1]
                set newline "[lindex $data $i]"
                if {[string match *$item* $newline] && ![string match *#TE_MOD#* $newline]} {
                  lappend removed_items "# #TE_MOD# $newline"
                  set data [lreplace $data[set data {}] $i $i]
                  incr mod_count
                }
              }
            }
          }
          #add removed items as comment after the component list
          set inserpos [expr $prop_stop + 2 - [llength $removed_items]]
          set data [linsert $data[set data {}] $inserpos "# #TE_MOD# #Empty Line"]  
          foreach el [lreverse $removed_items] { 
            set data [linsert $data[set data {}] $inserpos $el]  
          }
          # if all properties are removed, clear empty property container
          if {[expr $prop_stop-$prop_start]==[llength $removed_items]} {
            set tmp "# #TE_MOD# [lindex $data $prop_start]"
            set data [lreplace $data[set data {}] $prop_start $prop_start $tmp]
            set tmp "# #TE_MOD# [lindex $data [expr $prop_start+1]]"
            set data [lreplace $data[set data {}] [expr $prop_start+1] [expr $prop_start+1] $tmp]
          }
        }
      }
      puts "Info:(ZQ) $mod_count properties are commented."
      return $data
    }
    # -----------------------------------------
    # --modify_block_design_add_lines: 
    proc modify_block_design_add_lines {datalist} {
      #data=tcl content
      set data $datalist
      #modify list elements
      set line_index -1
      set mod_count 0
      foreach cname $ZQ::BD_MOD_ADD {
        set line_check [lindex $cname 1]
        set line_index -1
        foreach line $data {
          incr line_index
          #add lines on tcl file, modified lines are ignored
          if {[string match $line_check $line]  && ![string match *#TE_MOD#* $line]} {
            # set data [lreplace $data[set data {}] $line_index $line_index "# #TE_MOD# $line"]
            set data [linsert $data[set data {}] [expr $line_index+1]  "# #TE_MOD#_Add next line#"]
            set data [linsert $data[set data {}] [expr $line_index+2]  [lindex $cname 2]]
            incr mod_count
            break
          }
        }
      }
      puts "Info:(ZQ) $mod_count lines are added."
      return $data
    }
    # -----------------------------------------
    # --modify_block_design_add_designprops: 
    proc modify_block_design_add_designprops {datalist} {
      #data=tcl content
      set data $datalist
      #modify list elements
      set mod_count 0
      foreach cname $ZQ::BD_MOD_PADD {
        #get instant name
        set inst_name [lindex $cname 1]
        set prop_stop_name  "\] \$$inst_name"
        #modify list elements
        set line_index -1
        set prop_start -1
        set prop_stop -1
        set all_props_removed -1
        #search for property boundaries
        foreach line $data {
          incr line_index
          if {[string match *$prop_stop_name $line]} {
            if {![string match *#TE_MOD#* $line] } {
              set prop_stop $line_index
            } else {
              set all_props_removed $line_index
            }
            break;
          }
        }
        #if component props found
        if {$prop_stop>-1} {
          #add removed items as comment after the component list
          set inserpos [expr $prop_stop + 1]
          set el_index -1
          #add property as comment
          foreach el $cname { 
            incr el_index
            #ignore id and line_check
            if {$el_index>1} {
              set data [linsert $data[set data {}] $inserpos "# #TE_MOD#_add_property# $el"]  
            }
          }
          #add property
          set inserpos [expr $prop_stop + -1]
          set el_index -1
          foreach el $cname { 
            incr el_index
            #ignore id and line_check
            if {$el_index>1} {
              set data [linsert $data[set data {}] $inserpos "$el \\"]  
              incr mod_count
            }
          }
        } elseif {$all_props_removed>-1} {
          #add removed items as comment after the component list
          set inserpos [expr $all_props_removed + 1]
          set el_index -1
          #add property as comment
          foreach el $cname { 
            incr el_index
            #ignore id and line_check
            if {$el_index>1} {
              set data [linsert $data[set data {}] $inserpos "# #TE_MOD#_add_property# $el"]  
            }
          }
          #add property
          set inserpos [expr $all_props_removed + 1]
          set el_index -1
          set data [linsert $data[set data {}] $inserpos "  set_property -dict \[ list \\"]  
          incr inserpos
          foreach el $cname { 
            incr el_index
            #ignore id and line_check
            if {$el_index>1} {
              set data [linsert $data[set data {}] $inserpos "$el \\"]  
              incr inserpos
              incr mod_count
            }
          }
          set data [linsert $data[set data {}] $inserpos " \] \$[lindex $cname 1]"]  
        }
      }
      puts "Info:(ZQ) $mod_count properties are add."
      return $data
    }
    # -----------------------------------------
    # finished modify block design functions
    # -----------------------------------------
    # -----------------------------------------
    # generate workspace functions
    # -----------------------------------------
    # -----------------------------------------
    # --workspace_info: 
    proc workspace_info {infofile info} {
      set report_file ${infofile}
      set fp_w [open ${report_file} "w"]
      puts $fp_w "$info"
      close $fp_w
    }
    # -----------------------------------------
    # --generate_workspace_hsi: 
    proc generate_workspace_hsi {{fname ""}} {
      #todo mal schauen ob vorher gelöcht werden muss oder ob überschreiben reicht
      if {$fname eq ""} {
      #use generated vivado data for workspace
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef]} {
          file mkdir ${ZQ::WORKSPACE_HSI_PATH}/
          file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef ${ZQ::WORKSPACE_HSI_PATH}/${ZQ::VPROJ_NAME}.hdf
          # file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit ${ZQ::WORKSPACE_HSI_PATH}
          workspace_info "${ZQ::WORKSPACE_PATH}/hsi_info.txt" "HSI Data used from ${ZQ::VPROJ_PATH}"
        } else {puts "Warning:(ZQ) ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef not found, no hsi workspace was generate.";}
      } else {
        #use prebuilt data for workspace
        set shortname "[ZQ::BDEF::find_shortdir $fname]"
        if {[file exists ${ZQ::PREBUILT_HW_PATH}/${shortname}/${ZQ::VPROJ_NAME}.hdf]} {
          file mkdir ${ZQ::WORKSPACE_HSI_PATH}/
          file copy -force ${ZQ::PREBUILT_HW_PATH}/${shortname}/${ZQ::VPROJ_NAME}.hdf ${ZQ::WORKSPACE_HSI_PATH}/${ZQ::VPROJ_NAME}.hdf
          # file copy -force ${ZQ::PREBUILT_HW_PATH}/${shortname}/${ZQ::VPROJ_NAME}.bit ${ZQ::WORKSPACE_HSI_PATH}
          workspace_info "${ZQ::WORKSPACE_PATH}/hsi_info.txt" "HSI Data used from  ${ZQ::PREBUILT_HW_PATH}/${shortname}"
        } else {puts "Warning:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${shortname}/${ZQ::VPROJ_NAME}.hdf not found, no hsi workspace was generate."}
      }
    }    
    # -----------------------------------------
    # --generate_workspace_sdk:     
    proc generate_workspace_sdk {{fname ""}} {
      #todo mal schauen ob vorher gelöcht werden muss oder ob überschreiben reicht
      if {$fname eq ""} {
        #use generated vivado data for workspace
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef]} {
           file mkdir ${ZQ::WORKSPACE_SDK_PATH}/
           # file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef ${ZQ::WORKSPACE_SDK_PATH}/${ZQ::VPROJ_NAME}.hdf
           #use Toplevelname instead fo Project name -> export from Vivado GUI can used to 
           file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef ${ZQ::WORKSPACE_SDK_PATH}/${ZQ::PR_TOPLEVELNAME}.hdf
           # file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit ${ZQ::WORKSPACE_SDK_PATH}
            workspace_info "${ZQ::WORKSPACE_PATH}/sdk_info.txt" "SDK Data used from ${ZQ::VPROJ_PATH}"
        } else {puts "Warning:(ZQ) ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef not found, no sdk workspace was generate."}
      } else {
        #use prebuilt data for workspace
        set shortname "[ZQ::BDEF::find_shortdir $fname]"
        if {[file exists ${ZQ::PREBUILT_HW_PATH}/${shortname}/${ZQ::VPROJ_NAME}.hdf]} {
          file mkdir ${ZQ::WORKSPACE_SDK_PATH}/
          # file copy -force ${ZQ::PREBUILT_HW_PATH}/${shortname}/${ZQ::VPROJ_NAME}.hdf ${ZQ::WORKSPACE_SDK_PATH}/${ZQ::VPROJ_NAME}.hdf
          #use Toplevelname instead fo Project name -> export from Vivado GUI can used to 
          file copy -force ${ZQ::PREBUILT_HW_PATH}/${shortname}/${ZQ::VPROJ_NAME}.hdf ${ZQ::WORKSPACE_SDK_PATH}/${ZQ::VPROJ_NAME}.hdf
          # file copy -force ${ZQ::PREBUILT_HW_PATH}/${shortname}/${ZQ::VPROJ_NAME}.hdf ${ZQ::WORKSPACE_SDK_PATH}/${ZQ::PR_TOPLEVELNAME}.hdf
          # file copy -force ${ZQ::PREBUILT_HW_PATH}/${shortname}/${ZQ::VPROJ_NAME}.bit ${ZQ::WORKSPACE_SDK_PATH}
          workspace_info "${ZQ::WORKSPACE_PATH}/sdk_info.txt" "SDK Data used from  ${ZQ::PREBUILT_HW_PATH}/${shortname}"
        } else {puts "Warning:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${shortname}/${ZQ::VPROJ_NAME}.hdf not found, no sdk workspace was generate."}
      }
    }      
    # -----------------------------------------
    # finished generate workspace functions
    # -----------------------------------------
    # -----------------------------------------
    # copy files functions
    # -----------------------------------------
    # -----------------------------------------
    # --copy_hw_files:   
    proc copy_hw_files { {deleteOldFile  true}} {
      #make new one
      file mkdir ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}
      if {${ZQ::PR_TOPLEVELNAME} eq "NA" } {
        puts "Warning:(ZQ) Toplevelname was not set for scripts, script properties will be reload"
        ZQ::VIV::restore_scriptprops
      }
      #copy files only if bitfiles exists
      if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit]} {
        #delete old prebuilt bitfile
        if {[file exists ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.bit] && $deleteOldFile } {
          if {[catch {file delete -force ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.bit} result]} {puts "Warning:(ZQ) $result"}
        }
        #copy and rename bitfile
        file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.bit
        puts "Info:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.bit is replaced with new one."
        # -----------------------------------------
        #delete old prebuilt lpr
        if {[file exists ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.lpr] && $deleteOldFile } {
          if {[catch {file delete -force ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.lpr} result]} {puts "Warning:(ZQ) $result"}
        }
        #copy and rename lpr
        file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.hw/${ZQ::VPROJ_NAME}.lpr ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.lpr
        puts "Info:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.lpr is replaced with new one."
        # -----------------------------------------
        #delete old prebuilt ltx_file
        if {[file exists ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.ltx] && $deleteOldFile } {
          if {[catch {file delete -force ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.ltx} result]} {puts(ZQ) "Warning: $result"}
        }
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/debug_nets.ltx]} {
          file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/debug_nets.ltx ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.ltx
          puts "Info:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.ltx is replaced with new one."
        } else {puts "Info:(ZQ) ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/debug_nets.ltx not found"}
        #delete old prebuilt hdf_file (hdf only on processor systems)
        if {[file exists ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.hdf]  && $deleteOldFile } {
          if {[catch {file delete -force ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.hdf} result]} {puts "Warning:(ZQ) $result"}
        }
        if {!$ZQ::IS_FSYS} {
          if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef]} {
            #optional only on prozessor system: check bd file name --> for fsys no *hwdef and *sydef files needed
            file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.hdf
            puts "Info:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.hdf is replaced with new one."
          } else {puts "Info:(ZQ) ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.sysdef not found"}
        } 
        #delete old prebuilt mmi (not for zynq systems)
        if {[file exists ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.mmi]  && $deleteOldFile } {
          if {[catch {file delete -force ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.mmi} result]} {puts "Warning:(ZQ) $result"}
        }
        #delete old prebuilt mcs_file (not for zynq systems)
        if {[file exists ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.mcs]  && $deleteOldFile } {
          if {[catch {file delete -force ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.mcs} result]} {puts "Warning:(ZQ) $result"}
        }
        #delete old prebuilt prm_file (not for zynq systems)
        if {[file exists ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/reports/${ZQ::VPROJ_NAME}.prm]  && $deleteOldFile } {
          if {[catch {file delete -force ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/reports/${ZQ::VPROJ_NAME}.prm} result]} {puts "Warning:(ZQ) $result"}
        }
        #copy mmi
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mmi]} {
          file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mmi ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.mmi
           puts "Info:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.mmi is replaced with new one."
        } else {puts "Info:(ZQ) ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mmi not found"}
        #copy mcs
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mcs]} {
          #optional only on systems without processor used see ZQ::VIV::write_cfgmem for selection
          #compare timestamps, if mcs is older than bitfile, rerun write mcs_file --> if gui is used to generate bitfile mcs will not recreate
          set bittime [file mtime ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit] 
          set mcstime [file mtime ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mcs] 
          if {$mcstime < $bittime} {
            puts "Info:(ZQ) *.mcs is older the *.bit, write new *.mcs"
            if {[catch {ZQ::VIV::write_viv_cfgmem} result]} { puts "Error:(ZQ) Script (ZQ::VIV::write_viv_cfgmem) failed: $result."; return -code error}
          }
          file mkdir ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/reports
          file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.prm ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/reports/${ZQ::VPROJ_NAME}.prm
          puts "Info:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/reports/${ZQ::VPROJ_NAME}.prm is replaced with new one."
          file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mcs ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.mcs
          puts "Info:(ZQ) ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${ZQ::VPROJ_NAME}.mcs is replaced with new one."
        } else {puts "Info:(ZQ) ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.mcs not found"}
      } else {puts "Warning:(ZQ) ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit not found. Nothing is copied."}     
    }  
    # -----------------------------------------
    # --copy_sw_files:   
    proc copy_sw_files {} {
      set dirs [glob -directory $ZQ::WORKSPACE_HSI_PATH *]
      if { [llength $dirs] >0} {
        #make new one
        file mkdir ${ZQ::PREBUILT_SW_PATH}/${ZQ::SHORTDIR}
        #copy files
        foreach dir $dirs {
          if {[file exists $dir/executable.elf]} {
            #apps+fsbl
            set fname [file tail $dir]
            #delete old prebuilt elffile
            if {[file exists ${ZQ::PREBUILT_SW_PATH}/${ZQ::SHORTDIR}/${fname}.elf]} {
              if {[catch {file delete -force ${ZQ::PREBUILT_SW_PATH}/${ZQ::SHORTDIR}/${fname}.elf} result]} {puts "Warning:(ZQ) $result"}
            }
            #copy file
            file copy -force $dir/executable.elf ${ZQ::PREBUILT_SW_PATH}/${ZQ::SHORTDIR}/${fname}.elf
            puts "Info:(ZQ) ${ZQ::PREBUILT_SW_PATH}/${ZQ::SHORTDIR}/${fname}.elf is replaced with new one."
          } elseif {[file exists $dir/skeleton.dtsi]} {
            #device tree
            set fname [file tail $dir]
            set devtree_folder ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${fname}
            file mkdir ${devtree_folder}
            if {[file exists ${devtree_folder}/skeleton.dtsi]} {
              if {[catch {file delete -force ${devtree_folder}/skeleton.dtsi} result]} {puts "Warning:(ZQ) $result"}
            }
            if {[file exists ${devtree_folder}/system.dts]} {
              if {[catch {file delete -force ${devtree_folder}/system.dts} result]} {puts "Warning:(ZQ) $result"}
            }
            if {[file exists ${devtree_folder}/zynq-7000.dtsi]} {
              if {[catch {file delete -force ${devtree_folder}/zynq-7000.dtsi} result]} {puts "Warning:(ZQ) $result"}
            }
            file copy -force $dir/skeleton.dtsi ${devtree_folder}/skeleton.dtsi
            file copy -force $dir/system.dts ${devtree_folder}/system.dts
            file copy -force $dir/zynq-7000.dtsi ${devtree_folder}/zynq-7000.dtsi
            puts "Info:(ZQ) Device Tree files ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/${fname} are replaced with new ones."
          }
        }
      } else {
        puts "Warning:(ZQ) No Software folder found in $ZQ::WORKSPACE_HSI_PATH. Nothing is copied."
      }
    } 
    # -----------------------------------------
    # --copy_hw_reports:   
    proc copy_hw_reports {} {
        file mkdir ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/reports
        #copy only if new bitfile exists
        if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::PR_TOPLEVELNAME}.bit]} {
          if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_ip_status_report.txt]} {
            file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_ip_status_report.txt ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/reports
          }
          if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.txt]} {
            file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.txt ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/reports
          }
          if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.csv]} {
          file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.csv ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/reports
          }
          if {[file exists ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.xdc]} {
          file copy -force ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}.runs/${ZQ::IMPL_NAME}/${ZQ::VPROJ_NAME}_io_report.xdc ${ZQ::PREBUILT_HW_PATH}/${ZQ::SHORTDIR}/reports
          }
        }
        #create allways summary 
        create_prebuilt_hw_summary
    } 
    # -----------------------------------------
    # finished copy files  functions
    # -----------------------------------------
    # -----------------------------------------
    # report functions
    # -----------------------------------------
    # -----------------------------------------
    # --create_prebuilt_hw_summary: 
    proc create_prebuilt_hw_summary {} {
      set report_file ${ZQ::VPROJ_PATH}/${ZQ::VPROJ_NAME}_summary.csv
      set prebuilt_file ${ZQ::PREBUILT_HW_PATH}/hardware_summary.csv
      #todo hardware_summary.csv mal löschen
      set fp_r [open ${report_file} "r"]
      set file_data [read $fp_r]
      set data [split $file_data "\n"]
      close $fp_r
      if { ![file exists ${prebuilt_file}]} {
        set fp_w [open ${prebuilt_file} "w"]
        puts $fp_w [lindex $data 0]
        puts $fp_w [lindex $data 1]
        close $fp_w
      } else {
        set fp_a [open ${prebuilt_file} "a"]
        puts $fp_a [lindex $data 1]
        close $fp_a
      }
    }
    # -----------------------------------------
    # finished report functions
    # -----------------------------------------
    # -----------------------------------------
    # clear functions
    # -----------------------------------------
    # -----------------------------------------
    # --clean_vivado_project: 
    proc clean_vivado_project {} {
      if { [file exists $ZQ::VPROJ_PATH] } {
        file delete -force $ZQ::VPROJ_PATH
        puts "Info:(ZQ) Folder ($ZQ::VPROJ_PATH) deleted"
      }
    }   
    # -----------------------------------------
    # --clean_labtools_project:     
    proc clean_labtools_project {} {
      if { [file exists $ZQ::VLABPROJ_PATH] } {
        file delete -force $ZQ::VLABPROJ_PATH
        puts "Info:(ZQ) Folder ($ZQ::VLABPROJ_PATH) deleted"
      }
    }    
    # -----------------------------------------
    # --clean_workspace_hsi:  
    proc clean_workspace_hsi {} {
      if { [file exists ${ZQ::WORKSPACE_HSI_PATH}] } {
        file delete -force ${ZQ::WORKSPACE_HSI_PATH}
        puts "Info:(ZQ) Folder (${ZQ::WORKSPACE_HSI_PATH}) deleted"
      }
    } 
    # -----------------------------------------
    # --clean_workspace_sdk:  
    proc clean_workspace_sdk {} {
      if { [file exists ${ZQ::WORKSPACE_SDK_PATH}] } {
        file delete -force ${ZQ::WORKSPACE_SDK_PATH}
        puts "Info:(ZQ) Folder (${ZQ::WORKSPACE_SDK_PATH}) deleted"
      }
    }
    # -----------------------------------------
    # --clean_workspace_all:  
    proc clean_workspace_all {} {
      if { [file exists ${ZQ::WORKSPACE_PATH}] } {
        file delete -force ${ZQ::WORKSPACE_PATH}
        puts "Info:(ZQ) Folder (${ZQ::WORKSPACE_PATH}) deleted"
      }
    }
    # -----------------------------------------
    # --clean_sdsoc:  
    proc clean_sdsoc {} {
      if { [file exists ${ZQ::SDSOC_PATH}] } {
        file delete -force ${ZQ::SDSOC_PATH}
        puts "Info:(ZQ) Folder (${ZQ::SDSOC_PATH}) deleted"
      }
    }
    # -----------------------------------------
    # --clean_all_generated_files:  
    proc clean_all_generated_files {} {
      clean_vivado_project
      clean_labtools_project
      clean_workspace_hsi
      clean_workspace_sdk
      clean_workspace_all
      clean_sdsoc
    }
    # -----------------------------------------
    # --clean_prebuilt_all:  
    proc clean_prebuilt_all {} {
      if { [file exists ${ZQ::PREBUILT_PATH}] } {
        file delete -force ${ZQ::PREBUILT_PATH}
        puts "Info:(ZQ) Folder (${ZQ::PREBUILT_PATH}) deleted"
      }
    }
    #todo clean prebuilt single part -> bi hw ,sw, os
    # -----------------------------------------
    # finished report functions
    # -----------------------------------------
    # -----------------------------------------
  }
  puts "Info:(ZQ) Load ZQ-utils script finished"
}
