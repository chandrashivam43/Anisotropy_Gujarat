#!/bin/bash
#Caution :be careful code only runs on event by event ,see the date and time of rea and wave form file carefully before running the codes 
for file in `ls *SAC*`
do  
#the Rea file must be read from the sac file 
#sac file of particular station and component must be of that particular event 
#eg:-seisan wave form file 2018-01-01-0837-48S.ISR___054
     #repective rea file 01-0837-48R.S201801 and sac file 2018.01.01-08.37.48.stat.SHE.SAC
rm -rf file.txt

echo $file >file.txt

n=`cat file.txt| awk -F "." '{a=substr($3,1,2);b=substr($3,4,5);print $1$2}'`
#echo $n
for reafile in `ls *$n`
do
{
chmod +r $reafile
chmod +w $reafile
chmod +x $reafile
sed "s/^[ \t]*//" -i $reafile #to remove the trailing balnk spaces before the line
cat $reafile|head -1|grep -u -i ^2016 >output0.txt #if we are using some other year we have to change it.
var=`cat output0.txt|awk -F " " '{print $6}'`
s=`echo ${#var}`
echo "$s"
if [ "$s" -eq '1' ]
then {
lat=`more $reafile |head -1|awk -F " " '{print $7}'`
lon=`more $reafile |head -1|awk -F " " '{print $8}'`
ele=`more $reafile |head -1|awk -F " " '{print $9}'`
}
else
{
lat=`more $reafile |head -1|awk -F " " '{print $6}'`
lon=`more $reafile |head -1|awk -F " " '{print $7}'`
ele=`more $reafile |head -1|awk -F " " '{print $8}'`
}
fi


sac<<!
r $file
CHNHDR EVLA $lat
CHNHDR EVLO $lon
CHNHDR EVDP $ele
wh EVLO EVLA EVDP
lh -l EVLA EVLO EVDP
q
!
}
done
done 
