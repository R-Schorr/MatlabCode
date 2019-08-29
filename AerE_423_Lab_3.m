clc,clear

%% Initial Variable Definition

T_w=[12.57,12.65,12.69];
T_t=[1.5,1.47,1.55];
T_m=[5.4,5.5,5.4];

B_w=[18.93,19.00,19.01];
B_t=[1.47,1.54,1.53];
B_m=[6.8,6.8,6.7];

%For Running Average

span=5; 

t_b=.025;

%% Import Data First Tension then bending

T_0=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Orientation0_Specimen_RawData_1.csv',3,810));
T_45=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Orientation45_Specimen_RawData_1.csv',3,4090));
T_90=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Orientation90_Specimen_RawData_1.csv',3,250));

T_0(:,2)=T_0(:,2)-T_0(1,2);
T_45(:,2)=T_45(:,2)-T_45(1,2);
T_90(:,2)=T_90(:,2)-T_90(1,2);

[B_0,~]=xlsread('C:\Users\Robert\Documents\MATLAB\Bending\Specimen_RawData_1.csv');
[B_45,~]=xlsread('C:\Users\Robert\Documents\MATLAB\Bending\Orientation45_Specimen_RawData_1.csv');
[B_90,~]=xlsread('C:\Users\Robert\Documents\MATLAB\Bending\Orientation90_Specimen_RawData_1.csv');

B_0=B_0(6:length(B_0),:);
B_45=B_45(6:length(B_45),:);
B_90=B_90(6:length(B_90),:);

%% Calculating Area of Samples

T_a=T_w.*T_t;
B_a=B_w.*B_t;

%% Running Average of Data

T_0_2 =running_ave(T_0(:,3)/T_a(1,1),span,length(T_0));
T_45_2 =running_ave(T_45(:,3)/T_a(1,2),span,length(T_45));
T_90_2 =running_ave(T_90(:,3)/T_a(1,3),span,length(T_90));

B_0_2 =running_ave(B_0(:,3)/B_a(1,1),span,length(B_0));
B_45_2 =running_ave(B_45(:,3)/B_a(1,2),span,length(B_45));
B_90_2 =running_ave(B_90(:,3)/B_a(1,3),span,length(B_90));


%% Linear Fit 

[~,T_0_ml]=max(T_0(:,3));
[~,T_45_ml]=max(T_45(:,3));
[~,T_90_ml]=max(T_90(:,3));

[~,B_0_ml]=max(B_0(:,3));
[~,B_45_ml]=max(B_45(:,3));
[~,B_90_ml]=max(B_90(:,3));

[T_0_reg,T_0_u,T_0_Fit,T_0_Data]=linreg(round(T_0_ml*.5),T_0(1:T_0_ml,2),T_0_2);
[T_45_reg,T_45_u,T_45_Fit,T_45_Data]=linreg(450,T_45(1:497,2),T_45_2(1:497));
[T_45_reg_2,T_45_u_2,T_45_Fit_2,T_45_Data_2]=linreg(round(T_45_ml*.9)-497,T_45(497:T_45_ml,2),T_45_2(497:round(T_45_ml*.9)));
[T_90_reg,T_90_u,T_90_Fit,T_90_Data]=linreg(round(T_90_ml*.9),T_90(1:T_90_ml,2),T_90_2);

[B_0_reg,B_0_u,B_0_Fit,B_0_Data]=linreg(round(B_0_ml*.9),B_0(1:B_0_ml,1)*t_b,B_0_2);
[B_45_reg,B_45_u,B_45_Fit,B_45_Data]=linreg(round(B_45_ml*.9),B_45(1:B_45_ml,1)*t_b,B_45_2);
[B_90_reg,B_90_u,B_90_Fit,B_90_Data]=linreg(round(B_90_ml*.9),B_90(1:B_90_ml,1)*t_b,B_90_2);

%% Plots

figure(1)

hold on

plot(T_0(:,2),T_0_2)
plot(T_0(1:round(T_0_ml*.5),2),T_0_reg)
plot(T_0(1:T_0_ml,2),T_0_Fit)
plot(T_0(1:T_0_ml,2),T_0_Data)

title('Stress vs Strain Plot of 0 degree Oriented Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(2)

hold on

plot(T_45(:,2),T_45_2)
plot(T_45(1:450,2),T_45_reg)
plot(T_45(1:497,2),T_45_Fit)
plot(T_45(1:497,2),T_45_Data)

plot(T_45(:,2),T_45_2)
plot(T_45(498:round(T_45_ml*.9),2),T_45_reg_2)
plot(T_45(497:T_45_ml,2),T_45_Fit_2)
plot(T_45(497:T_45_ml,2),T_45_Data_2)

title('Stress vs Strain Plot of 45 degree Oriented Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Averaged Expoy','Linear regression Epoxy','95% probability linear regression error Epoxy','95% probability data error Epoxy',...
    'Averaged Fiber','Linear regression Fiber','95% probability linear regression error Fiber','95% probability data error Fiber','location','best')


hold off

figure(3)

hold on

plot(T_90(:,2),T_90_2)
plot(T_90(1:round(T_90_ml*.9),2),T_90_reg)
plot(T_90(1:T_90_ml,2),T_90_Fit)
plot(T_90(1:T_90_ml,2),T_90_Data)

title('Stress vs Strain Plot of 90 degree Oriented Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(4)

hold on

plot(B_0(:,1)*t_b,B_0_2)
plot(B_0(1:round(B_0_ml*.9),1)*t_b,B_0_reg)
plot(B_0(1:B_0_ml,1)*t_b,B_0_Fit)
plot(B_0(1:B_0_ml,1)*t_b,B_0_Data)

title('Stress vs Strain Plot of 0 degree Oriented Fiber in Bending')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(5)

hold on

plot(B_45(:,1)*t_b,B_45_2)
plot(B_45(1:round(B_45_ml*.9),1)*t_b,B_45_reg)
plot(B_45(1:B_45_ml,1)*t_b,B_45_Fit)
plot(B_45(1:B_45_ml,1)*t_b,B_45_Data)

title('Stress vs Strain Plot of 45 degree Oriented Fiber in Bending')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(6)

hold on

plot(B_90(:,1)*t_b,B_90_2)
plot(B_90(1:round(B_90_ml*.9),1)*t_b,B_90_reg)
plot(B_90(1:B_90_ml,1)*t_b,B_90_Fit)
plot(B_90(1:B_90_ml,1)*t_b,B_90_Data)

title('Stress vs Strain Plot of 90 degree Oriented Fiber in Bending')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')
    
hold off

E=[T_0_u(2),T_45_u(2),T_90_u(2),B_0_u(2),B_45_u(2),B_90_u(2)];

ULT=[max(T_0(:,4)),max(T_45(:,4)),max(T_90(:,4));max(T_0(:,6)),max(T_45(:,6)),max(T_90(:,6))];
YIE=ULT(2,:)*.98;

%% Defining Material Variables For Theoretical Calculation

%Matrix Numbers

E_m=3.6*10^9;
V_m=1-.62;
G_m=1.44*10^9;

nu_m=E_m/(2*G_m)-1;

%Fiber Numbers

E_f=264.48*10^9;
V_f=.62;
G_f=106.2*10^9;

nu_f=E_f/(2*G_f)-1;

%% Micromechanics Numbers

E_1=V_m*E_m+V_f*E_f;
E_2=1/(V_m/E_m+V_f/E_f);
nu_12=V_m*nu_m+V_f*nu_f;
G_12=1/(V_m/G_m+V_f/G_f);

%Calculating S from function

S=Calc_S_12(E_1,E_2,nu_12,G_12);

%Calculating Q in 12 coordinates

Q_12=S^-1;

%Elastic Modulus for 0 degree and 90 degree (x and y are just flipped for 90)

E_x=1/S(1,1);
E_y=1/S(2,2);
nu_xy=-E_2*S(1,2);
Gxy=1/(2*S(3,3));

%% Angle for Q xy

Theta=45;

%Calculating T from function

T=Calc_T(Theta);

S_xy=T^-1*S*T;

%E 45 degrees

E_x_45=1/S_xy(1,1);
E_y_45=1/S_xy(2,2);
nu_xy_45=-E_2*S_xy(1,2);
Gxy_45=1/(2*S_xy(3,3));

