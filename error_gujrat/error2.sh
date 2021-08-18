#!/bin/bash
#include <math.h>
#using C.schmid et al. 2004 method
#to calculate weighted mean of splitting parameters and final error of station
#code run on file error.txt cantaining 6 col of  phi er dt er_dt
rm -rf abs_fd.txt abs_t.txt del_phi1.txt del_t1.txt w.txt c.txt s.txt cp.txt phi.txt  result.txt

awk -v OFS='   ' '{$1=$1};1' error.txt>error1.txt


#The following sed command is used to remove the footer line in a file. The $ indicates the last line of a file.
#sed '$d' error1.txt
#to remove the empty line
sed '/^$/d' error1.txt

cat error1.txt| awk  -F "  " '{print $1}'>abs_fd.txt
cat error1.txt| awk  -F "  " '{print $3}'>abs_t.txt
#summation of errors for  delay time
cat error1.txt| awk  -F "  " '{if($4>0) print (1/$4)**2}'> del_t1.txt
s=`cat del_t1.txt|  awk  'BEGIN{SUM=0}{SUM=SUM+$1}END {print SUM}'`
#sed '/^$/d' del_t1.txt
#w file contains weights of each measurements
awk -v c=$s '{if(c>0)  print $1/c }' del_t1.txt >w.txt

#combine the file of weights and abs value of phi and t into c.txt file
paste w.txt  abs_t.txt | column -s $'\t' -tn >c.txt
#calculating the t mean saving in t file for each measurement
echo "Below is the time average for all the events"
#delat time mean stored in t 
t=`cat c.txt|  awk  'BEGIN{SUM=0}{SUM=SUM+($1)*($2)}END {print SUM}'`
echo "this the mean value:" $t
#combine the file of mean file of weights and abs value t into c.txt file
paste w.txt abs_t.txt | column -s $'\t' -tn >s.txt
n=`cat s.txt | wc -l`
#calculatin the S.D


s1=`cat s.txt|  awk -v c=$t 'BEGIN{SUM=0}{SUM=SUM+($1)*(($2-c)**2)}END {print SUM}'`
echo "the value of var:"$s1
sig=`echo $s1 $n | awk '{if($2>2) print sqrt(($2/($2-1))*$1)}'`

#calculation of phi

#weights for Fast direction
#summation of errors 
cat error1.txt| awk  -F "  " '{if($2>0) print (1/$2)**2}'> del_phi1.txt
p=`cat del_phi1.txt|  awk  'BEGIN{SUM=0}{SUM=SUM+$1}END {print SUM}'`
echo "the error in 1/phi**2 values of phi are:"
#sed '/^$/d' del_phi1.txt
#w file contains weights of each measurements
awk -v p=$p '{if(p>0)  print $1/p }' del_phi1.txt >wp.txt
#combine the file of weights and abs value of phi and t into c.txt file
paste wp.txt  abs_fd.txt | column -s $'\t' -tn >cp.txt
echo "the weighted values of phi are:"
#cat wp.txt
cbarp=`cat cp.txt|  awk  'BEGIN{SUM=0}{SUM=SUM+($1)*cos($2)}END {print SUM}'`
echo "Cbarp" $cbarp
sbarp=`cat cp.txt|  awk  'BEGIN{SUM=0}{SUM=SUM+($1)*sin($2)}END {print SUM}'`
echo "sbarp" $sbarp

#cat cp.txt| awk  -F "  " '{print ($1)*cos($2*0.017453293)}'>c_bar.txt
#cbar=`cat c_bar.txt|  awk  'BEGIN{SUM=0}{SUM=SUM+$1}END {print SUM}'`
#cat c_bar.txt
#echo "cbar" $cbar
echo "Direct"
cbar=`cat cp.txt|  awk  'BEGIN{SUM=0}{SUM=SUM+($1)*cos($2*0.017453293)}END {print SUM}'`
echo "Cbar2" $cbar
#cat c2.txt| awk  -F "  " '{print $1*sin($2*0.017453293)}'>s_bar.txt
s_bar=`cat cp.txt|  awk  'BEGIN{SUM=0}{SUM=SUM+($1)*sin($2*0.017453293)}END {print SUM}'`
echo "sbar" $s_bar

#calulating the inverse tan of sbar and cbar 
at=`echo $cbar $s_bar | awk '{print atan2($2,$1)/0.017453293}'`
echo "tan inverse is equal to the: " $at
atan=$(echo "scale=10; a($s_bar/$cbar)/0.017453293;" | bc -lq)
echo "tan inverse is: " $atan

#calculate phi

phi=`echo $cbar | awk -v c=$atan '{if($1>=0) print c;if($1<0) print "phi=" c+180}'`
#echo $phi
#circular SD 
r=`echo $cbar $s_bar | awk '{print sqrt(($1)**2+($2)**2)}'`
#echo $r
cv=`echo $r | awk '{print 1-$1}'`
echo "circular variance for the sample:" $cv
v=`echo $r| awk '{print sqrt(-2*log($1))}'`
echo "Total events     Dt         S.D             FD              C.S.D">>result.txt
echo $n"  	      "$t"	"$sig"	 "$phi"	   "$v >>result.txt
more result.txt
#rm -rf abs_fd.txt abs_t.txt del_phi1.txt del_t1.txt w.txt c.txt s.txt cp.txt phi.txt  result.txt
