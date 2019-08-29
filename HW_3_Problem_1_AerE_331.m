clear,clc

a=[1,2,5,10,20,50,100];
gain=-10*log10(a.^2+144)
phase=atand(-a/12)
x=linspace(1,100,100);
y=-.1.*x-20;
hold on
plot(a,gain,'r')
plot(a,phase,'r')
plot(x,y,'b')
hold off
figure 
bode(tf([1],[1,12]))