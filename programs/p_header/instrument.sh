for file in `ls *BAN* *AMR* *BEL* *BHV* *BHI* *CHO* *DHM* *DES* *DWK* *GDD* *JUN* *KAD* *SIV* *KAK* *KAV* *LAL* *MOR* *RAD* *RAJ* *SIP* *SUR* *SUV* *UKI* *VAL* *UNA* *BRD* *CHI* *DES* *JGI* *NAL* *VAL* *SUE*`
do 
#removing the instrument response from the sac file using sac promt
#the result depends on selected time "window"(range).The mean amplitude in  window must be close to zero to do standard instrument response removal
#try removing the mean (command :- rmean)
#removing the trend (command:- rtr)
#at the end we can use ppk instead of p to overall change 
pfile=cmg3t
#sac<<!
#r $file
#bd x
#qdp off
#p
#transfer from polezero subtype ${pfile} to none
#p
#ydiv poweroff
#xdiv poweroff
#!
sac<<!
r $file
bd x
qdp off
transfer from polezero subtype ${pfile} to none
ydiv poweroff
xdiv poweroff
!
done 

for file in `ls *BDR* *VAM* *OVAN*`
do 
pfile=cmg3t_2
sac<<!
r $file
bd x
qdp off
transfer from polezero subtype ${pfile} to none
ydiv poweroff
xdiv poweroff
!
done 

