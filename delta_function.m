%%First and Second Dirac Delta Function Derivatives
 
clc,clear
 
n=5*10^-2;
 
x=linspace(-1,1,1000);
 
delta=1/n*exp(-x.^2/n^2);
 
dd1=-2.*x.*exp(-x.^2/n^2)/n^3;
 
n=1.5*10^-1;
 
dd2=-2.*exp(-x.^2/n^2)/n^3+2.*x.^2/n^5.*exp(-x.^2/n^2);
 
hold on
 
plot(x,delta)
plot(x,dd1)
plot(x,dd2)
 
title('Delta Function First and Second Derivatives')
ylabel('Amplitude of Delta Function')
xlabel('X distance along Delta Function')
legend('Delta Function','First Derivative','Second Derivative','location','best')
 
hold off