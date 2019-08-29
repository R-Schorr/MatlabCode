clc,clear

gamma=1.4;
Cp=1005;
h=4.42*10^7;

T0=210;
t_lam=7;
t_lamAB=8;
Pi_c=10;
M0=linspace(0,3.5,100);

R=(gamma-1)/gamma;
a0=sqrt(gamma*T0*R);
t_r=1+(gamma-1)/2*M0.^2;
t_c=Pi_c^((gamma-1)/gamma);
t_t=1-(t_r/t_lam)*(t_c-1);

F_m=a0*((2/(gamma-1)*t_lamAB./(t_r.*t_c.*t_t).*(t_r.*t_c.*t_t-1)).^(1/2)-M0);
f_tot=(Cp*T0)/h*(t_lamAB-t_t);
S=f_tot./F_m.*10^6;

figure(1)

plot(M0,F_m)
title("Function of Mach Number vesus Pressure Ratio Across Compressor")
ylabel("F(M)")
xlabel("Mach Number")


figure(2)

plot(M0,S)
title("Function of Mach Number vesus Specific Fuel Consumption")
xlabel("F(M)")
ylabel("Specific Fuel Consumption")


t_r_max=t_lam/(2*t_c-1);
M0_max=sqrt((t_r_max-1)*2/(gamma-1));