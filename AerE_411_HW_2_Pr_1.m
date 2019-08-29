clc,clear

syms x

gamma=1.4;
V=2600;
R=4124;
T0=300;
P0=520;
L=10;
D=2;
cf=.02;
ittera_max=1000;
conv=1e-6;

M1=V/sqrt(gamma*R*T0);
f=(1-M1^2)/(gamma*M1^2)+(gamma+1)/(2*gamma)*log(M1^2/(2/(gamma+1)*(1+(gamma-1)/2)*M1^2))*(D/cf)-L;

F=f*cf/D;

equ=(1-x^2)/(gamma*x^2)+(gamma+1)/(2*gamma)*log(x^2/(2/(gamma+1)*(1+(gamma-1)/2)*x^2));
IM=1+conv;
[~,NM2,~]=Newtons_Method_Function(equ,conv,F,ittera_max,IM);

Pcrit=P0/(1/M1*(1/((2/(gamma+1))*(1+(gamma-1)/2*M1^2)))^.5);
P2=(1/NM2*(1/((2/(gamma+1))*(1+(gamma-1)/2*NM2^2)))^.5)*Pcrit;

Tcrit=T0/(((gamma+1)/2)/(1+(gamma-1)/2*M1^2));
T2=(((gamma+1)/2)/(1+(gamma-1)/2*NM2^2))*Tcrit;