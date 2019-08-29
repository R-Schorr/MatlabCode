tic
clc,clear

%Conversion Factors For Canonical Units To SI from BM&W Book because
%apparently we have to cite sources
SU=7.90536828;
ANGULAR_ROTATION=7.292115856*10^-5;
DEG=pi()/180;
TU=806.8118744;

%Givens from the problem
RE=6378;
RM=1738;
RSOI=66184;
D=384400;
MUE=3.986*10^5;
MUM=4.9028*10^3;
OMG_MOON=2.6491*10^-6;

%Convert the Unbelievers
RE_CU=RE/RE;
RSOI_CU=RSOI/RE;
D_CU=D/RE;

%Starting Altitude Conversion to CU from SI
CPO_R=185+RE;
CPO_R_CU=CPO_R/RE;

%Final Desired Altitude above Moon
PS_R=120;
PS_R_CU=PS_R/RE;

%Implied Due to being a circular orbit and I am lazy
PHI0=0;
NU0=0;

%Velocity Required To Hit Altutude Needed Numbers Added To Make Sure That
%The Velocity Is Great Enough To Reach Required Altitude While Still Being
%An Ellipse The Addition of 3.25 Was Decide on Because it is enough to hit
%the desired altitude with the least amount of velocity (aka the delta v
%from a circular orbit to this velocity would be minimal) and the numbers
%were real and useful
a=(RE+D+CPO_R+PS_R_CU+RM)/2;
V=sqrt(-MUE/(a)+2*MUE/(RE+CPO_R))+3.25;
VSU0=V/SU;
a=-1/(2*(VSU0^2/2-1/(CPO_R_CU)));

%Initial Energy
EN0=VSU0^2/2-1/(CPO_R_CU);
HM0=VSU0*(CPO_R_CU);

%Initial e
e1=sqrt(1-HM0^2/a);

%Moon Velocity
VM=OMG_MOON*D;

%Itteration Sizing and Pre-allocating arrays
i0=1000000;
i=1;
LAM1=zeros(i0,1);
R1_CU=zeros(i0,1);
V1_CU=zeros(i0,1);
PHI=zeros(i0,1);
GAMMA=zeros(i0,1);
E2=zeros(i0,1);
EN2=zeros(i0,1);
HM2=zeros(i0,1);
p=zeros(i0,1);
e=zeros(i0,1);
R_P_3=zeros(i0,1);
V2=zeros(i0,1);

while i<=i0
%Second Radius
R1_CU(i,1)=sqrt(D_CU^2+RSOI_CU^2-2*D_CU*RSOI_CU*cos(LAM1(i,1)));
V1_CU(i,1)=sqrt(2*EN0+2/R1_CU(i,1));
PHI(i,1)=acos(HM0/(R1_CU(i,1)*V1_CU(i,1)));
GAMMA(i,1)=asin(RSOI_CU/R1_CU(i,1)*sin(LAM1(i,1)));
V2(i,1)=V1_CU(i,1)*SU-VM;
E2(i,1)=asin(VM/V2(i,1)*cos(LAM1(i,1))-(V1_CU(i,1)/V2(i,1))*SU*cos(LAM1(i,1)-(PHI(i,1)+GAMMA(i,1))));
EN2(i,1)=(V2(i,1))^2/2-MUM/RSOI;
HM2(i,1)=RSOI*(V1_CU(i,1)*SU-VM)*sin(E2(i,1));
p(i,1)=HM2(i,1)^2/MUM;
e(i,1)=sqrt(1+2*EN2(i,1)*HM2(i,1)^2/MUM^2);

%it's the final countdown
R_P_3(i,1)=p(i,1)/(1+e(i,1));
i=i+1;
LAM1(i,1)=(i/i0)*(pi()/4);
end
k=find(E2<0);
[c, index] = min(abs(R_P_3(k:end,1)-PS_R-RM));
index=k(1,1)+index;
R_P_3_1=R_P_3(index,1)-RM;
LAM1_1=LAM1(index,1)*180/pi();
EN2_2=EN2(index,1);
E2_2=E2(index,1)*180/pi();
e_e=e(index,1);
acl=-1/((V1_CU(index,1)^2/2-1/R1_CU(index,1))*2);
e=sqrt(1+2*EN0*HM0^2);
V_P_3=sqrt(2*(MUM/(R_P_3(index,1))+EN2(index,1)));
NU1=acos((HM0^2/R1_CU(index,1))-1/e);
NU1_DEGREES=NU1*180/pi();
E0=acos((e1+cos(NU0))/(1+e1*cos(NU0)));
E1=atan(sqrt((1-e)/(1+e))*tan(NU1/2));
D_T=sqrt(a^3)*((E1-e1*sin(E1))-(E0-e1*sin(E0)));
D_T_H=D_T/3600;
OMG_DT=OMG_MOON*D_T;
PHASE_ANGLE0=(NU1-NU0-LAM1(index,1)-GAMMA(index,1)-OMG_DT)*180/pi();
OMG_DT_DEGREES=OMG_DT*180/pi()*TU;
PHI1=PHI(index,1)*180/pi();
GAMMA1=GAMMA(index,1)*180/pi();
R1_CU1=R1_CU(index,1);
V1_CU1=V1_CU(index,1);
a2=(p(index,1)*(1+e_e^2));
PHI2=acos(1/((R_P_3_1+RM)*V_P_3));
PHI_M=acos(((R_P_3_1+RM)*V_P_3)^2/(RSOI*V2(index,1)));
NU2=acos(((p(index,1)/RSOI)-1)/(e_e));
F_NU2_DEGREES=NU2*180/pi();
f=atan(sqrt((1-e_e)/(1+e_e))*tan(NU2/2))*2;
D_T_2=sqrt((a2)^3/MUM)*(f-e_e*sin(f))/3600;

%Because You did not want me to just leave off Semicolons I have to have a
%print statement which outputs my variables in one place rather then meter
%out my code and understand where my code is by seeing outputs intersparced
%throughout the progression of the computer program
fprintf('%.15f \n',VSU0,PHI0,LAM1_1,EN0,NU0,NU1_DEGREES,OMG_DT_DEGREES,PHASE_ANGLE0,R1_CU(index,1),V1_CU(index,1),PHI1,GAMMA1,acl,e1,V2(index,1),PHI2,E2_2,EN2_2,a2,e_e,R_P_3_1,V_P_3,D_T_H,D_T_2)
toc