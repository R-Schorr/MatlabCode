clc,clear,clf

%% Predefining Varables

l_2=123.2;
a1=98.58;
a2=75.92;
a3=33.99;
a4=11.33;

E=[10400,10139,30400]*1000;

f=6000;
f_2=9000;

%% Load Case Varables

Bl_2=[-124.96,-124.96,-115.96,-115.96,-98.58,-98.58,-97,-97,-75.92,-75.92,-40.55,-40.55,-33.99,-33.99,-11.33,-11.33,0];
BL_fl=[Bl_2,fliplr(-Bl_2)];

V_l_fl=[0 940 940 940 940 919 919 41 41 41 41 23 23 26 26 17 17 17 17 8 8 11 11 8 8 -8 -8 -966 -966 -987 -987 -987 -987 0];

V_2_fl=[0 3584 3584 3854 3854 4000 4000 -3558 -3558 -2480 -2480 -1734 -1734 -1112 -1112 -155 -155 197 197 1153 1153 1776 1776 2531 2531 3599 3599 -4076 -4076 -3661 -3661 -3661 -3661 0];

V_3_fl=[0 3222 3222 2873 2873 3283 3283 -3562 -3562 -2464 -2464 -1474 -1474 -925 -925 -216 -216 257 257 978 978 1529 1529 2433 2433 3653 3653 -3320 -3320 -2934 -2934 -2383 -2383 0];

V_4_fl=[0 -2624 -2624 -2624 -2624 -3893 -3893 3813 3813 2158 2158 1895 1895 1276 1276 -7 -7 -7 -7 -1298 -1298 -1917 -1917 -2180 -2180 -3835 -3835 3937 3937 2668 2668 2668 2668 0];

V_5_fl=[0 -1263 -1263 -1263 -1263 -2230 -2230 2890 2890 1649 1649 1439 1439 976 976 7 7 7 7 -967 -967 -1430 -1430 -1629 -1629 -2882 -2882 2228 2228 1261 1261 1261 1261 0];

V_6_fl=[0 -2033 -2033 -2584 -2584 -3223 -3223 4229 4229 2856 2856 1807 1807 1157 1157 228 228 -246 -246 -1189 -1189 -1839 -1839 -2801 -2801 -4299 -4299 3230 3230 2616 2616 2065 2065 0];

V_7_fl=[0 -2394 -2394 -2944 -2944 -3575 -3575 4214 4214 2840 2840 1799 1799 1147 1147 221 221 -252 -252 -1191 -1191 -1844 -1844 -2799 -2799 -4296 -4296 3600 3600 2996 2996 2444 2444 0];

V_8_fl=[0 4318 4318 4318 4318 4966 4966 -5383 -5383 -3765 -3765 -2626 -2626 -1697 -1697 -251 -251 277 277 1721 1721 2652 2652 3788 3788 5408 5408 -5027 -5027 -4381 -4381 -4381 -4381 0];

%% Calculating I from P*a^3*b^2/(3*E*(3*a+b)^2) or forces from seats

def=2*f_2*(l_2+a1)^3*(l_2-a1)^2./(3.*E.*(3*(l_2+a1)+l_2-a1)^2)+2*f*(l_2+a2)^3*(l_2-a2)^2./(3.*E.*(3*(l_2+a2)+l_2-a2)^2)+...
    2*f*(l_2+a3)^3*(l_2-a3)^2./(3.*E.*(3*(l_2+a3)+l_2-a3)^2)+2*f_2*(l_2+a4)^3*(l_2-a4)^2./(3.*E.*(3*(l_2+a4)+l_2-a4)^2);

I=def*1;

%% Plots of Shear versus the location on the beam

hold on

plot(BL_fl,V_l_fl)
plot(BL_fl,V_2_fl)
plot(BL_fl,V_3_fl)
plot(BL_fl,V_4_fl)
plot(BL_fl,V_5_fl)
plot(BL_fl,V_6_fl)
plot(BL_fl,V_7_fl)
plot(BL_fl,V_8_fl)
title('Shear Versus Location on Beam')

hold off

%% Calculating an I that satisfies the load forces from the seat supports

tw=.4;
b=6.75;
tf=.8;
b2=5.75;
tf2=.7;
d=10.5-tf-tf2;

IB=tw*(d-tf-tf2)^3/12+(b*tf^3/12+b*tf*((d-tf-tf2)/2)^2)+(b2*tf2^3/12+b2*tf2*((d-tf-tf2)/2)^2);
dis=(b-1.05)/2;
dis2=(b2-1.38)/2;

%% Load Case Analysis

F_L_1=zeros(1,length(V_8_fl)/2);
F_L_2=zeros(1,length(F_L_1));
F_L_3=zeros(1,length(F_L_1));
F_L_4=zeros(1,length(F_L_1));
F_L_5=zeros(1,length(F_L_1));
F_L_6=zeros(1,length(F_L_1));
F_L_7=zeros(1,length(F_L_1));
F_L_8=zeros(1,length(F_L_1));
B_FL=zeros(1,length(F_L_1));

for n=1:length(V_8_fl)/2
    
    F_L_1(n)=-V_l_fl(2*n-1)+V_l_fl(2*n);
    F_L_2(n)=-V_2_fl(2*n-1)+V_2_fl(2*n);
    F_L_3(n)=-V_3_fl(2*n-1)+V_3_fl(2*n);
    F_L_4(n)=-V_4_fl(2*n-1)+V_4_fl(2*n);
    F_L_5(n)=-V_5_fl(2*n-1)+V_5_fl(2*n);
    F_L_6(n)=-V_6_fl(2*n-1)+V_6_fl(2*n);
    F_L_7(n)=-V_7_fl(2*n-1)+V_7_fl(2*n);
    F_L_8(n)=-V_8_fl(2*n-1)+V_8_fl(2*n);
    B_FL(n)=BL_fl(2*n);
    
end

figure

hold on

plot(B_FL,F_L_1,'*','Markersize',5)
plot(B_FL,F_L_2,'.','Markersize',5)
plot(B_FL,F_L_3,'o','Markersize',5)
plot(B_FL,F_L_4,'>','Markersize',5)
plot(B_FL,F_L_5,'s','Markersize',5)
plot(B_FL,F_L_6,'^','Markersize',5)
plot(B_FL,F_L_7,'v','Markersize',5)
plot(B_FL,F_L_8,'d','Markersize',5)
title('Force versus Location on Beam')

hold off

%% Check to ensure that the forces cancel out

%sum(F_L_1)
%sum(F_L_2)
%sum(F_L_3)
%sum(F_L_4)
%sum(F_L_5)
%sum(F_L_6)
%sum(F_L_7)
%sum(F_L_8)

%% Generating Moments from Shear to see if any moments are applied to beam in load cases


B_Fl=B_FL+l_2;
BF=B_Fl(1);
B_Fl(1)=B_Fl(1)-BF;
B_Fl(length(B_Fl))=B_Fl(length(B_Fl))+BF;

[M1] = rsum(V_l_fl,B_Fl);
[M2] = rsum(V_2_fl,B_Fl);
[M3] = rsum(V_3_fl,B_Fl);
[M4] = rsum(V_4_fl,B_Fl);
[M5] = rsum(V_5_fl,B_Fl);
[M6] = rsum(V_6_fl,B_Fl);
[M7] = rsum(V_7_fl,B_Fl);
[M8] = rsum(V_8_fl,B_Fl);


figure

hold on

plot(B_Fl, M1)
plot(B_Fl, M2)
plot(B_Fl, M3)
plot(B_Fl, M4)
plot(B_Fl, M5)
plot(B_Fl, M6)
plot(B_Fl, M7)
plot(B_Fl, M8)

title('Moment versus Location on Beam from Riemann Sum')

hold off

max(M1)
