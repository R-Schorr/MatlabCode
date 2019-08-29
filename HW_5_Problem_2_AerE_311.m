clc,clear

%% Constants for the Problem

P1=26500;
ro=.4135;
T=273.15-49.09;
r=287;
Gamma=1.4; 
M1=2;

%Determining How Many Points are Obtained from the Length of Delta

Delta=linspace(0,22,30)*pi/180;
M2=zeros(1,length(Delta));

%Newton's Method Constants and Itterators
ittera_max=1000;
conv=1*10^-6;
n=1;


%% Calculating the Values of Mach Number and Pressure to Obtain the Curve of P2 VS Delta for PM Expansion

%Newton's Method Cannot Calculate a Zero Turning Angle Due to a Divide By
%Zero Error in this Problem so Need to Set it Independently of Itteration
M2(1,1)=M1;

%Equation 6
C=atan(-sqrt(M1^2-1)/sqrt((Gamma+1)/(Gamma-1)))/(sqrt((Gamma-1)/(Gamma+1)))-asin(1/M1);

while n<length(Delta)
    syms x
    %Equation 6+7
    equ=sqrt((Gamma+1)/(Gamma-1))*tan(sqrt((Gamma-1)/(Gamma+1))*(asin(1/x)-Delta(1,n+1)+C))+sqrt(x^2-1);
    
    %Newton's Method is an Externally Build Function in this Code
    [~,M2(1,n+1),~]=Newtons_Method_Function(equ,conv,0,ittera_max,M1+conv);
    n=n+1;
end
X=real(M2);

%Equation 8
P2=P1*((1+(Gamma-1)/2*M1^2)./(1+((Gamma-1)/2).*X.^2)).^(Gamma/(Gamma-1));

%% Oblique Shock Problem Begining

n=1;

syms x
Sigma=zeros(1,length(Delta));
%Equation 1 From Oblique Heading
equ=(atan(2*cot(x).*(M1^2*sin(x).^2-1)./(M1^2*(1.4+cos(2.*x))+2)));
sigma=asind(1/M1)*pi()/180;
while n<length(Delta)
   
    [~,Sigma(1,n+1),~]=Newtons_Method_Function(equ,conv,Delta(1,n+1),ittera_max,sigma);
    n=n+1;
end
P2(2,:)=P1/(Gamma+1)*(2*Gamma *M1^2.*sin(Sigma).^2+1+Gamma);

%% Cl and Cd Calculation

%Equation 5
a=sqrt(Gamma*r*T);

%Equation 9
V=M1*a;

%Equation 3
Cl=(P2(2,:)-P2(1,:))./(1/2.*ro.*V^2).*cos(Delta);

%Equation 4
Cd=(P2(2,:)-P2(1,:))./(1/2.*ro.*V^2).*sin(Delta);

%Equation 10
cd=4.*Delta.^2./sqrt(3);

%Equation 11
cl=4.*Delta./sqrt(3);

%% Plotting Cl's and Cd's

figure

hold on 
plot(Delta*180/pi,Cd)
plot(Delta*180/pi,cd)
hold off

figure

hold on
plot(Delta*180/pi,Cl)
plot(Delta*180/pi,cl)
hold off