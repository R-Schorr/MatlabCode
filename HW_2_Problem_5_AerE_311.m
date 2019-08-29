clc,clear
%Define Constants
gamma=1.4;

%Defining Variables
P1=input('Enter Upstream Pressure');
M1=input('Enter Upstream Mach Number');
T1=input('Enter Upstream Temperature');
RO1=input('Enter Upstream Density');


%Calculations
PT1=P1*(1/(1+(gamma-1)/2*M1^2))^(gamma/(gamma-1));
M2=sqrt((M1^2+2/(gamma-1))/((2*gamma*M1^2)/(gamma-1)-1));
P2=((1+M1^2*gamma)/(1+gamma*M2^2))*P1;
RO2=(M1/M2)*((1+((gamma-1)/2)*M2^2)/((1+((gamma-1)/2)*M1^2)))^(1/2)*RO1;
T2=(1+(gamma-1)/2*M1^2)/(1+(gamma-1)/2*M2^2)*T1;
PT2=((1+gamma*M1^2)/(1+gamma*M2^2))*((1+(gamma-1)/2*M2^2)/(1+(gamma-1)/2*M1^2))^(gamma/(gamma-1))*PT1;

%Printing Results
fprintf('Mach 2 %f\n',M2)
fprintf('Temperature Ratio %f\n',T2)
fprintf('Pressure Ratio %f\n',P2)
fprintf('Density Ratio %f\n',RO2)
fprintf('Pressure Total Ratio %f\n',PT2)

%Calculations
M2=sqrt((M1^2+2/(gamma-1))/((2*gamma*M1^2)/(gamma-1)-1));
P2=((1+M1^2*gamma)/(1+gamma*M2^2));
RO2=(M1/M2)*((1+((gamma-1)/2)*M2^2)/((1+((gamma-1)/2)*M1^2)))^(1/2);
T2=(1+(gamma-1)/2*M1^2)/(1+(gamma-1)/2*M2^2);
PT2=((1+gamma*M1^2)/(1+gamma*M2^2))*((1+(gamma-1)/2*M2^2)/(1+(gamma-1)/2*M1^2))^(gamma/(gamma-1));

%Printing Results
fprintf('Mach 2 %f\n',M2)
fprintf('Temperature 2 %f\n',T2)
fprintf('Pressure 2 %f\n',P2)
fprintf('Density 2 %f\n',RO2)
fprintf('Pressure Total 2 %f\n',PT2)

%Plot Constant
M1=linspace(1,3,100);

%Begining Plot Calcualtions
M2=sqrt((M1.^2+2/(gamma-1))./((2*gamma*M1.^2)/(gamma-1)-1));
P2=((1+M1.^2*gamma)./(1+gamma.*M2.^2));
RO2=(M1./M2).*((1+(gamma-1)./2*M2.^2)./((1+(gamma-1)/2.*M1.^2))).^(1/2);
T2=(1+(gamma-1)/2.*M1.^2)./(1+(gamma-1)/2.*M2.^2);
PT2=((1+gamma.*M1.^2)./(1+gamma.*M2.^2)).*((1+(gamma-1)/2.*M2.^2)./(1+(gamma-1)/2.*M1.^2)).^(gamma/(gamma-1));
 
%Begin Plot
figure
hold on
plot(M1,M2)
plot(M1,P2)
plot(M1,RO2)
plot(M1,T2)
plot(M1,PT2)
hold off