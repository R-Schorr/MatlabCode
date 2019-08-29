clc,clear

i=1;
j=1;
k=1;
n=100;
u1=1/12;
u12=u1;
x=linspace(-2,2,100);
t=linspace(0,5,length(x));
u1=zeros(length(t),length(x));

while j<=length(t)
    
    while k<=length(x)
        
        while i<=n
    
            An=-2*(2*cos(n*pi)+1)/(n^3*pi^3);
            u1(j,k)=u1(j,k)+An.*cos(i.*pi.*x(1,k)).*cos(i*pi*t(1,j));
            i=i+1;

        end
        k=k+1;
        i=1;
    end
    j=j+1;
    k=1;
end
figure
plot(x,u1(1,:))
title("Distance versus Time=0 of U(t,x)")
xlabel("Distance")
ylabel("U(t=0,x)")
figure
plot(x,u1(5,:))
title("Distance versus Time=0 of U(t,x)")
xlabel("Distance")
ylabel("U(t=0.4,x)")
figure
plot(x,u1(10,:))
title("Distance versus Time=0 of U(t,x)")
xlabel("Distance")
ylabel("U(t=0.9,x)")
i=1;
t=linspace(0,10,length(x));
x=.5;

while i<=n
    
    An2=-2*(2*cos(i*pi)+1)/(i^3*pi^3);
    u12=u12+An2*sin(i*pi*x)*cos(i*pi*t);
    i=i+1;

end

figure
plot(t,u12)
title("Time versus X=.5 of U(t,x)")
xlabel("Distance")
ylabel("U(t,x=0.5)")