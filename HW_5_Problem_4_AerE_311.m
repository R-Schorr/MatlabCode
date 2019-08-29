clc,clear

%% Predefining Variables

M=2.13;
t_c=.063;
p=.5;

%% Calcualting Cl, Cd and L/D

AOA=linspace(-16,24,32)*pi/180;
%Usage of Equation 1
Cl=2/sqrt(M^2-1)*(2.*AOA-2*t_c);
%Usage of Equation 2
Cd=2/sqrt(M^2-1)*(2.*AOA.^2+2*t_c^2/p+2*t_c^2/p);
%Usage of Equation 3
L_D=Cl./Cd;

%% Plotting

hold on
plot(AOA*180/pi,Cl)
plot(AOA*180/pi,Cd)
hold off
figure
plot(AOA,L_D)
hold off