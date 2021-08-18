for file in `ls *SAC*`
do
slat=`sac<<! |grep STLA| awk -F" " '{print $3}'
r $file
lh STLA
q
!`

slon=`sac<<! |grep STLO| awk -F" " '{print $3}'
r $file
lh STLO
q
!`

In=`sac<<! |grep CMPINC| awk -F" " '{print $3}'
r $file
lh CMPINC
q
!`
elat=`sac<<! |grep EVLA| awk -F" " '{print $3}'
r $file
lh EVLA
q
!`

elon=`sac<<! |grep EVLO| awk -F" " '{print $3}'
r $file
lh EVLO
q
!`
edep=`sac<<! |grep EVDP| awk -F" " '{print $3}'
r $file
lh EVDP
q
!`
T0mrk=`sac<<! |grep T0MARKER| awk -F" " '{print $3}'
r $file
lh T0MARKER
q
!`
Amrk=`sac<<! |grep AMARKER| awk -F" " '{print $3}'
r $file
lh AMARKER
q
!`
DELTA=`sac<<! |grep DELTA| awk -F" " '{print $3}'
r $file
lh DELTA
q
!`
B=`sac<<! |grep B| awk -F" " '{print $3}'
r $file
lh B
q
!`
E=`sac<<! |grep E| awk -F" " '{print $3}'
r $file
lh E
q
!`
NZJDAY=`sac<<! |grep NZJDAY| awk -F" " '{print $3}'
r $file
lh NZJDAY
q
!`
NZHOUR=`sac<<! |grep NZHOUR| awk -F" " '{print $3}'
r $file
lh NZHOUR
q
!`
NZMIN=`sac<<! |grep NZMIN| awk -F" " '{print $3}'
r $file
lh NZMIN
q
!`
NZSEC=`sac<<! |grep NZSEC| awk -F" " '{print $3}'
r $file
lh NZSEC
q
!`
KSTNM=`sac<<! |grep KSTNM| awk -F" " '{print $3}'
r $file
lh KSTNM
q
!`
STEL=`sac<<! |grep STEL| awk -F" " '{print $3}'
r $file
lh STEL
q
!`

echo $file
echo Station Latitude = $slat
echo Station Longitude = $slon
echo station elevation = $STEL
echo DELTA = $DELTA
echo station name = $KSTNM
echo B = $B
echo E = $E
echo incidence angle = $In
echo Event Depth = $edep
echo Event Latitude = $elat
echo Event Longitude = $elon
echo T0MARKER s marker = $T0mrk
echo Pmarker = $Amrk
echo NZJDAY = $NZJDAY
echo NZHOUR = $NZHOUR
echo NZMIN = $NZMIN
echo NZSEC = $NZSEC
echo -------"to change header CHNHDR = value"------------------
sac<<!
r ${file}
ppk
wh a t0
q
!
done


