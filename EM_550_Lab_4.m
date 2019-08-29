clc,clear

c_al=6200;
ro_al=2700;
c_w=1500;
ro_w=1000;

bw=400000;
wpd=10;
csc=-.2;
N_a=22000;

Z1=ro_w*c_w;
Z2=ro_al*c_al;

R=(Z2-Z1)/(Z2+Z1);
T=2*Z1/(Z2+Z1);

B=sqrt(2)*bw/2/sqrt(log(2));

N=452;
F=linspace(0,10,N)*10^6;
t=linspace(0,45,N);
A=1;
dt=1/max(F);
e=-((F-10^6)/B).^2;

y=exp(e);

figure()
hold on

plot(F,y)
title('Frequency Domain')
xlabel('Frequency (MHz)')
ylabel('Amplitude (Pa*s)')

hold off

Y=ifft_plot(y,N,F);

x_w=.01;

ex=exp(sqrt(-1)*(-2*pi*F/c_w*x_w));

P=y.*ex;

[~]=ifft_plot(P,N,F);

ex=exp(sqrt(-1)*(-2*pi*F/c_w*x_w*2));

P=y.*ex.^2;

[P_trans]=ifft_plot(P,N,F);

x_w=.01;
x_al=.015;
x_bs=x_al+.03;
dt=x_w/c_w+x_al/c_al;

ex=exp(-sqrt(-1)*(2*pi*F/c_w*x_w*2+2*pi*F/c_al*2*x_al));

P_trans_flaw=csc*T*y.*ex.^2;

[flaw]=ifft_plot(P_trans_flaw,N,F);

ex=exp(-sqrt(-1)*(2*pi*F/c_w*x_w*2+2*pi*F/c_al*2*x_bs));

P_trans_bs=T*y.*ex.^2;

[bs]=ifft_plot(P_trans_bs,N,F);

figure()

hold on

plot(t,P_trans+flaw)
title('Frequency Domain')
xlabel('Frequency (MHz)')
ylabel('Amplitude (Pa*s)')

hold off

figure()

hold on

plot(t,P_trans+flaw+bs)
title('Frequency Domain')
xlabel('Frequency (MHz)')
ylabel('Amplitude (Pa*s)')

hold off

noise = wgn(N,1,0)*N_a;

figure()

hold on

plot(t,P_trans+flaw+bs+noise')
title('Frequency Domain')
xlabel('Frequency (MHz)')
ylabel('Amplitude (Pa*s)')

hold off

y=P_trans+flaw+bs+noise';

x = hilbert(y);

figure()

hold on

plot(t,abs(x))
title('Frequency Domain')
xlabel('Frequency (MHz)')
ylabel('Amplitude (Pa*s)')

hold off


y=P_trans+flaw+bs+noise';

y=fft(y)*dt.*exp(e);

y=ifft(y)/dt;   

x = hilbert(y);

figure()

hold on

plot(t,abs(x))
title('Frequency Domain')
xlabel('Frequency (MHz)')
ylabel('Amplitude (Pa*s)')

hold off
