function[Y] = ifft_plot(y,N,F)

df = max(F)/N;
dt = 1/max(F);

%% obtain spectra by FFT

Y = N*df*ifft(y,N);
Ymag=Y; 
time=(0:(N-1))*max(F)*dt/10;
figure('name',' Time Domain')
plot(time,Ymag)
title('Time Domain')
xlabel('Time (microseconds)')
ylabel('Pressure (Pa)')