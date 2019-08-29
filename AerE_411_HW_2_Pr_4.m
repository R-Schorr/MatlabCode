clc,clear

Temp=linspace(1200,1800,100);

x=.000314.*(Temp-300);

f=.262238*x;

plot(x,f)
xlabel('Phi')
ylabel('f')
title('Phi versus f')