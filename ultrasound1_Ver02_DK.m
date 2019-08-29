clear,clc

fs = 10*10^6; % sampling frequency
dt = 1/fs;    % sample time
n = 452;
t = (0:(n-1))*dt; % time domain
f = (0:(n-1))/(dt*n); % frequency domain
f0 = 1*10^6;  % center frequency = 1MHz
B = 400*10^3;  % Bandwidth = 400 kHz

%%% 1 - Wave at source transducer, frequency domain
A = exp(-(f-f0).^2/B^2);
figure(1)
plot(f, A)
grid on
%%% 2 - Wave at source transducer, time domain
a = ifft(A)*fs*n;
figure(2)
plot(t,a)
grid on
%%% Time delay %%%
%%% 3 - Wave at water/solid boundary
x0 = 0.01; % the distance of wave propagation in water = 10 mm
c_water = 1500; % sound velocity of water
A1 = exp(-(f-f0).^2/B^2).*exp(-1i*2*pi*f/c_water*x0);
a1 = ifft(A1);
figure(3)
plot(t,a1)
grid on
%%% 4 - Waveform detected by transducer, ###front surface reflection###
c_water = 1500; %[m/s]
rho_water = 1000; %[kg/m^3]
c_al = 6200; %[m/s]
rho_al = 2700; %[kg/m^3]
Z1 = rho_water*c_water;
Z2 = rho_al*c_al;
R = (Z2-Z1)/(Z2+Z1);
T = 2*Z1/(Z2+Z1);
A2 = R*exp(-(f-f0).^2/B^2).*exp(-1i*2*pi*f/c_water*2*x0);
a2 = ifft(A2);
figure(4)
plot(t,a2)
hold on
grid on
%%% 5 - Waveform detected by transducer, ###scatterer###
x1 = 0.015;
A3 = -0.2*T*exp(-(f-f0).^2/B^2).*exp(-1i*2*pi*((f/c_water*2*x0)+(f/c_al*2*x1)));
a3 = ifft(A3);
% figure(5)
plot(t,a3)
hold on
% grid on
%%% 6 - Waveform detected by transducer, ###back surface###
x2 = 0.045;
A4 = T*exp(-(f-f0).^2/B^2).*exp(-1i*2*pi*((f/c_water*2*x0)+(f/c_al*2*x2)));
a4 = ifft(A4);
% figure(6)
plot(t,a4)
% grid on

%%% 1. Plot combined signal
%%% ************2. Solve the amplitude & phase problem***********
%%% ****the exact values of Reflection and Transmission coefficients****