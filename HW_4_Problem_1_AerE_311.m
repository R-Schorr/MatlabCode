clc,clear

%% Predefinition of Constants for Plot as well as a Variable for the whole problem 

gamma=1.4;
m=linspace(0,4,100);

%% Plotting Component Part A

%Equation 3

fr=(1+(gamma-1)/2.*m)./(1+gamma.*m.^2).^2.*m.^2;

plot(m,fr)

%% Pre-definition of Variables For Part B Exclusively

M1=[.5,2,6];
T1=1000;
h=4.4*10^7;
ms=800;
mf=8;

%% Finding Fr2 From mach number and Total Temperature Ratio Across a shock

%Equation 1

Tt1=(1+(gamma-1)/2.*M1.^2).*T1;

%Equation 2

TR=1+((mf/ms)*h)./((gamma*(287)./(gamma-1))*Tt1);

%Equation 3

fr1=((1+(gamma-1)/2.*M1.^2)./(1+gamma.*M1.^2).^2).*M1.^2;

%Equation 4

fr2=TR.*fr1;

%% Defining Itterational Variables 

M2=zeros(1,length(M1));
PR=zeros(1,length(M1));
i=1;

%% Begining Itteration of Mach 2 Solution for all Mach 1's to be Tested

while i<=length(M1)
    if M1(1,i)<1
        %Equation 5 Applied on with the negative sign utilized because
        %other solution would result in the Mach 2 being higher than Mach 1
        M2(1,i)=sqrt((1-2*gamma*fr2(1,i)-sqrt((2*gamma*fr2(1,i)-1)^2-4*fr2(1,i)*(fr2(1,i)*(gamma)^2-(gamma-1)/2)))/(2*fr2(1,i)*gamma^2+1-gamma));
        %Equation 6 Applied
        PR(1,i)=(1+gamma.*M1(1,i).^2)./(1+gamma.*M2(1,i).^2).*((1+(gamma-1)/2.*M2(1,i).^2)./(1+(gamma-1)/2.*M1(1,i).^2))^(gamma/(gamma-1));
    elseif M1(1,i)>1
        %Equation 5 Applied with the positive sign utilized because other
        %solutions would result in the Mach 2 containing an imaginary
        %component
        M2(1,i)=sqrt((1-2*gamma*fr2(1,i)+sqrt((2*gamma*fr2(1,i)-1)^2-4*fr2(1,i)*(fr2(1,i)*gamma^2-(gamma-1)/2)))/(2*fr2(1,i)*gamma^2+1-gamma));
        %Applicaion on equation 6
        PR(1,i)=(1+gamma.*M1(1,i).^2)./(1+gamma.*M2(1,i).^2).*((1+(gamma-1)/2.*M2(1,i).^2)./(1+(gamma-1)/2.*M1(1,i).^2))^(gamma/(gamma-1));
    else 
        disp('Cannot Handle the Truth')
    end
    i=i+1;
end

