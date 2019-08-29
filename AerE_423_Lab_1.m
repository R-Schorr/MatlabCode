clc,clear 

P_max=[93.85927 57.30947 180.70435 96.53193];

d=5;

r=d/1000/2;

a=r^2*pi*sind(30);

stress=P_max/a/10^6;

stress_2pl=stress(3:4)/2;

disp(stress)
disp(stress_2pl)