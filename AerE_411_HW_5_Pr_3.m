clc,clear

gamma=1.25;

t_r=linspace(1,1.2566,100);

p_r=(t_r).^((gamma-1)/gamma);

plot(t_r,p_r)
xlabel('Tt7/Tt5')
ylabel('Pt7/Pt5')
title('Tt7/T5 versus Pt7/Pt5')
