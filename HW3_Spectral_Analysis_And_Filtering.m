clc,clear
load HW3_Data.txt
TD = 5;
DP=20000;
ct = TD/DP;
cf = 1/(DP*ct);
M = DP;
F = 800;
t=(0:DP-1)*ct;
figure
plot(t,HW3_Data)
xlabel('time (seconds)')
ylabel('Audio Signal')
title('Audio Signal Versus Time')
xlim([0,5])
FFT=(1/DP)*fft(HW3_Data,DP);
L=.00025;
P1=abs(FFT);
fl=nearest(F/cf);

figure
%fr=(0:m(DP-1))*cf;
%plot(fr(1:fl),P1(1:fl))
ylabel('Transformed Data')
xlabel('Frequency (Hz)')
title('Transformed Data Versus Frequency')
Y=running_ave(HW3_Data,5);
Y1=running_ave(Y,15);


FFT2=(1/DP)*fft(Y1,DP);
P2=abs(FFT2);
k=find((P2-max(P2)+.04)>0);
tu=Y1(k(1,1));
figure
%plot(fr(1:fl),P2(1:fl))
ylabel('Transformed and Avaraged Data')
xlabel('Frequency (Hz)')
title('Transformed and Avaraged Data Versus Frequency')
