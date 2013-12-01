# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Sat Nov 30 15:51:17 2013
# Designs open: 1
#   Sim: /DCNFS/users/student/xwei/Desktop/ELEN603/final/IMAGEPROC/tb/simv
# Toplevel windows open: 1
# 	TopLevel.1
#   Schematic.1: imageproc_test_top.dut
#   Source.1: uvm_pkg.\uvm_root::run_test 
#   Wave.1: 45 signals
#   Schematic.2: ok
#   Group count = 2
#   Group dut signal count = 31
#   Group ram signal count = 14
# End_DVE_Session_Save_Info

# DVE version: H-2013.06-3_Full64
# DVE build date: Sep  9 2013 21:31:29


#<Session mode="Full" path="/DCNFS/users/student/xwei/Desktop/ELEN603/final/IMAGEPROC/tb/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{5 98} {1914 1061}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 265]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
catch { set Stack.1 [gui_share_window -id ${HSPane.1} -type Stack -silent] }
catch { set Class.1 [gui_share_window -id ${HSPane.1} -type Class -silent] }
catch { set Object.1 [gui_share_window -id ${HSPane.1} -type Object -silent] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 265
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 264} {height 687} {dock_state left} {dock_on_new_line true} {child_hier_colhier 230} {child_hier_coltype 39} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 273]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
catch { set Local.1 [gui_share_window -id ${DLPane.1} -type Local -silent] }
catch { set Member.1 [gui_share_window -id ${DLPane.1} -type Member -silent] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 273
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 687
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 272} {height 687} {dock_state left} {dock_on_new_line true} {child_data_colvariable 155} {child_data_colvalue 66} {child_data_coltype 56} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 178]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 1860
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 178
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 1909} {height 177} {dock_state bottom} {dock_on_new_line true}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.1}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 400} {child_wave_right 966} {child_wave_colname 196} {child_wave_colvalue 200} {child_wave_col1 0} {child_wave_col2 1}}
gui_use_schematics
set Schematic.1 [gui_create_window -type {Schematic}  -parent ${TopLevel.1} -defer_create_taskbar_icon]
set setting [::Misc::Setting::create -array DveSchematicSettings]
Misc::init_window $setting ${Schematic.1}
::Misc::exec_method -window ${Schematic.1} -method captionCmd
gui_add_icon_to_taskbar -window ${Schematic.1}
gui_show_window -window ${Schematic.1} -show_state maximized
gui_update_layout -id ${Schematic.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}
set Schematic.2 [gui_create_window -type {Schematic}  -parent ${TopLevel.1} -defer_create_taskbar_icon]
set setting [::Misc::Setting::create -array DveSchematicSettings]
Misc::init_window $setting ${Schematic.2}
::Misc::exec_method -window ${Schematic.2} -method captionCmd
gui_add_icon_to_taskbar -window ${Schematic.2}
gui_show_window -window ${Schematic.2} -show_state maximized
gui_update_layout -id ${Schematic.2} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{-ucligui +UVM_TESTNAME=test_rotate}}
gui_set_env SIMSETUP::SIMEXE {/DCNFS/users/student/xwei/Desktop/ELEN603/final/IMAGEPROC/tb/simv}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/DCNFS/users/student/xwei/Desktop/ELEN603/final/IMAGEPROC/tb/simv}] } {
gui_sim_run Ucli -exe simv -args {-ucligui +UVM_TESTNAME=test_rotate} -dir /DCNFS/users/student/xwei/Desktop/ELEN603/final/IMAGEPROC/tb -nosource
}
}
if { ![gui_sim_state -check active] } {error "Simulator did not start correctly" error}
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


set _session_group_21 dut
gui_sg_create "$_session_group_21"
set dut "$_session_group_21"

gui_sg_addsignal -group "$_session_group_21" { imageproc_test_top.dut.data2 imageproc_test_top.dut.data_valid2 imageproc_test_top.dut.data3 imageproc_test_top.dut.data_valid3 imageproc_test_top.dut.data4 imageproc_test_top.dut.data_valid4 imageproc_test_top.dut.error imageproc_test_top.dut.cmd_data imageproc_test_top.dut.cmd imageproc_test_top.dut.dataout0 imageproc_test_top.dut.dataout1 imageproc_test_top.dut.data imageproc_test_top.dut.data_valid imageproc_test_top.dut.cmd_ack imageproc_test_top.dut.WRITE0 imageproc_test_top.dut.WRITE1 imageproc_test_top.dut.addr_wr0 imageproc_test_top.dut.READ0 imageproc_test_top.dut.addr_wr1 imageproc_test_top.dut.READ1 imageproc_test_top.dut.cmd_valid imageproc_test_top.dut.state imageproc_test_top.dut.busy imageproc_test_top.dut.refresh imageproc_test_top.dut.clk imageproc_test_top.dut.addr_rd0 imageproc_test_top.dut.addr_rd1 imageproc_test_top.dut.rst_n {imageproc_test_top.dut.$unit} imageproc_test_top.dut.datain0 imageproc_test_top.dut.datain1 }
gui_set_radix -radix {decimal} -signals {Sim:imageproc_test_top.dut.addr_wr0}
gui_set_radix -radix {unsigned} -signals {Sim:imageproc_test_top.dut.addr_wr0}

set _session_group_22 ram
gui_sg_create "$_session_group_22"
set ram "$_session_group_22"

gui_sg_addsignal -group "$_session_group_22" { imageproc_test_top.dut.ram.dataout0 imageproc_test_top.dut.ram.dataout1 imageproc_test_top.dut.ram.WRITE0 imageproc_test_top.dut.ram.WRITE1 imageproc_test_top.dut.ram.addr_wr0 imageproc_test_top.dut.ram.READ0 imageproc_test_top.dut.ram.addr_wr1 imageproc_test_top.dut.ram.READ1 imageproc_test_top.dut.ram.clk imageproc_test_top.dut.ram.addr_rd0 imageproc_test_top.dut.ram.addr_rd1 {imageproc_test_top.dut.ram.$unit} imageproc_test_top.dut.ram.datain0 imageproc_test_top.dut.ram.datain1 }
gui_set_radix -radix {decimal} -signals {Sim:imageproc_test_top.dut.ram.addr_wr0}
gui_set_radix -radix {unsigned} -signals {Sim:imageproc_test_top.dut.ram.addr_wr0}
gui_set_radix -radix {decimal} -signals {Sim:imageproc_test_top.dut.ram.addr_wr1}
gui_set_radix -radix {unsigned} -signals {Sim:imageproc_test_top.dut.ram.addr_wr1}
gui_set_radix -radix {decimal} -signals {Sim:imageproc_test_top.dut.ram.addr_rd0}
gui_set_radix -radix {unsigned} -signals {Sim:imageproc_test_top.dut.ram.addr_rd0}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 409605500



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
gui_hier_list_init -id ${Hier.1}
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
gui_open_source -id ${Source.1}  -replace -active {uvm_pkg.\uvm_root::run_test } /projects/dft2005fall/bgreene/vcs/etc/uvm-1.1/base/uvm_root.svh
gui_src_value_annotate -id ${Source.1} -switch true
gui_set_env TOGGLE::VALUEANNOTATE 1
gui_view_scroll -id ${Source.1} -vertical -set 3180
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
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 409593221 409623946
gui_list_add_group -id ${Wave.1} -after {New Group} {dut}
gui_list_add_group -id ${Wave.1} -after {New Group} {ram}
gui_list_select -id ${Wave.1} {imageproc_test_top.dut.ram.addr_wr0 }
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
gui_list_set_insertion_bar  -id ${Wave.1} -group ram  -position in

gui_marker_move -id ${Wave.1} {C1} 409605500
gui_view_scroll -id ${Wave.1} -vertical -set 622
gui_show_grid -id ${Wave.1} -enable false

# View 'Schematic.1'
gui_use_schematics

# Create schematic window 'Schematic.1'
gui_sch_show -window ${Schematic.1} -name imageproc_test_top.dut
gui_show_pin_value_annotate [gui_window_hier_name -window ${Schematic.1}]
gui_zoom -window ${Schematic.1} -rect { {348 -55174} {125443 3808} }



# View 'Schematic.2'
gui_use_schematics


# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Schematic.2}
	gui_set_active_window -window ${HSPane.1}
}
#</Session>

