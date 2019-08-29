clc,clear

%Constants
M1=2;
gamma=1.4;
boolean=1;
ittera_max=50;
error=zeros(1,ittera_max);
conv=1e-15;
j=1;
i=1;

%Preallocating Arrays For Itteration
deflect=linspace(0,10*pi/180,25);
sigma1=zeros(1,length(deflect));
delta=zeros(1,length(deflect));
M2=zeros(length(deflect),1);


%Begin Itterations
while (i<=length(deflect))
    sigma=asind(1/M1)*pi()/180;
    boolean=1;
    conv=1e-15;
    F=deflect(i);
    j=1;
    
    %Newton's Method First Sigma
    while boolean==1 && j<=ittera_max
        j=j+1;
        fval=atan(2*cot(sigma).*(M1^2*sin(sigma).^2-1)./(M1^2*(1.4+cos(2.*sigma))+2))-F;
        syms x
        f=(atan(2*cot(x).*(M1^2*sin(x).^2-1)./(M1^2*(1.4+cos(2.*x))+2)));
        df=vpa(subs(diff(f),x,sigma));
        df=double(df);
        x_new=sigma-fval/df;
        error(1,j)=abs(x_new-sigma);
        if (error(1,j)>=conv)
            boolean=1;
        else
            boolean=0;
        end
        sigma=x_new;
    end
    sigma1(1,i)=x_new;
    M1N=M1*sin(sigma);
    
    %Calculating Mach 2
    M2N=sqrt((M1N^2+2/(gamma-1))/((2*gamma)/(gamma-1)*M1N^2-1));
    M2(i,1)=M2N/(sin(sigma-fval));
    boolean=1;
    j=0;
    sigma2=asind(1/M2(i,1))*pi()/180;
    F=deflect(i);
    
    %Newton's Method Second Sigma
    while boolean==1 && j<=ittera_max
        j=j+1;
        fval=atan(2*cot(sigma2).*(M2(i,1)^2*sin(sigma2).^2-1)./(M2(i,1)^2*(1.4+cos(2.*sigma2))+2))-F;
        syms x
        f=(atan(2*cot(x).*(M2(i,1)^2*sin(x).^2-1)./(M2(i,1)^2*(1.4+cos(2.*x))+2)));
        df=vpa(subs(diff(f),x,sigma2));
        df=double(df);
        x_new=sigma2-fval/df;
        error(1,j)=abs(x_new-sigma2);
        if (error(1,j)>=conv)
            boolean=1;
        else
            boolean=0;
        end
        sigma2=x_new;
    end
    delta(1,i)=x_new;
    i=i+1;
end
hold on
delta=delta(1,1:22);
plot(deflect(1,1:length(delta))*180/pi,delta*180/pi,'*')
max=max(delta)*180/pi;
sigma=linspace(asind(1/M1),90,100);

%Begin Calculations
delta2=atand(2*cotd(sigma).*(M1^2*sind(sigma).^2-1)./(M1^2*(1.4+cosd(2.*sigma))+2));

%Plotting the Delta

plot(delta2,sigma)

M2IN=M2(22,1)*sin(delta(22));
M3N=sqrt((M2(22,1)^2+2/(gamma-1))/((2*gamma*M2(22,1)^2)/(gamma-1)-1));
M3=M3N/sin(delta(22)-deflect(22));
PT2=((1+gamma*M2IN^2)/(1+gamma*M3N^2))*((1+(gamma-1)/2*M3N^2)/(1+(gamma-1)/2*M2IN^2))^(gamma/(gamma-1));
PT1=((1+gamma*M1N^2)/(1+gamma*M2N^2))*((1+(gamma-1)/2*M2N^2)/(1+(gamma-1)/2*M1N^2))^(gamma/(gamma-1));
PT=PT1*PT2;


%Normal Shock Solution
M4=sqrt((M2(22,1)^2+2/(gamma-1))/((2*gamma*M2(22,1)^2)/(gamma-1)-1));
PT3=((1+gamma*M2(22,1)^2)/(1+gamma*M4^2))*((1+(gamma-1)/2*M4^2)/(1+(gamma-1)/2*M2(22,1)^2))^(gamma/(gamma-1));
