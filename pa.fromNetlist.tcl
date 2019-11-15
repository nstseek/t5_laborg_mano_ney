
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name trab_laborg.vhd -dir "E:/t5_laborg_mano_ney/planAhead_run_1" -part xc3s100etq144-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/t5_laborg_mano_ney/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/t5_laborg_mano_ney} }
set_param project.paUcfFile  "constraints.ucf"
add_files "constraints.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
