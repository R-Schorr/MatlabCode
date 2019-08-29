clc, clear

n=20;
k=200;
x1=linspace(-3,3,1000);
x2=linspace(-3,3,1000);
u1=zeros(1,length(x1));
u2=zeros(1,length(x2));
i=1;
u1=1/3;
u2=1/3;

while i<=n
    
    an=2*(-1)^(i+1)/(i^2*pi^2);
    bn=(2*(-1)^(i+1)+i^2*pi^2+2)/(i^3*pi^3);
    u1=u1+an*cos(i*pi*x1)+bn*sin(i*pi*x1);
    i=i+1;

end

i=1;

while i<=k

    an=2*(-1)^(i+1)/(i^2*pi^2);
    bn=(2*(-1)^(i+1)+i^2*pi^2+2)/(i^3*pi^3);
    u2=u2+an*cos(i*pi*x2)+bn*sin(i*pi*x2);
    i=i+1;

end
figure(1);

plot(x1,u1)
title("Fourier cosine n=20 of U")
xlabel("X axis")
ylabel("U axis")

figure(2);

plot(x2,u2)
title("Fourier cosine n=200 of U")
xlabel("X axis")
ylabel("U axis")