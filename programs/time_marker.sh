#!/bin/bash
for file in `ls *KAK0*`  ##
do
#code will read only station presents in the working directory
#we have to change the station at everytime in the places marked as ##
rm -rf $file.txt
echo $file>$file.txt

#KZTIME = 08:37:48.000 
#start_t=`sac<<!|grep KZTIME|awk -F":" '{a=substr($1,10,11);print a*60*60+$2*60+$3}' 
start_t=`sac<<!|grep KZTIME|awk -F" " '{a=substr($3,1,2);b=substr($3,4,5);c=substr($3,7,8);print a*60*60+b*60+c}' 
r ${file}
lh KZTIME
q
!`
echo "$start_t"
n=`cat $file.txt| awk -F "." '{a=substr($3,1,2);b=substr($3,4,5);print $1$2}'`

for reafile in `ls *$n`
do
{
chmod +r $reafile
chmod +w $reafile
chmod +x $reafile
##change the station name for each station
cat $reafile|grep -i ^KAK>output0.txt     ##
#extracting the station data
awk -v OFS='   ' '{$1=$1};1' output0.txt>output1.txt #for equal spacing of col

var=`cat output1.txt|grep -e IP -e IPg|awk -F "   " '{print $4}'`
s=`echo ${#var}`
echo $s
#echo $var
if [ "$s" -eq '3' ]
then {
a=`cat output1.txt|grep -u -w -e IP -e IPg|awk -v l="$s" 'l eq 3 {a=substr($4,2,3);b=substr($4,1,1);print b*60*60+a*60+$5}'`
b=`cat output1.txt|grep -u -w -e IS -e ISg|awk -v l="$s" 'l eq 3 {a=substr($4,2,3);b=substr($4,1,1);print b*60*60+a*60+$5}'`
}
elif [ "$s" -eq '1' ] #KZTIME = 01:58:15.000 # 2 0  3.94  
then {
a=`cat output1.txt|grep -u -w -e IP -e IPg|awk -v l="$s" 'l eq 1 {print $4*60*60+$5*60+$6}'`
b=`cat output1.txt|grep -u -w -e IS -e ISg|awk -v l="$s" 'l eq 1 {print $4*60*60+$5*60+$6}'`

}
elif [ "$s" -eq '2' ]
then {
a=`cat output1.txt|grep -u -w -e IP -e IPg|awk -v l="$s" 'l eq 2 {a=substr($4,2,3);print $4*60*60+$5*60+$6}'`
b=`cat output1.txt|grep -u -w -e IS -e ISg|awk -v l="$s" 'l eq 2 {a=substr($4,2,3);print $4*60*60+$5*60+$6}'`

}
else
{
a=`cat output1.txt|grep -u -w -e IP -e IPg|awk -v l="$s" 'l eq 4 {a=substr($4,3,4);b=substr($4,1,2);print b*60*60+a*60+$5}'`
b=`cat output1.txt|grep -u -w -e IS -e ISg|awk -v l="$s" 'l eq 4 {a=substr($4,3,4);b=substr($4,1,2);print b*60*60+a*60+$5}'`
}
fi
echo $a
echo $b
cal_p=`echo $a $start_t | awk '{print $1-$2}'`
cal_s=`echo $b $start_t | awk '{print $1-$2}'`
echo $cal_p
echo $cal_s


sac<<!
r ${file}
ch a $cal_p
ch t0 $cal_s
wh a t0
lh -l AMARKER T0MARKER
ppk 
wh a t0
q
!
} ##type q for exiting from sac window .
done
rm $file.txt
done 
