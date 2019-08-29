clc,clear

Alt=25000;
atm=101.375;
int_mult=.75;
ply=125*10^-6;
FOS=4;
E=62*10^9;
E_b=200*10^9;
nu=.33;
a=2;
b=1.4;
conv=1^-6;
ittera_max=1000;


Ult_t=290*10^6;
Ult_c=240*10^6;
Tau_max=160*10^6;

p_alt=101375*(1-2.25577*10^-5*Alt)^5.25588;
p_int=int_mult*atm;

p=(p_int*1000-p_alt);
syms x

L_the=p*a*(1-(a^2/(2*x^2)))/Ult_c*FOS;
[~,b,~]=Newtons_Method_Function(L_the,conv,0,ittera_max,b);
b=round(b+.01,2);

L_theta=double(subs(L_the,x,b));
L_shell=p*a^2/(2*b)/(Ult_t)*FOS;
L_equ=p*a/2/Ult_c*FOS;

L=max([L_theta,L_shell,L_equ]);

ply_number=ceil(L/(ply*8));

t=ply_number*8*ply;

sigma_shell=p*a^2/(2*b*t)*FOS;
sigma_equ=p*a/2/t*FOS;
sigma_theta=p*a*(1-(a^2/(2*b^2)))/t*FOS;


Sigma_vec=[(sigma_theta-sigma_shell)/2 (sigma_shell-sigma_equ)/2 (sigma_equ-sigma_theta)/2];
T_max=max(abs(Sigma_vec));

FOS_TAU=Tau_max/T_max*FOS;
FOS_Sig_3=Ult_c/sigma_equ*FOS;
FOS_Sig_1=Ult_c/sigma_theta*FOS;
FOS_Sig_2=Ult_t/sigma_shell*FOS;

e_z=1/E*(p*FOS-nu*(sigma_shell*2));

E_r=[71.9*10^9 71*10^9 72*10^9 72*10^9 73.1*10^9 169*10^9 71.7*10^9 201*10^9 113.8*10^9 190*10^9 190*10^9 207*10^9];
r=[3/32 1/8 5/32 3/16 1/4 5/16 3/8 7/16 1/2 9/16]./2;

area=[r.^2*pi;r.^2*pi;r.^2*pi;r.^2*pi;r.^2*pi;r.^2*pi;r.^2*pi;r.^2*pi;r.^2*pi;r.^2*pi;r.^2*pi;r.^2*pi];

F_tension=e_z/2*E_r.*area';

num_riv_F=pi*a^2*p*FOS;

riv_F_psi=1.45038e-7*num_riv_F./(r.*2)*1000/15;

riv=min(num_riv_F);


ta=0.0001397;
gamma_p=5.3;
gamma_e=1;
E=85.669;
shear_str=17.05;
w=5/100;
G=5*10^9;

lam=sqrt(2*G/ta*(1/(E*t)+2/(E*t)));
tp=p/(2*(w-2/lam));

joint_Str=2*w/(sqrt(1/(E*t)+2/(E*t)))*sqrt(tp*ta*(gamma_e/2+gamma_p));

t_ave=2/(w*sqrt(1/(E*t)+2/(E*t)))*sqrt(tp*ta*(gamma_e/2+gamma_p));

FOS_ADh=t_ave/joint_Str;