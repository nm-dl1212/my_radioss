#!/bin/bash
set -e
 
export OPENRADIOSS_PATH=/opt/OpenRadioss
export RAD_CFG_PATH="$OPENRADIOSS_PATH/hm_cfg_files"
export LD_LIBRARY_PATH=$OPENRADIOSS_PATH/extlib/hm_reader/linux64/:$OPENRADIOSS_PATH/extlib/h3d/lib/linux64/:$LD_LIBRARY_PATH
 
echo ** Run Starter **
$OPENRADIOSS_PATH/exec/starter_linux64_gf -i $1_0000.rad
 
echo ** Run Engine **
$OPENRADIOSS_PATH/exec/engine_linux64_gf -i $1_0001.rad
 
echo Done./run.sh $1