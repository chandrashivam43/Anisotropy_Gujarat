for file in `ls *SAC*`
do 
rm -rf file.txt

echo $file >file.txt

N=`cat file.txt| awk -F "-" '{a=substr($4,1,2);b=substr($4,3,4);c=substr($5,1,2);print $1"."$2"."$3"-"a"."b"."c}'`
stat=`sac<<! |grep KSTNM | awk -F" " '{print $3}'
r $file
lh KSTNM
q
!`
com=`sac<<! |grep KCMPNM| awk -F" " '{print $3}'
r $file
lh KCMPNM
q
!`
k=`echo "$N"".""$stat"".""$com"`
gedit $N.$stat.$com.SAC & 
sac<<!
r $file
mv -v  $file $N.$stat.$com.SAC
Quit
EOF
!

#mv  -v $file $N.SAC
#file name is e.g =1996-06-25-0337-20S.NNSN__039_HYA___SHE__SAC
#converted into 1996.06.25-03.37.20.HYA.SHE.SAC 
#mv $file $k.SAC
#cp $file $N will not work mv as well 
done
