clc,clear

%% Defining Variables

%Usage of Given Equation for Pressure at altitude
Patm=(100*10^3)*exp(-1.5*10^-4*10000);
gamma=1.4;
Pti=6*10^6;
conv=1*10^-6;
ittera_max=1000;
P=Pti/Patm;
s=1+conv;

syms x

%% Application of Equations for Part c
    %Equation 1 applied
equ=(1+(gamma-1)/2*x^2)^(gamma/(gamma-1));

%Newton's Method Function Call
[~,NM,~]=Newtons_Method_Function(equ,conv,P,ittera_max,s);

%% Part D

i=1;

%Equation 2
A_tc=.2*(1/NM*(2/(gamma+1)*(1+(gamma-1)/2*NM^2))^((gamma+1)/(2*(gamma-1))));

%% Partition for debug 
AE=linspace(A_tc/5,A_tc*5,150);
NM1=zeros(1,length(AE));
PE=zeros(1,length(AE));
delta=zeros(1,length(NM));
sigma=zeros(1,length(NM1));
M2=zeros(1,length(NM1));
A=AE/.2;

%% Partition for Debug

while i<=length(AE)
    
    %Equation 2
    equ=(1/x*(2/(gamma+1)*(1+(gamma-1)/2*x^2))^((gamma+1)/(2*(gamma-1))));
    
    %Newton's Method Function Call
    [~,NM1(1,i),~]=Newtons_Method_Function(equ,conv,A(1,i),ittera_max,s);
    PE(1,i)=Pti/(1+(gamma-1)/2*NM1(1,i)^2)^(gamma/(gamma-1));
    i=i+1;
end

%% Usage of NM for calculations

%Equation 3
TE=(2500)./((1+(gamma-1)/2*NM1.^2).^(gamma/(gamma-1)).^(1/3.5));

%Equation 4
a=sqrt(TE.*gamma*287);

%Equation 5
U=NM1.*a;

%Equation 6
Fx=970.042.*U+(PE-Patm).*AE;
i=1;

[Fm,n]=max(Fx);

hold on
plot(AE(1,n),Fm,'*')
plot(AE,Fx)
figure
hold on
plot(AE(1,n),U(1,n),'*')
plot(AE,U)

%% Part E Printing


fprintf('Force is %f\n',Fm)
fprintf('Area is %f\n',AE(1,n))

%% Part F 

A_MT=AE(1,n);
H=linspace(0,50000);

%Use of Given Equation for Pressure at altitude
Pa=(100*10^3)*exp(-1.5*10^-4.*H);

%Equation 6
Fn=970.042.*U(1,n)+(PE(1,n)-Pa).*A_MT;

figure 
plot(Fn,H)
