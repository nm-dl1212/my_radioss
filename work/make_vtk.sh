OPENRADIOSS_PATH="/opt/OpenRadioss"
N=`find .| grep "A" | wc -l`
N=$(($N-1))
for i in `seq 1 $N`
 
do
    Num=`printf %03d $i`
    `"$OPENRADIOSS_PATH"/exec/anim_to_vtk_linux64_gf $1A"$Num" > $1A"$Num".vtk`
done