clc,clear,clf

%% Defining Material Variables

%Matrix Numbers

E_m=2.81*10^9;

V_m=1-.62;
rho_m=1180;
G_m=1.44*10^9;

nu_m=E_m/(2*G_m)-1;

%Fiber Numbers

E_f=264.48*10^9;
V_f=.62;
rho_f=1800;
G_f=106.2*10^9;

nu_f=E_f/(2*G_f)-1;

%% Angle for Q xy

Theta=0;

%% Micromechanics Numbers

E_1=V_m*E_m+V_f*E_f;
E_2=1/(V_m/E_m+V_f/E_f);
nu_12=V_m*nu_m+V_f*nu_f;
G_12=1/(V_m/G_m+V_f/G_f);

%Calculating S from function

S=Calc_S_12(E_1,E_2,nu_12,G_12);

%Calculating Q in 12 coordinates

Q_12=S^-1;

%Calculating T from function

T=Calc_T(Theta);

%Calculating Q in xy coordinates

Q_xy=T*Q_12*T^(-1);

%% Part A

Theta=linspace(0,90,100);
E_x=zeros(1,length(Theta));
E_y=zeros(1,length(Theta));
G_xy=zeros(1,length(Theta));


for i=1:length(Theta)

    T=Calc_T(Theta(1,i));
    S_xy=T^(-1)*S*T;
    E_x(1,i)=1/S_xy(1,1);
    E_y(1,i)=1/S_xy(2,2);
    G_xy(1,i)=1/(S_xy(3,3)*2);
    
end

hold on

plot(Theta,(E_x))
plot(Theta,E_y)
plot(Theta,G_xy)

hold off

%% Part B

e_xma=[.005;0;0];
Theta=.61*180/pi;
T=Calc_T(Theta);
S=Calc_S_12(E_1,E_2,nu_12,G_12);
S_xy=T^(-1)*S*T;
Q_xy=S_xy^(-1);

S_xma_1=Q_xy*e_xma;

Theta=30;
T=Calc_T(Theta);
S=Calc_S_12(E_1,E_2,nu_12,G_12);
S_xy=T^(-1)*S*T;
Q_xy=S_xy^(-1);


S_xm_1=Q_xy*e_xma;

p_cs=(S_xma_1-S_xm_1)./(S_xma_1+S_xm_1);

%% Part C

s_xa=[150;0;0];
Theta=-.93*180/pi;
T=Calc_T(Theta);
S=Calc_S_12(E_1,E_2,nu_12,G_12);
S_xy=T^(-1)*S*T;

e_xma=S_xy*s_xa;

Theta=-60;
T=Calc_T(Theta);
S=Calc_S_12(E_1,E_2,nu_12,G_12);
S_xy=T^(-1)*S*T;

e_xma_1=S_xy*s_xa;

p_ce=(e_xma-e_xma_1)./(e_xma+e_xma_1);
