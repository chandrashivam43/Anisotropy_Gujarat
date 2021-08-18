#!/bin/bash
for file in `ls *RAJ*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^RAJ>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *RUD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^RUD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *SIP*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^SIP>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *SIV*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^SIV>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *SUR*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^SUR>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *SUV*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^SUV>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *TAL*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^TAL>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *THB*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^THB>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *UKI*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^UKI>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *UNA0*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^UNA0>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *VAD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^VAD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *VAL*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^VAL>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *VAM*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^VAM>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *VDD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^VDD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *VER*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^VER>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *VIGH*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^VIGH>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *VRD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^VRD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *ZNK*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^ZNK>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *SUE*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^SUE>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *OVAN*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^OVAN>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *RAD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^RAD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *POB*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^POB>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *NKH*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^NKH>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *NAL*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^NAL>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *NAG*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^NAG>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *MUN*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^MUN>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *MOR*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^MOR>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *MOD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^MOD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *MNG*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^MNG>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *MLA*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^MLA>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *MGL*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^MGL>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *MDV*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^MDV>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *MDP*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^MDP>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *LOD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^LOD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *LKD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^LKD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *LKH*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^LKH>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *LAL*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^LAL>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *KVJ*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^KVJ>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *KEV*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^KEV>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *KAV*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^KAV>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *KAK0*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^KAK>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *KAD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^KAD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *JUN*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^JUN>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *JGI*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^JGI>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *JAG*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^JAG>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *GHU*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^GHU>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *GDS*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^GDS>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *GDD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^GDD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *GAN*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^GAN>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *FAT*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^FAT>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *DWK*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^DWK>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *DUD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^DUD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *DOL*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^DOL>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *DNR*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^DNR>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *DHR*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^DHR>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *DHOR*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^DHOR>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *DHM*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^DHM>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *DEV*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^DEV>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *DES*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^DES>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *CHTV*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^CHTV>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *CHO*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^CHO>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *CHIT*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^CHIT>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *CHA*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^CHA>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *BRD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^BRD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *BNR*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^BNR>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *BHV*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^BHV>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *BHI*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^BHI>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *BHD*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^BHD>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *0BEL*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^0BEL>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *BDR*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^BDR>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *BAV*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^BAV>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *BAN*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^BAN>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *AMR*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^AMR>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *ADW*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^ADW>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *ADS*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^ADS>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
for file in `ls *ADH*`  ##
do
##chnage the station name for each station
cat latlon.txt|grep -i -w ^ADH>output.txt   ##
lat=`cat output.txt|awk -F " " '{print $2}'`
lon=`cat output.txt|awk -F " " '{print $3}'`
ele=`cat output.txt|awk -F " " '{print $4}'`
sac<<!
r ${file}
CHNHDR STLA $lat
wh STLA
CHNHDR STLO $lon
wh STLO
CHNHDR STEL $ele
wh STEL
lh -l STLA STLO STEL
q
!
done
