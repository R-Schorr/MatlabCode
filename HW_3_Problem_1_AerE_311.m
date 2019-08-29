clc,clear

%% Obtaining Constants for the Problem

%Technically it Asks for the P2 Value so I am Obtaining This for the
%Purpose of Having it Even Though no check is Given for a Particular P1 to
%P2 Value
P1=input('Enter Upstream Pressure: ');
M1=input('Enter Upstream Mach Number: ');
D=input('Enter Turning Angle: ')*pi/180;

%1.4 for Air but Making Sure is Usable for Other Flows
Gamma=input('Enter Gamma For Flow: '); 

%Determining How Many Points are Obtained from the Length of Delta
Delta=linspace(0,40,100)*pi/180;
M2=zeros(1,length(Delta));
ittera_max=1000;
conv=1*10^-6;
n=1;

%Newton's Method Cannot Calculate a Zero Turning Angle Due to a Divide By
%Zero Error in this Problem so Need to Set it Independently of Itteration
M2(1,1)=M1;

%Equation 1
C=atan(-sqrt(M1^2-1)/sqrt((Gamma+1)/(Gamma-1)))/(sqrt((Gamma-1)/(Gamma+1)))-asin(1/M1);

%% Calculating the Values of Mach Number and Pressure Ratios to Obtain the Curves of Mach Number VS Delta and P2/P1 VS Delta
while n<length(Delta)
    syms x
    %Equation 2
    equ=sqrt((Gamma+1)/(Gamma-1))*tan(sqrt((Gamma-1)/(Gamma+1))*(asin(1/x)-Delta(1,n+1)+C))+sqrt(x^2-1);
    
    %Newton's Method is an Externally Build Function in this Code
    [~,M2(1,n+1),~]=Newtons_Method_Function(equ,conv,0,ittera_max,M1+conv);
    n=n+1;
end
X=real(M2);

%Equation 3
PR=((1+(Gamma-1)/2*M1^2)./(1+((Gamma-1)/2).*X.^2)).^(Gamma/(Gamma-1));

%% Taking and Finding Mach Number for the Given Input Value of Delta and Calcualting the Pressure From the Calculated Value of Mach Number
lw=find(Delta < D,1,'last');
hg=lw+1;

%Equation 4
IM=((M2(1,hg)-M2(1,lw))/(Delta(1,hg)-Delta(1,lw)))*(D-Delta(1,lw)+M2(1,lw));

syms x

%Equation 2
equ=sqrt((Gamma+1)/(Gamma-1))*tan(sqrt((Gamma-1)/(Gamma+1))*(asin(1/x)-D+C))+sqrt(x^2-1);
[~,NM,~]=Newtons_Method_Function(equ,conv,0,ittera_max,IM);
Y=real(NM);

%Equation 3
P=((1+(Gamma-1)/2*M1^2)./(1+((Gamma-1)/2).*Y.^2)).^(Gamma/(Gamma-1));

%% Plotting All Values 
hold on
plot(D*180/pi,Y,'*')
plot(D*180/pi,P,'*')
plot(Delta*180/pi,X)
plot(Delta*180/pi,PR)
hold off

P2=P1*P;
fprintf('The P2 Value is: %f\n',P2)
