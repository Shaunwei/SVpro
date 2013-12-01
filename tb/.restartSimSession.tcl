# Begin_DVE_Session_Save_Info
# DVE restart session
# Saved on Sat Nov 30 16:26:46 2013
# Designs open: 1
#   Sim: /DCNFS/users/student/xwei/Desktop/ELEN603/final/IMAGEPROC/tb/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: uvm_pkg.\uvm_report_object::die 
#   Schematic.1: imageproc_test_top.dut
#   Wave.1: 44 signals
#   Group count = 2
#   Group dut signal count = 31
#   Group rotate_orig signal count = 13
# End_DVE_Session_Save_Info

# DVE version: H-2013.06-3_Full64
# DVE build date: Sep  9 2013 21:31:29


#<Session mode="Restart" path=".restartSimSession.tcl" type="Debug">

gui_set_loading_session_type Restart
gui_continuetime_set
gui_clear_window -type Wave
gui_clear_window -type List

# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

set TopLevel.1 TopLevel.1

# Docked window settings
set HSPane.1 HSPane.1
set Hier.1 Hier.1
set Stack.1 Stack.1
set Class.1 Class.1
set Object.1 Object.1
set DLPane.1 DLPane.1
set Data.1 Data.1
set Local.1 Local.1
set Member.1 Member.1
set Console.1 Console.1
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 Source.1
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set Wave.1 Wave.1
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 400} {child_wave_right 967} {child_wave_colname 196} {child_wave_colvalue 200} {child_wave_col1 0} {child_wave_col2 1}}
gui_use_schematics
set Schematic.1 [gui_create_window -type {Schematic}  -parent ${TopLevel.1} -defer_create_taskbar_icon]
set setting [::Misc::Setting::create -array DveSchematicSettings]
Misc::init_window $setting ${Schematic.1}
::Misc::exec_method -window ${Schematic.1} -method captionCmd
gui_add_icon_to_taskbar -window ${Schematic.1}
gui_show_window -window ${Schematic.1} -show_state maximized
gui_update_layout -id ${Schematic.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings


#</WindowLayout>

#<Database>

gui_set_precision 100ps
gui_set_time_units 100ps
#</Database>

# DVE Global setting session: 


# Global: Breakpoints

# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {imageproc_test_top.dut}
gui_load_child_values {imageproc_test_top.dut.rotate_orig}


set _session_group_15 dut
gui_sg_create "$_session_group_15"
set dut "$_session_group_15"

gui_sg_addsignal -group "$_session_group_15" { imageproc_test_top.dut.data2 imageproc_test_top.dut.data_valid2 imageproc_test_top.dut.data3 imageproc_test_top.dut.data_valid3 imageproc_test_top.dut.data4 imageproc_test_top.dut.data_valid4 imageproc_test_top.dut.error imageproc_test_top.dut.cmd_data imageproc_test_top.dut.cmd imageproc_test_top.dut.dataout0 imageproc_test_top.dut.dataout1 imageproc_test_top.dut.data imageproc_test_top.dut.data_valid imageproc_test_top.dut.cmd_ack imageproc_test_top.dut.WRITE0 imageproc_test_top.dut.WRITE1 imageproc_test_top.dut.addr_wr0 imageproc_test_top.dut.READ0 imageproc_test_top.dut.addr_wr1 imageproc_test_top.dut.READ1 imageproc_test_top.dut.cmd_valid imageproc_test_top.dut.state imageproc_test_top.dut.busy imageproc_test_top.dut.refresh imageproc_test_top.dut.clk imageproc_test_top.dut.addr_rd0 imageproc_test_top.dut.addr_rd1 imageproc_test_top.dut.rst_n {imageproc_test_top.dut.$unit} imageproc_test_top.dut.datain0 imageproc_test_top.dut.datain1 }
gui_set_radix -radix {decimal} -signals {Sim:imageproc_test_top.dut.addr_wr0}
gui_set_radix -radix {unsigned} -signals {Sim:imageproc_test_top.dut.addr_wr0}

set _session_group_16 rotate_orig
gui_sg_create "$_session_group_16"
set rotate_orig "$_session_group_16"

gui_sg_addsignal -group "$_session_group_16" { imageproc_test_top.dut.rotate_orig.data_valid2 imageproc_test_top.dut.rotate_orig.data2 imageproc_test_top.dut.rotate_orig.sin imageproc_test_top.dut.rotate_orig.data_valid imageproc_test_top.dut.rotate_orig.data imageproc_test_top.dut.rotate_orig.ANGLE imageproc_test_top.dut.rotate_orig.cos imageproc_test_top.dut.rotate_orig.x imageproc_test_top.dut.rotate_orig.y imageproc_test_top.dut.rotate_orig.clk imageproc_test_top.dut.rotate_orig.tempx imageproc_test_top.dut.rotate_orig.tempy {imageproc_test_top.dut.rotate_orig.$unit} }
gui_set_radix -radix {decimal} -signals {Sim:imageproc_test_top.dut.rotate_orig.ANGLE}
gui_set_radix -radix {twosComplement} -signals {Sim:imageproc_test_top.dut.rotate_orig.ANGLE}
gui_set_radix -radix {decimal} -signals {Sim:imageproc_test_top.dut.rotate_orig.cos}
gui_set_radix -radix {unsigned} -signals {Sim:imageproc_test_top.dut.rotate_orig.cos}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 5000018500



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {Function 1} {Block 1} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_change_design -id ${Hier.1} -design Sim
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Class 'Class.1'
gui_list_set_filter -id ${Class.1} -list { {OVM 1} {VMM 1} {All 1} {Object 1} {UVM 1} {RVM 1} }
gui_list_set_filter -id ${Class.1} -text {*}
gui_change_design -id ${Class.1} -design Sim

# Member 'Member.1'
gui_list_set_filter -id ${Member.1} -list { {InternalMember 0} {RandMember 1} {All 0} {BaseMember 0} {PrivateMember 1} {AutomaticMember 1} {VirtualMember 1} {PublicMember 1} {ProtectedMember 1} {InterfaceClassMember 1} {StaticMember 1} }
gui_list_set_filter -id ${Member.1} -text {*}

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active {uvm_pkg.\uvm_report_object::die } /projects/dft2005fall/bgreene/vcs/etc/uvm-1.1/base/uvm_report_object.svh
gui_view_scroll -id ${Source.1} -vertical -set 4050
gui_src_set_reusable -id ${Source.1}
# Warning: Class view not found.

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_wv_zoom_timerange -id ${Wave.1} 5000008852 5000028162
gui_list_add_group -id ${Wave.1} -after {New Group} {dut}
gui_list_add_group -id ${Wave.1} -after {New Group} {rotate_orig}
gui_list_collapse -id ${Wave.1} dut
gui_list_select -id ${Wave.1} {imageproc_test_top.dut.rotate_orig.cos }
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group rotate_orig  -position in

gui_marker_move -id ${Wave.1} {C1} 5000018500
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false

# View 'Schematic.1'
gui_use_schematics

# Create schematic window 'Schematic.1'
gui_sch_show -window ${Schematic.1} -name imageproc_test_top.dut
gui_show_pin_value_annotate [gui_window_hier_name -window ${Schematic.1}]
gui_zoom -window ${Schematic.1} -rect { {14457 -55381} {140714 4105} }


# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Wave.1}
	gui_set_active_window -window ${HSPane.1}
}
#</Session>

