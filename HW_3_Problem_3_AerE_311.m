clc,clear

%% Begining to Define Variables that are constant or needed Quickly

Pti=6;
gamma=1.4;
Ath=.2;
Ae=1.5;
syms x
conv=1e-6;
ittera_max=1000;
IM=1-conv;

%Equation 1
equ=1/x*(2/(gamma+1)*(1+(gamma-1)/2*x^2))^((gamma+1)/(2*(gamma-1)));

%% Mach Number for First and Second Critical Solutions

[~,NM,~]=Newtons_Method_Function(equ,conv,0,ittera_max,IM);

%% Part 1: First Critical
%Equation 2
Patm1=Pti/((1+(gamma-1)/2*NM^2)^(gamma/(gamma-1)));

%% Part 3: Second Critical
%Equation 3
M2=sqrt((NM^2*+2/(gamma-1))/((2*gamma)/(gamma-1)*NM^2-1));
%Equation 4
Patm2=Patm1*(1+gamma*NM^2)/(1+gamma*M2^2);

%% Part 2: Third Critical

IM=1+conv;
[~,NM2,~]=Newtons_Method_Function(equ,conv,0,ittera_max,IM);
%Equation 4
Patm3=Pti/((1+(gamma-1)/2*NM2^2)^(gamma/(gamma-1)));

%% Part 4: Pressure Halfway between Atmospheric at First Critical and the Tank Pressure

IM=1-conv;
Pave=(Patm1+Pti)/2;
%Equation 2
M3=sqrt((1-log(Pti/Pave)/log(gamma/(gamma-1)))*2/(gamma-1));
%Equation 1
A=Ae/((1/M3)*(2/(gamma+1)*(1+(gamma-1)/2*M3^2))^((gamma+1)/(2*(gamma-1))));
equ=(1/x)*(2/(gamma+1)*(1+(gamma-1)/2*x^2))^((gamma+1)/(2*(gamma-1)))-Ath/A;
[~,NM3,~]=Newtons_Method_Function(equ,conv,0,ittera_max,IM);

%% Part 5: Calculating Shock Location

Pave2=(Patm1+Patm2)/2;
%Equation 6
A2=(Pti*Ae)/Pave2;
%Equation 5
x2=(-1.4+sqrt(1.4^2-4*(1.4/36)*(1.5-(A2/1)/2)))/(2*1.4/36);
%x3=(-1.4-sqrt(1.4^2-4*(1.4/36)*(1.5-(A2/1)/2)))/(2*1.4/36); Provides an
%invalid solution to the distance

%% Part 6: Oblique Shock

IM=1+conv;
P=(Patm2+Patm3)/2;
A=Ae;
%Equation 1
equ=(1/x)*(2/(gamma+1)*(1+(gamma-1)/2*x^2))^((gamma+1)/(2*(gamma-1)))-A/Ath;
[~,NM4,~]=Newtons_Method_Function(equ,conv,0,ittera_max,IM);
%Equation 4
P4=Pti/((1+(gamma-1)/2*NM4^2)^(gamma/(gamma-1)));
%Equation 7
del=sqrt(asin((P/P4-(1-gamma)/(gamma+1))*(gamma+1)/(2*gamma*NM4^2)));

%% Part 7: Prandtl Meyer Expansion

Pa=.5*Patm3;
%Equation 1
equ=1/x*(2/(gamma+1)*(1+(gamma-1)/2*x^2))^((gamma+1)/(2*(gamma-1)))-Ae/Ath;
[~,NM5,~]=Newtons_Method_Function(equ,conv,0,ittera_max,IM);
%Equation 2
P5=Pti/((1+(gamma-1)/2*NM5^2)^(gamma/(gamma-1)));
%Equation 8
Theta=asind(1/NM5);
%Equation 9
C=atand(-sqrt(NM5^2-1)/sqrt((gamma+1)/(gamma-1)))/(sqrt((gamma-1)/(gamma+1)))-asind(1/NM5);
%Equation 2
M4=sqrt((-1+log(Pti/P5)/log(gamma/(gamma-1)))*2/(gamma-1));
%Equations 8 and 9
Del=atand(-sqrt(M4^2-1)/sqrt((gamma+1)/(gamma-1)))/(sqrt((gamma-1)/(gamma+1)))-asin(1/M4)-C;

%% Printing Everything

fprintf('Atmospheric Pressure at First Critical: %f\n',Patm1)
fprintf('Atmospheric Pressure at Second Critical: %f\n',Patm2)
fprintf('Atmospheric Pressure at Third Critical: %f\n',Patm3)
fprintf('Atmospheric Pressure at Point Between Tank Pressure and First Critical: %f\n',Pave)
fprintf('Mach Number at Point Between Tank Pressure and First Critical at Entrance: %f\n',M3)
fprintf('Mach Number at Point Between Tank Pressure and First Critical at Exit: %f\n',NM3)
fprintf('Shock Location is: %f from the End of Nozzle\n',x2)
fprintf('Angle of Oblique Shock is: %f\n',del)
fprintf('Mach Number After Shock: %f\n',NM4)
fprintf('Incident Angle of Expansion: %f\n',Theta)
fprintf('Ending Angle of Expansion: %f\n',Del)
fprintf('Ending Mach Number Right After First Expansion: %f\n',M4)


