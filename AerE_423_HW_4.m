tic

clc,clear

%% Defining Material Variables

%Matrix Numbers

E_m=9*10^9;
nu_m=.3;
G_m=E_m/(2*(1+nu_m));

%Fiber Numbers

E_f=138*10^9;
nu_f=.3;
G_f=6.9*10^9;

%% Angle for Q xy

layers=14;

Theta=[0,0,45,-45,30,-30,0,0,-30,30,-45,45,0,0];

assert(layers==length(Theta),...
    'number of layers does not match the number of plys at particular angle')

zk=linspace(-1.75,1.75,14)';
zk_1=zk-.25;

%% Thermal Component

Alpha_12=[-.23;18.8;0]*10^-6;

D_T=175-25;

%% Strain and Stress Component

Eps_0=[.005;0;0];

S_0=[150*10^6;0;0];

t=abs(zk_1(1))+abs(zk(length(zk)));

M_0=[10;0;0];

%% Micromechanics Numbers

%Calculating Q in 12 coordinates

Q_12=Calc_S_12(E_f,E_m,nu_f,G_f)^-1;

Q_xy=zeros(3,3,layers);

Alpha_xy=zeros(3,1,layers);

%Calculating T from function

for i=1:layers

    T=Calc_T(Theta(i));

    %Calculating Q in xy coordinates

    Q_xy(:,:,i)=T*Q_12*T^(-1);
    
    %Calculating Alpha in xy coordinates
    
    Alpha_xy(:,:,i)=T^(-1)*Alpha_12;

end

A_xy=Calculate_A_xy(Q_xy,zk,zk_1);
B_xy=Calculate_B_xy(Q_xy,zk,zk_1);
D_xy=Calculate_D_xy(Q_xy,zk,zk_1);

S_T=A_xy/t*Eps_0;
 
E_T=A_xy^-1*t* S_0;
 
S_l=zeros(3,1,layers);

for i=1:layers
   
    S_l(:,:,i)=Calc_T(Theta(i))*S_0;
    
end

Kap_T=D_xy^-1*M_0;

S_l_x(1,:)=S_l(1,1,:);
S_l_y(1,:)=S_l(2,1,:);
S_l_xy(1,:)=S_l(3,1,:);

figure()

hold on

plot(S_l_x,zk,'--')
plot(S_l_y,zk,'--')
%plot(S_l_xy,zk,'--')

hold off

figure()

plot(S_l_xy,zk,'--')

toc

