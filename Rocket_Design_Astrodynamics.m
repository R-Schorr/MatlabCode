clc,clear

%Altutude and Angular Velocity at Launch Site
CAPE_ALTITUDE=3/1000;
ANGU_EARTH=7.292115856*10^-5;

%Earth's Constants
R_E=6378.145;
PER_TRANS=86;
R_GS=35786;
MU_E=3.986*10^5;


%Structure Factors of Stages
STR1=.11;
STR2=.13;
STR3=.15;

%Begin Engines Rating
ISP1=320;
ISP2=455;
ISP3=280;
%End Engines Ratings

%Total Mass Before Apogee Burn
M_T=1800;


%Orbital Inclination Angles in Radians
O_I_K=28.5*pi()/180;
O_I_TO=15*pi()/180;
O_I_GT=O_I_K-O_I_TO;
O_I_GS=0;

%Constant of Problem and Stage Number
AP_D_V=1.6;
k=3;
i0=1000;
i=0;

%Calculated A of Orbits
A_L=(PER_TRANS+R_E*2+CAPE_ALTITUDE)/2;
A_GS=(PER_TRANS+R_GS+R_E*2)/2;

%Velocities of Rocket in Geostatinary Transfer Orbit
V_P_TO=sqrt(2*(-MU_E/(2*A_GS)+MU_E/(PER_TRANS+R_E)));
V_A_TO=sqrt(2*(-MU_E/(A_GS*2)+MU_E/(R_GS+R_E)));

%Velocities of Rocket in Approach to Geostationary Orbit
V_A_L=sqrt(2*(-MU_E/(2*A_L)+MU_E/(PER_TRANS+R_E)));
V_P_L=sqrt(2*(-MU_E/(A_L*2)+MU_E/(CAPE_ALTITUDE+R_E)));

%Velocity of Geostationary Orbit
V_GSO=sqrt(2*(-MU_E/((R_GS+R_E)*2)+MU_E/(R_GS+R_E)));

%Accleration Due to Gravity
g_e=9.81/1000;

%Exit Velocities of Engines
VE1=ISP1*g_e;
VE2=ISP2*g_e;
VE3=ISP3*g_e;

%Transfer Orbital Inclination from GTO to GS
D_V_TO=V_GSO-V_A_TO;
D_V3=sqrt(D_V_TO^2+V_A_TO^2-2*D_V_TO*V_A_TO*cos(O_I_TO))

%Transfer from Launch to GTO 
V_TTTi=V_P_TO;
D_V_TT=V_P_TO-V_A_L;
D_V2=sqrt(D_V_TT^2+V_P_TO^2-2*D_V_TT*V_P_TO*cos(O_I_GT))

%Transfer from Surface of Earth to Launch Level
D=(R_E+CAPE_ALTITUDE)*ANGU_EARTH;
D_V=V_P_L+AP_D_V-D

%Total Change in Velocity
D_V_T=D_V3+D_V2+D_V;

%Pi values of the Different Burns
PI3=(exp((-D_V3/VE3))-STR3)/(1-STR3)
PI2=(exp(-(D_V2/VE2)-STR2)/(1-STR2))

%Mass after V3 burnout(satellite mass)
M_V3=M_T/exp(D_V3/VE3);
M_V3_Pr=M_T-M_V3
M_V3_Pay=PI3*M_T
MS3=(M_V3_Pay/PI3-M_V3_Pay)*STR3

%Mass before V2 burnout
M_V2=exp(D_V2/VE2)*M_V3;
M_V2_Pr=M_T-M_V2
M_V2_Pay=PI2*M_T
MS2=(M_V2_Pay/PI2-M_V2_Pay)*STR2

%Itteration on Burnout velocity Percentage dedicated to each engine
%involved in first Burn as well as calculation of the individual Pi values
%of each engine as the total burn for each engine changes
while i<=i0
    B1(i+1,1)=(exp(-(D_V*((1000-i)/i0))/VE1)-STR1)/(1-STR1);
    B1(i+1,2)=(exp(-(D_V*(i/i0))/VE2)-STR2)/(1-STR2);
    STR_PAY(i+1,1)=(M_V2/(B1(i+1,1)*B1(i+1,2)))-M_V2;
    O_P(i+1,1)=D_V*(i/i0);
    TOTAL_Pi(i+1,1)=B1(i+1,1)*B1(i+1,2);
    i=i+1;
end

%Because a negitive Pi means not possible
STR_PAY_1=STR_PAY(300:900,1);

%Mass on LP
min=min(STR_PAY_1);
LP_Mass=min+M_V2

%Velocity Percent of Total Burn Dedicated to each engine with respect to Second Stage
V_P_1=(1-(k/i0))*D_V
V_P_2=k/i0*D_V

%Finding Pi
k=find(STR_PAY_1==min);
k=240+k;
ME_Pi=TOTAL_Pi(k,1)*PI3*PI2;
PI1=TOTAL_Pi(k,1)

M_V2_Pr=(M_T/B1(k,2)-M_T)*STR2
M_V2_Pay=PI2*M_T
MS2=(M_V2_Pay/PI2-M_V2_Pay)*STR2
M_V1=exp(D_V2/VE2)*M_V3;
M_V1_Pr=M_T-M_V2
M_V1_Pay=PI2*M_T
MS1=(M_V2_Pay/PI2-M_V2_Pay)*STR2

MS1=STR1*min
M_V1_Pay=min-MS1

%Graph of Mass For different percent's of Burn velocity on LP
figure
hold on
plot(O_P,STR_PAY)
ylabel('Mass Required in kg')
xlabel('Velocity Component with in Second Stage')
title('Velocity With Respect to Mass')
hold off

%Second Figure to get rid of less desirible signals
figure
hold on
plot(O_P(300:900,1),STR_PAY_1)
ylabel('Mass Required in kg')
xlabel('Velocity Component with in Second Stage')
title('Velocity With Respect to Mass')
hold off
