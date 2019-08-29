clc,clear

P=5000;

tau_p=[6950 5780];

Sh_mod=[63685 26495]';

Ult_el=[.0052 .0114];
Y_el=[.00074 .00079];

t1=.25;
t2=.25;
w=1;

E=10^6;

ta=[2.5 5.5 7.5 9.5]./1000;

lam=sqrt(2.*Sh_mod(1,1)./ta.*(1/(E*t1)+2/(E*t2)));

L_prac=P./(2*tau_p(1,1))+2./lam;

tau_ave=2./(L_prac.*sqrt(1/(E.*t1)+1/(E.*t2))).*sqrt(tau_p(1,1).*ta'.*(Y_el(1,1)/2+(Ult_el(1,1)-Y_el(1,1))));
tau_ave2=2./(L_prac.*sqrt(1/(E.*t1)+1/(E.*t2))).*sqrt(tau_p(1,2).*ta'.*(Y_el(1,2)/2+(Ult_el(1,2)-Y_el(1,2))));


J_str=2*w./(sqrt(1/(E.*t1)+1/(E.*t2))).*sqrt(tau_p(1,1).*ta.*(Y_el(1,1)/2+(Ult_el(1,1)-Y_el(1,1))));
J_str2=2*w./(sqrt(1/(E.*t1)+1/(E.*t2))).*sqrt(tau_p(1,2).*ta.*(Y_el(1,2)/2+(Ult_el(1,2)-Y_el(1,2))));

FOS=J_str./P;
FOS2=J_str2./P;


nu=.33;
E_C=[1.6*10^5 6*10^4];
Mpeel=[7000 3000];

sig_c_max=tau_p.*(3*E_C.*(1-nu).*t2./(E.*ta')).^(-1/4);
sig_c_ult=(Mpeel*t2/4)/(1/12*(t2/2)^3);

Fos=sig_c_ult./sig_c_max;

figure
hold on
plot(ta,FOS)
plot(ta,FOS2)
xlabel('ta')
ylabel('FOS')
figure
plot(ta,J_str)
plot(ta,J_str)
xlabel('ta')
ylabel('Joint Strength (psi)')
figure
plot(ta,L_prac)
xlabel('ta')
ylabel('Practical Length of the Joint (in)')
figure
plot(ta,sig_c_max)
xlabel('ta')
ylabel('Max Peel Stress')
