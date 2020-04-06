# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config  -ruleid {1}  -id {Project 1-564}  -string {{CRITICAL WARNING: [Project 1-564] A project save was requested while parsing the project. To prevent a partially loaded project from being committed to disk, this save will not occur.}}  -suppress 
set_msg_config  -ruleid {2}  -id {ProjectBase 1-489}  -string {{INFO: [ProjectBase 1-489] The host OS only allows 260 characters in a normal path. The project is stored in a path with more than 80 characters. If you experience issues with IP, Block Designs, or files not being found, please consider moving the project to a location with a shorter path. Alternately consider using the OS subst command to map part of the path to a drive letter.
Current project path is 'C:/Users/Malwi/Dropbox/studia-semestry/VI SEMESTR/FPGA/STATE MACHINE/_state_machine'}}  -suppress 
set_msg_config  -ruleid {3}  -id {IP_Flow 19-234}  -string {{INFO: [IP_Flow 19-234] Refreshing IP repositories}}  -suppress 
set_msg_config  -ruleid {4}  -id {IP_Flow 19-1704}  -string {{INFO: [IP_Flow 19-1704] No user IP repositories specified}}  -suppress 
set_msg_config  -ruleid {5}  -id {IP_Flow 19-2313}  -string {{INFO: [IP_Flow 19-2313] Loaded Vivado IP repository 'C:/Xilinx/Vivado/2017.4/data/ip'.}}  -suppress 
set_msg_config  -ruleid {6}  -id {XSIM 43-3249}  -string {{ERROR: [XSIM 43-3249] File C:/Users/Malwi/Dropbox/studia-semestry/VI SEMESTR/FPGA/STATE MACHINE/_state_machine/state_machine_local_project.srcs/sources_1/new/state_machine.vhd, line 32. Unresolved signal "delay_lcd_counter" is multiply driven.}}  -suppress 
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Malwi/Dropbox/PROGR/fpga/state_machine/state_machine/state_machine_local_project.cache/wt [current_project]
set_property parent.project_path C:/Users/Malwi/Dropbox/PROGR/fpga/state_machine/state_machine/state_machine_local_project.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Users/Malwi/Dropbox/PROGR/fpga/state_machine/state_machine/state_machine_local_project.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -vhdl2008 -library xil_defaultlib C:/Users/Malwi/Dropbox/PROGR/fpga/state_machine/state_machine/state_machine_local_project.srcs/sources_1/new/state_machine.vhd
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Malwi/Dropbox/PROGR/fpga/state_machine/state_machine/state_machine_local_project.srcs/constrs_1/new/state_machine.xdc
set_property used_in_implementation false [get_files C:/Users/Malwi/Dropbox/PROGR/fpga/state_machine/state_machine/state_machine_local_project.srcs/constrs_1/new/state_machine.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top FSM -part xc7z010clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef FSM.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file FSM_utilization_synth.rpt -pb FSM_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]