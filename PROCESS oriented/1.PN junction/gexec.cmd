# project name
name di
# execution graph
job 1   -post {  extract_vars "$nodedir" n1_fps.out 1; catch {os_cp "n1_mdr.cmd" "n1_msh.cmd"}; catch {os_cp "n1_mdr.bnd" "n1_msh.bnd"} }  -o n1_fps "sprocess -u -b n1_fps.cmd"
check sprocess_fps.cmd 1757396145
check global_tooldb 1748002656
check gtree.dat 1757396193
