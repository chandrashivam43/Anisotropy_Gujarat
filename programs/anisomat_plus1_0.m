function []=anisomat_plus1_0(filein,CFRE,PRTS)

% usage []=anisomat_plus(filein,[L H],PRE);
% [L H] : filter bounds (Hz)
% PRE   : Pre-time S window
%
% eg: to analyze 
% 2012.10.17-14.58.31.LA05.E.SAC
% 2012.10.17-14.58.31.LA05.N.SAC
% 2012.10.17-14.58.31.LA05.Z.SAC
%
% type anisomat_plus1_0('2012.10.17-14.58.31.LA05.',[1 10],0.1);
%

% Now using FIGS=1 it produce the particle motion AGAIN

%% SAC INPUT HEADER FIELD NEEDED
% DELTA KSTNM STLA STLO STEL EVLA EVLO EVDP B E A T0
% NZJDAY NZHOUR NZMIN NZSEC 

%%  OUTPUT FILE FORMAT 
% FILENAME EQLON EQLAT EQDEP STAZ STLAT STLON STELE DEG err SPLIT err CC W 
% HDIST RAT DTKM IA BAZ JTIME ODT
%%

close all

if nargin==3
    LP=CFRE(2);
    HP=CFRE(1);
    PRE= PRTS;
elseif nargin==1
    disp('Running with default params');
    LP=12;
    HP=1 ;
    PRE=0.1;
elseif nargin==0
    help anisomat_plus1_0
    return
end
%%

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  PARAMETERS and SWITCHES    %%                        
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DPAR =4;    % Coefficient for duration parameter (should be gt 1)
THDIS=0;    % Teoretical Hypocentral Distance Switch [0/1]
FIGS=1 ;    % Plot figures each elabs [0/1/2]
F   =0 ;    % Fixed Depth [0/1] - Force Anisomat+ to analyze the event
PMARK='A';  % Ptime Marker
SMARK='T0'; % Stime Marker
MAXC=0.0;   % CC Threshold
BANDSEL=0;  % Band of geometrical upcoming wave according to Crampin 1999
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

SW=['K' SMARK];
DUR=DPAR*(1/LP); % 

C=fix(clock);
flog=fopen('Anisomat_plus.log','at');
fprintf(flog,'%s\n','######################');
fprintf(flog,'Elaboration started at : %4d %2d %2d %2d% 2d% 2.0d\n',C(1),C(2),C(3),C(4),C(5),C(6));
fprintf(flog,'Cf 1                   : %3.1f\n',HP);
fprintf(flog,'Cf 2                   : %3.1f\n',LP);
fprintf(flog,'Pretime S (s)          : %4.2f\n',PRE);
fprintf(flog,'Postime S (s)          : %4.2f\n',DUR);
fprintf(flog,'MaxCC                  : %5.3f\n',MAXC);
fprintf(flog,'Filename               : %s\n',filein);
fclose(flog);

D=dir([filein '*']);
if length(D) ~=3
    disp('No 3d data, check components filename')
   return
end

%% FILENAME ACTUALLY READ 
%% 2012.10.21-13.05.01.STAZ.Z.SAC
for k=1:length(D)
    NM=char(D(k).name);
    if strcmp(NM(end-4),'Z')==1
        filex1=NM;
    elseif strcmp(NM(end-4),'N')==1
        filex2=NM;
    elseif  strcmp(NM(end-4),'E')==1
        filex3=NM;
    end
end

filez=rsac(filex1);
Z=filez(:,2);
filen=rsac(filex2);
N=filen(:,2);
filee=rsac(filex3);
E=filee(:,2);

dt  =lh(filee,'DELTA');

STAZ=lh(filee,'KSTNM');
STLAT=lh(filee,'STLA');
STLON=lh(filee,'STLO');
STELE=lh(filee,'STEL')/1000;
EQLAT=lh(filee,'EVLA');
EQLON=lh(filee,'EVLO');
EQDEP=lh(filee,'EVDP')/1000;

if EQDEP < 1;
    EQDEP=EQDEP*1000;
end

%dist=lh(filee,'DIST');
[EDIST,HDIST,BAZ]=delaz(STLAT,STLON,EQLAT,EQLON,(EQDEP+STELE));

BFIL=lh(filee,'B'); END=lh(filee,'E');
JULIAN=lh(filee,'NZJDAY');
ORE=lh(filee,'NZHOUR');
MINUTO=lh(filee,'NZMIN');
SECO=lh(filee,'NZSEC');
TPPICK=lh(filez,PMARK ); %+abs(BFIL);
%TPPOL =lh(filez,PW);
TSPICK=lh(filee,SMARK); %+abs(BFIL);
TSPOL =lh(filee,SW);
if TSPOL==-12345
    TSPOL='';
end

if HDIST > 1000 && THDIS==1
    disp('Using S-to-P')
    VP=5.8; VS=VP/1.8; 
    HDIST=(TSPICK-TPPICK)*((VP*VS)/(VP-VS));
    if HDIST==0
        return
    end
end


 if BFIL > 0 && TPPICK > 0 && TSPICK > 0
     TPPICK=TPPICK-BFIL;
     TSPICK=TSPICK-BFIL;
 elseif BFIL < 0
     TPPICK=TPPICK+abs(BFIL);
     TSPICK=TSPICK+abs(BFIL);
 end

% 
 if TSPOL==-12345
     TSPOL='';
 end
 
 if TSPICK < BFIL || TSPICK > END
%     disp(sprintf('%s - TSPICK = % 6.3f - BFIL= % 6.3f  - END= % 6.3f',filein,TSPICK,BFIL,END));
     fout=fopen('Refused_Bfil_End.out','at');
     fprintf(fout,'%s % 6.3f % 6.3f % 6.3f\n',filein,TSPICK,BFIL,END);
 end
% 

 WL=BFIL+END;
 if (TPPICK > WL && TSPICK > WL)
            return
 end
%%
JTIME=JULIAN+(ORE/24)+(MINUTO/1440)+(SECO/86400);

smp=1/dt;
ZZ=Z-mean(Z);
NN=N-mean(N);
EE=E-mean(E);

EDIST=abs(EDIST);
STELE=abs(STELE);

IANGLE=rad2deg(atan(EDIST./(EQDEP+STELE)));

if F==1 || THDIS==1
    IANGLE=50;
end

%%
if BANDSEL==1
   IMIN=0.001;
   IMAX=60.0;
elseif BANDSEL==2
    IMIN=15.0;
    IMAX=60.0;
elseif BANDSEL==0
   IMIN=0.001;
    IMAX=60   ;
end


if IANGLE < IMIN || IANGLE > IMAX
    flog=fopen('Anisomat_plus.log','at');
    fprintf(flog,'%s - Angle outside the range - (ANG=%2d DIST=%2d DEP=%2d)\n',filein,round(IANGLE),round(EDIST),round(EQDEP));
    fclose(flog);
return
end


[ZZ,junk,junk,junk]=bandpass(ZZ,smp,HP,LP,4,2,'butter');
[NN,junk,junk,junk]=bandpass(NN,smp,HP,LP,4,2,'butter');
[EE,junk,junk,junk]=bandpass(EE,smp,HP,LP,4,2,'butter');
WS=TSPOL(4);
if strcmp(WS,'0')==1 || strcmp(WS,'1')==1  || strcmp(WS,'2')==1 || strcmp(WS,'3') || strcmp(WS,'4') 
    CHKS=1;
else
    CHKS=0;
end

CHKS=1; %% get all S weigth

if TSPICK > 0  && CHKS >0
    INICUT=TSPICK-PRE;
    ENDCUT=TSPICK+DUR;
    SMPINI=fix(INICUT*smp);
    SMPEND=fix(ENDCUT*smp);
    SMPTSPICK=fix(TSPICK*smp);
    ISEL=0.25;  
        is=SMPTSPICK ;
        ii=fix(ISEL/dt);
        i1=is-2.*ii-5; 
        i2=is+2.*ii+5; 
        rmspn=sum(NN(i1:is-5).^2); 
        rmspe=sum(EE(i1:is-5).^2); 
        rmsp=(rmspn+rmspe)/2;
        rmssn=sum(NN(is+5:i2).^2);
        rmsse=sum(EE(is+5:i2).^2);
        rmss=(rmssn+rmsse)/2;
%        subplot(211); plot (NN(i1:i2));
%        subplot(212); plot (NN(i1:is-5));
%        hold on
%        plot(NN(is+5:i2),'r');
        if((rmss/rmsp) <4)
           flog=fopen('Anisomat_plus.log','at');
            fprintf(flog,'Discarded ** %s - S/N < 4 (%3.1f)\n',filein,rmss./rmsp);
            fclose(flog);
            % disp(sprintf('S/N < 4 (%3.1f)',rmss./rmsp))
            return
        end

    ZZ=ZZ(SMPINI:SMPEND);
    NN=NN(SMPINI:SMPEND);
    EE=EE(SMPINI:SMPEND);

        rat=raten(ZZ,NN,EE,dt);

%%
    TIME=linspace(0,length(ZZ)*dt,length(ZZ));
    if FIGS==2
        figure(100)
        h=gcf;set(h,'Position',[23 250 1218 465]);
        XLINE=PRE;
        YLINE=[max(ZZ) max(NN) max(EE)];
        title('Filtered window')
        subplot (321), plot (TIME,ZZ); axis tight; xlabel('z');line ([XLINE XLINE],[-YLINE(1) YLINE(1)])
        subplot (323), plot (TIME,NN); axis tight; xlabel('n');line ([XLINE XLINE],[-YLINE(2) YLINE(2)])
        subplot (325), plot (TIME,EE); axis tight; xlabel('e');line ([XLINE XLINE],[-YLINE(3) YLINE(3)])
        xlabel ('Time (s)')
        ylabel ('Amplitude')
        pause
    end

else
            flog=fopen('Anisomat_plus.log','at');
            fprintf(flog,'Discarded ** %s - low Sweight: time= %5.3f - W=%s\n',filein,TSPICK,TSPOL);
            fclose(flog);
    return
end

XC=zeros((length(NN)*2)-1,180);
for AZ=1:1:180;
    [R,T] =ruotacomp(EE,NN,AZ);
    [C,LAGS] =xcorr(R,T,'coeff');
    XC(:,AZ)=C;
end

J=length(R); % 
[i,j]=max(max(XC));
VALMAX=i;
k=find(XC(:,j)==VALMAX);
DEGMAX=j;
LAGMAX=k;

[m,n]=min(min(XC));
VALMIN=m;
l=find(XC(:,n)==VALMIN);
DEGMIN=n;
LAGMIN=l;

if LAGMAX < J
    DEG=DEGMAX;
    LAG=LAGMAX;
    VAL=VALMAX;
else
    DEG=DEGMIN;
    LAG=LAGMIN;
    VAL=VALMIN;
end

OXC=XC(:,DEG);
[OVERSHIFT]=resacc(DEG,LAG,OXC);
%%
SHIFT=LAGS(LAG);
KK=SHIFT;
LS=length(EE);
VECT=zeros(length(EE)+50,1);
if KK > 0
    [F,S]=ruotacomp(EE,NN,DEG);
    SHIFT=SHIFT;
    NS=S;
    NF=VECT;
    NF(1:LS-SHIFT)=F(SHIFT+1:LS);
    NF=NF(1:LS);
elseif KK < 0
    [F,S]=ruotacomp(EE,NN,DEG);
    NF=F;
    NS=VECT;
    SHIFT=-SHIFT;
    NS(1:LS-SHIFT)=S(SHIFT+1:LS);
    NS=NS(1:LS);
elseif KK==0
    F=EE;
    S=NN;
    NF=EE;
    NS=NN;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[W,erdeg,erlag]=errest(DEG,LAG,XC,dt);
filez=filex1;
if abs(VAL) > MAXC
    
    DTKM=(SHIFT*dt)/HDIST; ODT=(SHIFT+(LAG-OVERSHIFT))*dt;
    if ODT < 0
        ODT=0;
    end
    TIME=linspace(0,length(ZZ)*dt,length(ZZ));

    if FIGS==2
        figure(100)
        XLINE=PRE;
        YLINE=[max(ZZ) max(NN) max(EE)];

        subplot (322), plot (TIME,NN); axis tight; xlabel('N-E');line ([XLINE XLINE],[-YLINE(2) YLINE(2)])
        hold on
        subplot (322), plot (TIME,EE,'r'); axis tight

        subplot (324), plot (TIME,F); axis tight; xlabel('F-S');line ([XLINE XLINE],[-YLINE(2) YLINE(2)])
        hold on
        subplot (324), plot (TIME,S,'r'); axis tight;

        subplot (326), plot (TIME,NF); axis tight; xlabel('Corrected F-S')
        hold on
        subplot (326), plot (TIME,NS,'r'); axis tight
        pause
    end


    fout=fopen([STAZ(1:4) '_anisomat_plus_Nov_2012.out'],'at');
    fprintf(fout,'%s %8.5f %8.5f %8.5f %s %8.5f %8.5f %8.5f % 5.0f % 5.1f %4.3f %4.3f %5.4f %8.5f %8.5f % 6.2f %8.5f % 4.0f % 4.0f %9.6f %10.7f\n',...
       filein,EQLON,EQLAT,EQDEP,STAZ,STLAT,STLON,STELE,DEG,erdeg,SHIFT*dt,erlag*dt,...
       abs(VAL),W,HDIST,rat,DTKM,round(IANGLE),round(BAZ),JTIME,ODT);
    fclose (fout);
    disp ('Results saved ')
end
fclose('all');


       if FIGS==1
           figure(8)
           h=gcf;
           set (h,'Position',[8 32 1011 656])
           subplot (311), plot (TIME,F),xlabel ('F and S bf corr'), grid,axis tight,title (filez);
           hold on; subplot (311), plot (TIME,S,'r')
           axis tight
           subplot (312), plot (TIME,NF),grid,axis tight
           hold on; subplot (312), plot (TIME,NS,'r')
           axis tight
           subplot (325), surf(XC);colormap autumn; colorbar
           shading flat;
           view(0,90)
           axis tight
           hold on
           cont=0:.3:2;
           cont=cont-1;
           [junk,t]=contour3(XC,cont);
           set(t,'Edgecolor',[.1 .1 .1],'LineWidth',[0.3]);
           k=find(XC(:,j)==VAL);
           plot3(DEG,LAG,1,'ob','MarkerSize',8,'MarkerFaceColor','Blue')
           xlabel('Degrees')
           ylabel('LAG (samples)')
           subplot(326)
           plot(NF,NS);
           axis square
           minf=min(NF);
           manf=max(NF);
           mins=min(NS);
           mans=max(NS);
           LIM=[minf manf mins mans];
           xlim([-max(LIM) max(LIM)]);
           ylim([-max(LIM) max(LIM)]);
           
           STR=sprintf('DEG=%d - SHIFT=%4.3f s (%d) - XCORR=%4.3f',DEG,SHIFT*dt,SHIFT,VAL);
           title(STR)
        end


%% END OF MAIN CODE 
       
%%       
function rat=raten(ZZ,NN,EE,dt)

% usage: rat=raten(ZZ,NN,EE);
%Davide Piccinini - Aprile 2000

VERT=abs(ZZ);
HORZ=sqrt(NN.^2+EE.^2);


VERT=tapera(VERT,10);
HORZ=tapera(HORZ,10);
 
 
 EVERT=trapz(VERT)*dt;
 EHORZ=trapz(HORZ)*dt;
 rat=(EHORZ/EVERT);

%%
 function vout=tapera(vin,n)
%usage : vout=tapera(vin,n)
%Davide Piccinini - Aprile 2000


[r,c]=size(vin);

if r < c
   vin=vin';
end

t=hanning(n*2);
ti=t(1:n);
tf=t(n+1:n*2);
l=length(vin);
vout=vin;
vout(1:n)=vin(1:n).*ti;
vout(l-(n-1):l)=vin(l-(n-1):l).*tf;


%%
function [R,T] = ruotacomp (E,N,BAZ)


BAZ=BAZ*pi/180; % conversione gradi-radianti.


R= -E.*sin(BAZ) -N.*cos (BAZ);
T= -E.*cos(BAZ) +N.*sin (BAZ);

%%
function deg=rad2deg(rad)
deg=rad.*180./pi;

%%
function [W,erdeg,erlag]=errest(DEG,LAG,XC,dt)


VAL=XC(LAG,DEG);
DELT=0.05;
if VAL < 0 
   LIMIT=VAL+DELT;
else
   LIMIT=VAL-DELT;
end

% [C,junk]=contour(XC,LIMIT);
[C,junk]=contour(XC,[LIMIT LIMIT]);
DX=C(1,:);
DY=C(2,:);

iy=find(DX==DEG);
erlag=abs((DY(iy(1))-DY(iy(2)))/2);

ix= round(DY.*10)==LAG.*10;
erdeg=min(abs(DEG-DX(ix)));

if erdeg==0 
    erdeg=1;
end
if erlag==0
    erlag=1;
end
    
MAXERDEG=30 ; 
MAXERLAG=0.4; 
DEGERR=1/((erdeg)/MAXERDEG);
LAGERR=1/((ceil(erlag)*dt)/MAXERLAG);
W1=((DEGERR+LAGERR)/80)*40/160;
W2=abs(VAL)*120/160;
W =W1+W2;
close

%% 
function [OVERSHIFT]=resacc(junk,LAG,OXC)

CC=OXC;
PORT=CC(LAG-2:LAG+2);
P = polyfit(LAG-2:LAG+2,PORT',2);
X=LAG-2:0.001:LAG+2;
Y=((X.^2)*P(1))+(X*P(2))+P(3);

[i,j]=max(Y);
OVALMAX=i;
OLAGMAX=j;

[m,n]=min(Y);
OVALMIN=m;
OLAGMIN=n;

if abs(OVALMAX) > abs(OVALMIN)
    OLAG=OLAGMAX;
else
    OLAG=OLAGMIN;
end
OVERSHIFT=X(OLAG);

%%
function [varargout] = rsac(varargin)

for nrecs = 1:nargin

  sacfile = varargin{nrecs};

%---------------------------------------------------------------------------
%    Default byte-order
%    endian  = 'big'  big-endian byte order (e.g., UNIX)
%            = 'lil'  little-endian byte order (e.g., LINUX)

endian = 'lil';

if endian == 'big'
  fid = fopen(sacfile,'r','ieee-be'); 
elseif endian == 'lil'
  fid = fopen(sacfile,'r','ieee-le'); 
end


h=zeros(1,302);
% read in single precision real header variables:
%---------------------------------------------------------------------------
for i=1:70
  h(i) = fread(fid,1,'single');
end

% read in single precision integer header variables:
%---------------------------------------------------------------------------
for i=71:105
  h(i) = fread(fid,1,'int32');
end

% read in logical header variables
%---------------------------------------------------------------------------
for i=106:110
  h(i) = fread(fid,1,'int32');
end

% read in character header variables
%---------------------------------------------------------------------------
for i=111:302
  h(i) = (fread(fid,1,'char'))';
end

% read in amplitudes
%---------------------------------------------------------------------------

YARRAY     = fread(fid,'single');

if h(106) == 1
  XARRAY = (linspace(h(6),h(7),h(80)))'; 
   for kkk=1:h(80)
     XARRAY(kkk) = h(6) + kkk*h(1); 
   end
    XARRAY = XARRAY'; %<<<<<<<<<<<<<<=========== FACEVA ERRORE
else
  error('LEVEN must = 1; SAC file not evenly spaced')
end 

% add header signature for testing files for SAC format
%---------------------------------------------------------------------------
h(303) = 77;
h(304) = 73;
h(305) = 75;
h(306) = 69;

% arrange output files
%---------------------------------------------------------------------------
% size(XARRAY)
% size(YARRAY)
%% correct one sample difference
XARRAY=XARRAY(1:length(YARRAY));


OUTPUT(:,1) = XARRAY;
OUTPUT(:,2) = YARRAY;
OUTPUT(1:306,3) = h(1:306)';

%pad xarray and yarray with NaN if smaller than header field
if h(80) < 306
  OUTPUT((h(80)+1):306,1) = NaN;
  OUTPUT((h(80)+1):306,2) = NaN;
end

fclose(fid);

varargout{nrecs} = OUTPUT;

end

%%
function [varargout] = lh(file,varargin)

% first test to see if the file is indeed a sacfile
%---------------------------------------------------------------------------
if (file(303,3)~=77 && file(304,3)~=73 && file(305,3)~=75 && file(306,3)~=69)
  error('Specified Variable is not in SAC format ...')
end

h(1:306) = file(1:306,3); 


% read real header variables
%---------------------------------------------------------------------------
DELTA = h(1);
if (h(1) ~= -12345 && nargin == 1); disp(sprintf('DELTA      = %0.8g',h(1))); end
DEPMIN = h(2);
if (h(2) ~= -12345 && nargin == 1); disp(sprintf('DEPMIN     = %0.8g',h(2))); end
DEPMAX = h(3);
if (h(3) ~= -12345 && nargin == 1); disp(sprintf('DEPMAX     = %0.8g',h(3))); end
SCALE = h(4);
if (h(4) ~= -12345 && nargin == 1);  disp(sprintf('SCALE      = %0.8g',h(4))); end
ODELTA = h(5);
if (h(5) ~= -12345 && nargin == 1);  disp(sprintf('ODELTA     = %0.8g',h(5))); end
B = h(6);
if (h(6) ~= -12345 && nargin == 1); disp(sprintf('B          = %0.8g',h(6))); end
E = h(7);
if (h(7) ~= -12345 && nargin == 1); disp(sprintf('E          = %0.8g',h(7))); end
O = h(8);
if (h(8) ~= -12345 && nargin == 1); disp(sprintf('O          = %0.8g',h(8))); end 
A = h(9);
if (h(9) ~= -12345 && nargin == 1); disp(sprintf('A          = %0.8g',h(9))); end 
T0 = h(11);
if (h(11) ~= -12345 && nargin == 1); disp(sprintf('T0         = %0.8g',h(11))); end
T1 = h(12);
if (h(12) ~= -12345 && nargin == 1); disp(sprintf('T1         = %0.8g',h(12))); end
T2 = h(13);
if (h(13) ~= -12345 && nargin == 1); disp(sprintf('T2         = %0.8g',h(13))); end
T3 = h(14);
if (h(14) ~= -12345 && nargin == 1); disp(sprintf('T3         = %0.8g',h(14))); end
T4 = h(15);
if (h(15) ~= -12345 && nargin == 1); disp(sprintf('T4         = %0.8g',h(15))); end
T5 = h(16);
if (h(16) ~= -12345 && nargin == 1); disp(sprintf('T5         = %0.8g',h(16))); end
T6 = h(17);
if (h(17) ~= -12345 && nargin == 1); disp(sprintf('T6         = %0.8g',h(17))); end
T7 = h(18);
if (h(18) ~= -12345 && nargin == 1); disp(sprintf('T7         = %0.8g',h(18))); end
T8 = h(19);
if (h(19) ~= -12345 && nargin == 1); disp(sprintf('T8         = %0.8g',h(19))); end
T9 = h(20);
if (h(20) ~= -12345 && nargin == 1); disp(sprintf('T9         = %0.8g',h(20))); end
F = h(21);
if (h(21) ~= -12345 && nargin == 1); disp(sprintf('F          = %0.8g',h(21))); end 
RESP0 = h(22);
if (h(22) ~= -12345 && nargin == 1); disp(sprintf('RESP0      = %0.8g',h(22))); end
RESP1 = h(23);
if (h(23) ~= -12345 && nargin == 1); disp(sprintf('RESP1      = %0.8g',h(23))); end
RESP2 = h(24);
if (h(24) ~= -12345 && nargin == 1); disp(sprintf('RESP2      = %0.8g',h(24))); end
RESP3 = h(25);
if (h(25) ~= -12345 && nargin == 1); disp(sprintf('RESP3      = %0.8g',h(25))); end
RESP4 = h(26);
if (h(26) ~= -12345 && nargin == 1); disp(sprintf('RESP4      = %0.8g',h(26))); end
RESP5 = h(27);
if (h(27) ~= -12345 && nargin == 1); disp(sprintf('RESP5      = %0.8g',h(27))); end
RESP6 = h(28);
if (h(28) ~= -12345 && nargin == 1); disp(sprintf('RESP6      = %0.8g',h(28))); end
RESP7 = h(29);
if (h(29) ~= -12345 && nargin == 1); disp(sprintf('RESP7      = %0.8g',h(29))); end
RESP8 = h(30);
if (h(30) ~= -12345 && nargin == 1); disp(sprintf('RESP8      = %0.8g',h(30))); end
RESP9 = h(31);
if (h(31) ~= -12345 & nargin == 1); disp(sprintf('RESP9      = %0.8g',h(31))); end
STLA = h(32);
if (h(32) ~= -12345 && nargin == 1); disp(sprintf('STLA       = %0.8g',h(32))); end
STLO = h(33);
if (h(33) ~= -12345 && nargin == 1); disp(sprintf('STLO       = %0.8g',h(33))); end
STEL = h(34);
if (h(34) ~= -12345 && nargin == 1); disp(sprintf('STEL       = %0.8g',h(34))); end
STDP = h(35);
if (h(35) ~= -12345 && nargin == 1); disp(sprintf('STDP       = %0.8g',h(35))); end
EVLA = h(36);
if (h(36) ~= -12345 && nargin == 1); disp(sprintf('EVLA       = %0.8g',h(36))); end
EVLO = h(37);
if (h(37) ~= -12345 && nargin == 1); disp(sprintf('EVLO       = %0.8g',h(37))); end
EVEL = h(38);
if (h(38) ~= -12345 && nargin == 1); disp(sprintf('EVEL       = %0.8g',h(38))); end
EVDP = h(39);
if (h(39) ~= -12345 && nargin == 1); disp(sprintf('EVDP       = %0.8g',h(39))); end
MAG = h(40);
if (h(40) ~= -12345 && nargin == 1); disp(sprintf('MAG        = %0.8g',h(40))); end 
USER0 = h(41);
if (h(41) ~= -12345 && nargin == 1); disp(sprintf('USER0      = %0.8g',h(41))); end
USER1 = h(42);
if (h(42) ~= -12345 && nargin == 1); disp(sprintf('USER1      = %0.8g',h(42))); end
USER2 = h(43);
if (h(43) ~= -12345 && nargin == 1); disp(sprintf('USER2      = %0.8g',h(43))); end
USER3 = h(44);
if (h(44) ~= -12345 && nargin == 1); disp(sprintf('USER3      = %0.8g',h(44))); end
USER4 = h(45);
if (h(45) ~= -12345 && nargin == 1); disp(sprintf('USER4      = %0.8g',h(45))); end
USER5 = h(46);
if (h(46) ~= -12345 && nargin == 1); disp(sprintf('USER5      = %0.8g',h(46))); end
USER6 = h(47);
if (h(47) ~= -12345 && nargin == 1); disp(sprintf('USER6      = %0.8g',h(47))); end
USER7 = h(48);
if (h(48) ~= -12345 && nargin == 1); disp(sprintf('USER7      = %0.8g',h(48))); end
USER8 = h(49);
if (h(49) ~= -12345 && nargin == 1);  disp(sprintf('USER8     = %0.8g',h(49))); end
USER9 = h(50);
if (h(50) ~= -12345 && nargin == 1); disp(sprintf('USER9      = %0.8g',h(50))); end
DIST = h(51);
if (h(51) ~= -12345 && nargin == 1); disp(sprintf('DIST       = %0.8g',h(51))); end 
AZ = h(52);
if (h(52) ~= -12345 && nargin == 1); disp(sprintf('AZ         = %0.8g',h(52))); end 
BAZ = h(53);
if (h(53) ~= -12345 && nargin == 1); disp(sprintf('BAZ        = %0.8g',h(53))); end
GCARC = h(54);
if (h(54) ~= -12345 && nargin == 1); disp(sprintf('GCARC      = %0.8g',h(54))); end
DEPMEN = h(57);
if (h(57) ~= -12345 && nargin == 1); disp(sprintf('DEPMEN     = %0.8g',h(57))); end
CMPAZ = h(58);
if (h(58) ~= -12345 && nargin == 1); disp(sprintf('CMPAZ      = %0.8g',h(58))); end
CMPINC = h(59);
if (h(59) ~= -12345 && nargin == 1); disp(sprintf('CMPINC     = %0.8g',h(59))); end
XMINIMUM = h(60);
if (h(60) ~= -12345 && nargin == 1); disp(sprintf('XMINIMUM   = %0.8g',h(60))); end
XMAXIMUM = h(61);
if (h(61) ~= -12345 && nargin == 1); disp(sprintf('XMAXIMUM   = %0.8g',h(61))); end
YMINIMUM = h(62);
if (h(62) ~= -12345 && nargin == 1); disp(sprintf('YMINIMUM   = %0.8g',h(62))); end
YMAXIMUM = h(63);
if (h(63) ~= -12345 && nargin == 1); disp(sprintf('YMAXIMUM   = %0.8g',h(63))); end

% read integer header variables
%---------------------------------------------------------------------------
NZYEAR = round(h(71));
if (h(71) ~= -12345 && nargin == 1); disp(sprintf('NZYEAR     = %d',h(71))); end
NZJDAY = round(h(72));
if (h(72) ~= -12345 && nargin == 1); disp(sprintf('NZJDAY     = %d',h(72))); end
NZHOUR = round(h(73));
if (h(73) ~= -12345 && nargin == 1); disp(sprintf('NZHOUR     = %d',h(73))); end
NZMIN = round(h(74));
if (h(74) ~= -12345 && nargin == 1); disp(sprintf('NZMIN      = %d',h(74))); end
NZSEC = round(h(75));
if (h(75) ~= -12345 && nargin == 1); disp(sprintf('NZSEC      = %d',h(75))); end
NZMSEC = round(h(76));
if (h(76) ~= -12345 && nargin == 1); disp(sprintf('NZMSEC     = %d',h(76))); end
NVHDR = round(h(77));
if (h(77) ~= -12345 && nargin == 1); disp(sprintf('NVHDR      = %d',h(77))); end
NORID = round(h(78));
if (h(78) ~= -12345 && nargin == 1); disp(sprintf('NORID      = %d',h(78))); end
NEVID = round(h(79));
if (h(79) ~= -12345 && nargin == 1); disp(sprintf('NEVID      = %d',h(79))); end
NPTS = round(h(80));
if (h(80) ~= -12345 && nargin == 1); disp(sprintf('NPTS       = %d',h(80))); end
NWFID = round(h(82));
if (h(82) ~= -12345 && nargin == 1); disp(sprintf('NWFID      = %d',h(82))); end
NXSIZE = round(h(83));
if (h(83) ~= -12345 && nargin == 1); disp(sprintf('NXSIZE     = %d',h(83))); end
NYSIZE = round(h(84));
if (h(84) ~= -12345 && nargin == 1); disp(sprintf('NYSIZE     = %d',h(84))); end
IFTYPE = round(h(86));
if (h(86) ~= -12345 && nargin == 1); disp(sprintf('IFTYPE     = %d',h(86))); end
IDEP = round(h(87));
if (h(87) ~= -12345 && nargin == 1); disp(sprintf('IDEP       = %d',h(87))); end
IZTYPE = round(h(88));
if (h(88) ~= -12345 && nargin == 1); disp(sprintf('IZTYPE     = %d',h(88))); end
IINST = round(h(90));
if (h(90) ~= -12345 && nargin == 1); disp(sprintf('IINST      = %d',h(90))); end
ISTREG = round(h(91));
if (h(91) ~= -12345 && nargin == 1); disp(sprintf('ISTREG     = %d',h(91))); end
IEVREG = round(h(92));
if (h(92) ~= -12345 && nargin == 1); disp(sprintf('IEVREG     = %d',h(92))); end
IEVTYP = round(h(93));
if (h(93) ~= -12345 && nargin == 1); disp(sprintf('IEVTYP     = %d',h(93))); end
IQUAL = round(h(94));
if (h(94) ~= -12345 && nargin == 1); disp(sprintf('IQUAL      = %d',h(94))); end
ISYNTH = round(h(95));
if (h(95) ~= -12345 && nargin == 1); disp(sprintf('ISYNTH     = %d',h(95))); end
IMAGTYP = round(h(96));
if (h(96) ~= -12345 && nargin == 1); disp(sprintf('IMAGTYP    = %d',h(96))); end
IMAGSRC = round(h(97));
if (h(97) ~= -12345 && nargin == 1); disp(sprintf('IMAGSRC    = %d',h(97))); end

%read logical header variables
%---------------------------------------------------------------------------
LEVEN = round(h(106));
if (h(106) ~= -12345 && nargin == 1); disp(sprintf('LEVEN      = %d',h(106))); end
LPSPOL = round(h(107));
if (h(107) ~= -12345 && nargin == 1); disp(sprintf('LPSPOL     = %d',h(107))); end
LOVROK = round(h(108));
if (h(108) ~= -12345 && nargin == 1); disp(sprintf('LOVROK     = %d',h(108))); end
LCALDA = round(h(109));
if (h(109) ~= -12345 && nargin == 1); disp(sprintf('LCALDA     = %d',h(109))); end

%read character header variables
%---------------------------------------------------------------------------
KSTNM = char(h(111:118));
if (str2double(KSTNM) ~= -12345 && nargin == 1); disp(sprintf('KSTNM      = %s', KSTNM)); end
KEVNM = char(h(119:134));
if (str2double(KEVNM) ~= -12345 && nargin == 1); disp(sprintf('KEVNM      = %s', KEVNM)); end
KHOLE = char(h(135:142));
if (str2double(KHOLE) ~= -12345 && nargin == 1); disp(sprintf('KHOLE      = %s', KHOLE)); end
KO = char(h(143:150));
if (str2double(KO) ~= -12345 && nargin == 1); disp(sprintf('KO         = %s', KO)); end
KA = char(h(151:158));
if (str2double(KA) ~= -12345 && nargin == 1); disp(sprintf('KA         = %s', KA)); end
KT0 = char(h(159:166));
if (str2double(KT0) ~= -12345 && nargin == 1); disp(sprintf('KT0        = %s', KT0)); end
KT1 = char(h(167:174));
if (str2double(KT1) ~= -12345 && nargin == 1); disp(sprintf('KT1        = %s', KT1)); end
KT2 = char(h(175:182));
if (str2double(KT2) ~= -12345 && nargin == 1); disp(sprintf('KT2        = %s', KT2)); end
KT3 = char(h(183:190));
if (str2double(KT3) ~= -12345 && nargin == 1); disp(sprintf('KT3        = %s', KT3)); end
KT4 = char(h(191:198));
if (str2double(KT4) ~= -12345 && nargin == 1); disp(sprintf('KT4        = %s', KT4)); end
KT5 = char(h(199:206));
if (str2double(KT5) ~= -12345 && nargin == 1); disp(sprintf('KT5        = %s', KT5)); end
KT6 = char(h(207:214));
if (str2double(KT6) ~= -12345 && nargin == 1); disp(sprintf('KT6        = %s', KT6)); end
KT7 = char(h(215:222));
if (str2double(KT7) ~= -12345 && nargin == 1); disp(sprintf('KT7        = %s', KT7)); end
KT8 = char(h(223:230));
if (str2double(KT8) ~= -12345 && nargin == 1); disp(sprintf('KT8        = %s', KT8)); end
KT9 = char(h(231:238));
if (str2double(KT9) ~= -12345 && nargin == 1); disp(sprintf('KT9        = %s', KT9)); end
KF = char(h(239:246));
if (str2double(KF) ~= -12345 && nargin == 1); disp(sprintf('KF         = %s', KF)); end
KUSER0 = char(h(247:254));
if (str2double(KUSER0) ~= -12345 && nargin == 1); disp(sprintf('KUSER0     = %s', KUSER0)); end
KUSER1 = char(h(255:262));
if (str2double(KUSER1) ~= -12345 && nargin == 1); disp(sprintf('KUSER1     = %s', KUSER1)); end
KUSER2 = char(h(263:270));
if (str2double(KUSER2) ~= -12345 && nargin == 1); disp(sprintf('KUSER2     = %s', KUSER2)); end
KCMPNM = char(h(271:278));
if (str2double(KCMPNM) ~= -12345 && nargin == 1); disp(sprintf('KCMPNM     = %s', KCMPNM)); end
KNETWK = char(h(279:286));
if (str2double(KNETWK) ~= -12345 && nargin == 1); disp(sprintf('KNETWK     = %s', KNETWK)); end
KDATRD = char(h(287:294));
if (str2double(KDATRD) ~= -12345 && nargin == 1); disp(sprintf('KDATRD     = %s', KDATRD)); end
KINST = char(h(295:302));
if (str2double(KINST) ~= -12345 && nargin == 1); disp(sprintf('KINST      = %s', KINST)); end


if nargin > 1
  for nrecs = 1:(nargin-1);
    varargout{nrecs} = eval(varargin{nrecs});
  end
end


%%
function [EDIST,HDIST,BAZ]=delaz(STLAT,STLON,EQLAT,EQLON,EQDEP)

c  = cos(pi*(EQLON-STLON)./180);
cc = cos(pi.*EQLAT./180)*cos(pi.*STLAT./180).*c+sin(pi.*EQLAT./180)*sin(pi.*STLAT./180) ;
EDIST = 6371 .* atan2( sqrt(1-cc.^2),cc) ;
HDIST = sqrt(EDIST.^2 + EQDEP.^2) ;


BAZ = -999 ;
if ~ ((abs(abs(EQLON-STLON)-180) < 0.000001 && abs(EQLAT+STLAT) < 0.000001)...
        || (abs(EQLON-STLON) < 0.000001 && abs(EQLAT-STLAT) < 0.000001))  

      s = sin(pi.*(EQLON-STLON)./180) ;
      ss = cos(pi.*EQLAT./180).*s ;
      cc = cos(pi.*STLAT./180) * sin(pi.*EQLAT./180)-sin(pi.*STLAT./180) * cos(pi.*EQLAT./180).* c ;
      BAZ = 180.*atan2(ss,cc)./pi ;
      
      if BAZ < 0
          BAZ=BAZ+360;
      end
end


%%
function defval(name,value)

if ~ischar(name),
  error('The first argument of defval has to be a string (variable name)');
end

si=1;
if evalin('caller',[ 'exist(''' name ''')']);
  si=evalin('caller',[ 'isempty(' name ')']);
end
if si,
  assignin('caller',name,value);
  na=dbstack;
  %disp(['Default value used in ' na(2).name ': ' name '=' num2str(value(1,:))])
end

%%
function [xf,co,npol,npas,tipe,HABS2,F,EPB]=...
    bandpass(x,Fs,colo,cohi,npol,npas,tipe)


defval('npol',2)
defval('npas',1)
defval('colo',0.05)
defval('cohi',0.50)
defval('Fs',110)
defval('tipe','butter')

Wn=2*[colo cohi]/Fs;

if Wn(2)>=1
  Wn(2)=0.99;
  warning('Frequencies adjusted to keep within the Nyquist rate')
end

if diff(Wn)<0.01
  warning(sprintf('%s\n%s\n%s\n%s',...
  ['Situations that seem to require an exceptionally narrow band'],...
  ['filter can be handled more reliably by decimation, filtering'],...
  ['with a filter of more  moderate band width, and interpolation'],...
  ['to the original sampling rate. (SAC manual)']))
end

[B,A]=feval(tipe,npol,Wn);

[H,F]=freqz(B,A,512,Fs);
HABS2=abs(H).^2;

xf=filter(B,A,detrend(x(:)));

if npas==2
  xf=flipud(filter(B,A,detrend(flipud(xf(:)))));  
  HABS2=HABS2.^2;
end

warning off
warning on

co=[colo cohi];

