clc,clear

i=1;
nmax=1000;
a=0;
x=linspace(0,4,100);
t=linspace(0.00001,5,length(x));
u=zeros(length(x),length(x));
for n=1:length(x)
    if x(n)<2
        u(1,n)=0;
    else
        u(1,n)=2*x(n)-4;
    end
end

n=1;

while i<=length(x)-1
    
    while n<nmax
        
        a=a+-16/(n^2*pi()^2)*(cos(n*pi/2)+1+2*(-1)^(n+1)).*exp(-(n*pi/4)*t(1,i)).*cos(n*pi*x(1,:)/4);
        n=n+1;
        
    end
    
    u(i+1,:)=-2*x+1+a;
    a=0;
    n=1;
    i=i+1;
    
end
figure(1);
mesh(x,t,u)
figure(2);

hold on
subplot(2,2,1)
plot(x,u(1,:))
title('X versus U(t=0,x)')
xlabel('X axis')
ylabel('Temperature Axis')
subplot(2,2,2)
plot(x,u(20,:))
title('X versus U(t~=1,x)')
xlabel('X axis')
ylabel('Temperature Axis')
subplot(2,2,3)
plot(x,u(40,:))
title('X versus U(t~=2,x)')
xlabel('X axis')
ylabel('Temperature Axis')
subplot(2,2,4)
plot(x,u(70,:))
title('X versus U(t~=3.5,x)') 
xlabel('X axis')
ylabel('Temperature Axis')
hold off
