clc,clear

t=linspace(0,3/8*5);

%Problem 1
figure
hold on
v=(3/8)*(8/3*t-1+exp(-8/3*t));
plot(t,v,'*')
ramp=2/3*t;         
m=tf(3/2,[3/8,1]);    
[y,t]=lsim(m,ramp,t);
plot(t,y,'r')
xlabel('time')
ylabel('response')
title('response versus time')
hold off

%Problem 2

p=[1,4,25];
roots(p)
k=0:.1:100;
rt=zeros(length(k),3);
for i=1:length(k)
    it=i;
    p=[1,4,25,k(1,it)];
    rt(it,:)=roots(p);
end
figure
hold on
title('Real Versus Imaginary')
xlabel('real')
ylabel('imaginary')
plot(rt,'*')
hold off
k_i=rt(1001,1)^3+4*rt(1001,1)^2+25*rt(1001,1);

%Problem 4

t=linspace(0,10);
H=tf(10,[1,4,25]);
hold on
figure
y=exp(-2.*t).*sin(sqrt(21).*t);
plot(t,y,'*')
hold off
hold on
impulse(H,t);
hold off
figure
step(H)
