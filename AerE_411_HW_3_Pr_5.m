clc,clear

i=1;
gamma=1.4;
M0=.6;
T0=261;
cp=1000;
h=43*10^6;
A4=.015;
A2=.0756;

t_c=linspace(4,14,100).^((gamma-1)/gamma);
pic=linspace(4,14,100);

t_r=1+(gamma-1)/2*M0.^2;
t_lam=(t_c*t_r).^2;

Tt4=t_lam*T0;
Tt4d=Tt4;

Tt3=t_c.*t_r.*T0;

f=cp/h*(Tt4-Tt3);

Gamma=sqrt(gamma*(2/(gamma+1))^((gamma+1)/(gamma-1)));

M0=0;
t_r=1+(gamma-1)/2*M0^2;
t_lam=(t_c*t_r).^2;
Tt4=t_lam*T0;
Tt3=t_c*t_r*T0;

fz=cp/h*(Tt4-Tt3);
plot(pic,Tt4)
title("Total Temperature after Compressor vesus Pressure Ratio Across Compressor")
xlabel("Tt4 (K)")
ylabel("Pressure Ratio Across Compressor")

figure
hold on
plot(pic,f)
plot(pic,fz)
title("Enthalpy Balance Across Burner vesus Pressure Ratio Across Compressor")
legend("Plot of Design Mach","Plot of Off Design Mach")
xlabel("f")
ylabel("Pressure Ratio Across Compressor")

hold off

Fm=pic./(sqrt(t_lam)/t_r)*A4/A2;

conv=1*10^-7;
ittera_max=1000;
M2=zeros(1,length(Fm));
syms x
while i<=length(Fm)
    equ=x*(2/(gamma+1)*(1+(gamma-1)/2*x^2))^(-(gamma+1)/((gamma-1)*2));
    [~,M2(1,i),~]=Newtons_Method_Function(equ,conv,Fm(1,i),ittera_max,conv);
    i=i+1;
end

figure
plot(pic,M2)
title("Mach Number After Diffuser vesus Pressure Ratio Across Compressor")
xlabel("M2")
ylabel("Pressure Ratio Across Compressor")

figure
plot(Fm,pic)
title("Function of Mach Number vesus Pressure Ratio Across Compressor")
xlabel("F(M)")
ylabel("Pressure Ratio Across Compressor")
