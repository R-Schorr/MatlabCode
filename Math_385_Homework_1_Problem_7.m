clc,clear
i=1;
x=linspace(0,1,100);
t=linspace(0,1,length(x));

u=zeros(length(x),length(x));

while i<=length(x)
    u(i,:)=sin(4*pi()*x(1,i)).*exp(-pi()*t);
    i=i+1;
end

mesh(x,t,u)
title("Displacement Versus Time Versus Velocity")
ylabel("X axis")
xlabel("Time Axis")
zlabel("Velocity Axis")