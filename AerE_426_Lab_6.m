clc,clear

D=3/4;
x=[1,3,5,7,2,4,6,1,3,5,7];
y=[1,1,1,1,3,3,3,5,5,5,5];
Py=20000;
Px=15000;
M=Py*(20-4)+Px*3;

Xbar=sum(D*x)/(D*length(x));
Ybar=sum(D*y)/(D*length(x));

I=sum(D*x.^2)+sum(D*y.^2)-Xbar*sum(D*x)-Ybar*sum(D*y);

Pb=D*sqrt((Py/(D*11)+M.*(x-Xbar)/I).^2+(Px/(D*11)+M.*(y-Ybar)/I).^2);

Xbar=sum(D^2*x)/(D^2*length(x));
Ybar=sum(D^2*y)/(D^2*length(x));

I=sum(D*x.^2)+sum(D*y.^2)-Xbar*sum(D*x)-Ybar*sum(D*y);

Ps=D*sqrt((Py/(3/8*11)+M.*(x-Xbar)/I).^2+(Px/(3/8*11)+M.*(y-Ybar)/I).^2);

x=[1/16,3/32,1/8,5/32,3/16,1/4,5/16,3/8];
y=[1670,2400,3210,3975,4775,6425,8075,9650];

plot(x,y)
vq=interp1(x,y,D,'linear','extrap');

x=[1/16,3/32,1/8,5/32,3/16,1/4,5/16,3/8];
y=[317,651,1165,1785,2575,4665,7375,10500];

vq2=interp1(x,y,D,'linear','extrap');
plot(x,y)

fos=vq-max(Pb);
fos2=vq2-max(Ps);
ed=(1)/D;