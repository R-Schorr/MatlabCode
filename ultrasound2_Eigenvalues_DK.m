clear all; clc;

f = 1*10^6; % frequency [1 MHz]

% Elastic constants & Directions of wave vectors
C11=14e9; C22=86.6e9; C33=13.5e9;
C12=6.4e9; C13=6.8e9; C23=9e9;
C44=4.7e9; C55=2.7e9; C66=4.1e9;
% assume the direction of wave vectors
K_hat_1 = 1;
K_hat_2 = 1;
K_hat_3 = -1;

rho=1.5e3;  % density
f = 1*10^6; % frequency [1 MHz]

C = [ C11 C12 C13 0 0 0 
      C12 C22 C23 0 0 0
      C13 C23 C33 0 0 0
       0   0   0  C44 0 0 
       0   0   0  0  C55 0
       0   0   0  0   0 C66];
D = [K_hat_1 0 0
     0 K_hat_2 0
     0 0 K_hat_3
     0 K_hat_3 K_hat_2
     K_hat_3 0 K_hat_1
     K_hat_2 K_hat_1 0];
Dt = D';
% Eigenvalue problem
A = Dt*C*D;
% Eigenvalues
lamda = eig(A);

wave_speed_1 = sqrt(lamda(1,1)/rho); % f/k
wave_speed_2 = sqrt(lamda(2,1)/rho);
wave_speed_3 = sqrt(lamda(3,1)/rho);

% Amplitude of wave vectors
amp_k1 = f/wave_speed_1;
amp_k2 = f/wave_speed_2;
amp_k3 = f/wave_speed_3;
% Wave vectors [amp_K * K hat]
k1 = amp_k1*K_hat_1;
k2 = amp_k2*K_hat_2;
k3 = amp_k3*K_hat_3;

