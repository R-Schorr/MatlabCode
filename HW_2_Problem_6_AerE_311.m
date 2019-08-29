clc,clear

%Defining Constants
gamma=1.4;

%User Inputs
M1=input('Enter Mach Number: ');
sigma=input('Enter Shock Angle: ');
sc=input('Enter s for strong or w for weak: ','s');
d=input('Enter Turning Angle in degrees: ');
delta1=atand(2*cotd(sigma).*(M1^2*sind(sigma).^2-1)./(M1^2*(1.4+cosd(2.*sigma))+2));
sigma1=sigma;
%Define Variables
sigma=linspace(asind(1/M1),90,100);

%Begin Calculations
delta=atand(2*cotd(sigma).*(M1^2*sind(sigma).^2-1)./(M1^2*(1.4+cosd(2.*sigma))+2));
%Plotting the Delta
hold on
plot(delta,sigma)
plot(delta1,sigma1,'*')

%Begin Newton's Method
ittera_max=1000;
if sc=='s'
    sigma=pi/2;    
elseif sc=='w'
    sigma=asind(1/M1)*pi()/180;
else
    fprintf('Non-Valid Shock Solution \n')
end
boolean=1;
conv=1e-15;
i=0;
F=d*pi()/180;
while boolean==1 && i<=ittera_max
    i=i+1;
    fval=atan(2*cot(sigma).*(M1^2*sin(sigma).^2-1)./(M1^2*(1.4+cos(2.*sigma))+2))-F;
    syms x
    f=(atan(2*cot(x).*(M1^2*sin(x).^2-1)./(M1^2*(1.4+cos(2.*x))+2)));
    df=vpa(subs(diff(f),x,sigma));
    df=double(df);
    x_new=sigma-fval/df;
    error(1,i)=abs(x_new-sigma);
    if (error(1,i)>=conv)
        boolean=1;
    else
        boolean=0;
    end
    sigma=x_new;
end

%Plotting in Degrees
sigma=sigma*180/pi;
plot(d,sigma,'*')
hold off