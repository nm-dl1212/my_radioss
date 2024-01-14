#!/bin/bash
set -e 
export OPENRADIOSS_PATH=/opt/OpenRadioss
export RAD_CFG_PATH="$OPENRADIOSS_PATH/hm_cfg_files"
export LD_LIBRARY_PATH=$OPENRADIOSS_PATH/extlib/hm_reader/linux64/:$OPENRADIOSS_PATH/extlib/h3d/lib/linux64/:$LD_LIBRARY_PATH


myjobname=$(echo "$1" | rev | cut -c3- | rev)
echo $myjobname "running in OpenRadioss"
#$OPENRADIOSS_PATH/exec/starter_linux64_gf -i $myjobname".k" -np $2 -nt 4
$OPENRADIOSS_PATH/exec/starter_linux64_gf -i $myjobname".k"
#mpiexec -n $2 $OPENRADIOSS_PATH/exec/engine_linux64_gf_ompi -i $myjobname"_0001.rad" -nt 1
$OPENRADIOSS_PATH/exec/engine_linux64_gf -i $myjobname"_0001.rad"


BASEDIR=$(dirname "$0")
cd $BASEDIR

for file in $BASEDIR/*; 
do   
	if [ -n "${file: -3}" ] && [ "${file: -3}" -eq "${file: -3}" ] 2>/dev/null && [[ "${file: -4:1}" == "A" ]]; then
		$OPENRADIOSS_PATH/exec//anim_to_vtk_linux64_gf $file > "$file.vtk"
		echo "$file is converted"		
	elif  [[ "${file: -3}" == "T01" ]] ;then
		$OPENRADIOSS_PATH/exec//th_to_csv_linux64_gf $file
		CSV="$file.csv"
	fi
done
