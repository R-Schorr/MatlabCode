tic

clc,clear

%% Defining Material Variables

%Matrix Numbers

E_m=3.6*10^9;
G_m=1.44*10^9;
V_m=.38;
nu_m=2*E_m/G_m-1;

%Fiber Numbers

E_f=265.4*10^9;
V_f=.62;
G_f=106.2*10^9;
nu_f=2*E_f/G_f-1;

%% Micromechanics Numbers

E_1=V_m*E_m+V_f*E_f;
E_2=1/(V_m/E_m+V_f/E_f);
nu_12=V_m*nu_m+V_f*nu_f;
G_12=1/(V_m/G_m+V_f/G_f);

%% Angle for Q xy

layers=10;

Theta=[90,10.125,45,45,45,90,0,90,90,0];

assert(layers==length(Theta),...
    'number of layers does not match the number of plys at particular angle')

t=.0053/39.37;
zk=linspace(0,t*layers,layers)';
zk_1=zk-t;

%% Thermal Component

Alpha_12=[-.23;18.8;0]*10^-6;

D_T=175-25;

%% Calculating Q in 12 coordinates

Q_12=Calc_S_12(E_1,E_2,nu_12,G_12)^-1;

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

CC_xy=[A_xy,B_xy;B_xy,D_xy];

N_T=Calc_N_T(Q_xy,zk,zk_1,Alpha_xy);
M_T=Calc_M_T(Q_xy,zk,zk_1,Alpha_xy);

Kap_xy=B_xy^-1*N_T*D_T;
Kap_xy_2=D_xy^-1*N_T*D_T;

Kap_xy_1=CC_xy^-1*[N_T;M_T]*D_T;

toc