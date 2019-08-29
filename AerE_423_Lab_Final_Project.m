tic
clc,clear

%% Initial Variable Definition

T_w=[24.31,26.01,24.73,25.74,25.79,27.00,25.58,25.11,22.09,21.26,24.66,23.70];
T_t=[0.74,0.76,1.42,1.57,2.57,2.29,3.77,3.95,1.36,1.39,2.74,2.50];
T_L=[101.75,98.38,100.39,99.38,99.51,98.98,101.59,101.23,99.57,98.67,99.80,99.90];
T_m=[2.0,2.2,3.8,4.5,5.4,5.5,10.7,10.9,3.3,3.1,7.6,6.7];

B_w=[26.84,25.88,22.94,26.41,28.09,26.49,24.31,27.05,24.41,22.44,24.93,23.65];
B_t=[0.86,0.76,1.36,1.66,2.25,2.63,3.79,5.17,1.45,1.24,2.86,2.53];
B_L=[101.55,98.47,100.36,99.62,100.64,98.94,101.22,101.40,99.80,102.28,99.84,99.87];
B_m=[2.1,2.0,3.6,4.7,5.9,5.6,10.4,11.9,3.6,3.4,7.7,6.6];

G_l=70;

%For Running Average

span=5;

%% Import Tension Data  

T_1a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f1a.is_tens_RawData\Specimen_RawData_1.csv',3,463,1,6));
T_2a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f2a.is_tens_RawData\Specimen_RawData_1.csv',3,4618,1,6));
T_3a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f3a_1.is_tens_RawData\Specimen_RawData_1.csv',3,914,1,6));
T_4a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f4a.is_tens_RawData\Specimen_RawData_1.csv',3,813,1,6));
T_5a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f5a_1.is_tens_RawData\Specimen_RawData_1.csv',3,565,1,6));
T_6a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f6a.is_tens_RawData\Specimen_RawData_1.csv',3,815,1,6));
T_7a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f7a_1.is_tens_RawData\Specimen_RawData_1.csv',3,983,1,6));
T_8a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f8a.is_tens_RawData\Specimen_RawData_1.csv',3,1161,1,6));
T_9a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f9a_1.is_tens_RawData\Specimen_RawData_1.csv',3,635,1,6));
T_10a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f10a.is_tens_RawData\Specimen_RawData_1.csv',3,3551,1,6));
T_11a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f11a_1.is_tens_RawData\Specimen_RawData_1.csv',3,709,1,6));
T_12a=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Tension\Section_2_Group_4\f12a.is_tens_RawData\Specimen_RawData_1.csv',3,719,1,6));

%% Import Bending Data

B_1b=[table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f1b.is_comp_RawData\Specimen_RawData_1.csv',6,1449,1,3));table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f1b.is_comp_RawData\Specimen_RawData_2.csv',6,63,1,3))];
B_2b=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f2b.is_comp_RawData\Specimen_RawData_1.csv',6,1346,1,3));
B_3b=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f3b.is_comp_RawData\Specimen_RawData_1.csv',6,1311,1,3));
B_4b=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f4b.is_comp_RawData\Specimen_RawData_1.csv',6,1315,1,3));
B_5b=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f4b_1.is_comp_RawData\Specimen_RawData_1.csv',6,1284,1,3));
B_6b=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f6b.is_comp_RawData\Specimen_RawData_1.csv',6,1320,1,3));
B_7b=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f7b.is_comp_RawData\Specimen_RawData_1.csv',6,1261,1,3));
B_8b=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f8b.is_comp_RawData\Specimen_RawData_1.csv',6,1330,1,3));
B_9b=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f9b.is_comp_RawData\Specimen_RawData_1.csv',6,1305,1,3));
B_10b=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f10b.is_comp_RawData\Specimen_RawData_1.csv',6,1273,1,3));
B_11b=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f11b.is_comp_RawData\Specimen_RawData_1.csv',6,1319,1,3));
B_12b=table2array(importfile('C:\Users\Robert\Documents\MATLAB\Bending\Section2_group4\f12b.is_comp_RawData\Specimen_RawData_1.csv',6,1312,1,3));

%% Calculating Devisors of Samples

T_a=T_w.*T_t;
B_a=4*B_w.*B_t.^3/G_l^3;

%% Tension Running Average Data

T_f1a_2 =running_ave(T_1a(:,3)/T_a(1,1),span,length(T_1a));
T_f2a_2 =running_ave(T_2a(:,3)/T_a(1,2),span,length(T_2a));
T_f3a_2 =running_ave(T_3a(:,3)/T_a(1,3),span,length(T_3a));
T_f4a_2 =running_ave(T_4a(:,3)/T_a(1,4),span,length(T_4a));
T_f5a_2 =running_ave(T_5a(:,3)/T_a(1,5),span,length(T_5a));
T_f6a_2 =running_ave(T_6a(:,3)/T_a(1,6),span,length(T_6a));
T_f7a_2 =running_ave(T_7a(:,3)/T_a(1,7),span,length(T_7a));
T_f8a_2 =running_ave(T_8a(:,3)/T_a(1,8),span,length(T_8a));
T_f9a_2 =running_ave(T_9a(:,3)/T_a(1,9),span,length(T_9a));
T_f10a_2 =running_ave(T_10a(:,3)/T_a(1,10),span,length(T_10a));
T_f11a_2 =running_ave(T_11a(:,3)/T_a(1,11),span,length(T_11a));
T_f12a_2 =running_ave(T_12a(:,3)/T_a(1,12),span,length(T_12a));

%% Bending Running Average Data

B_1b_2 =running_ave(B_1b(:,3)/B_a(1,1),span,length(B_1b));
B_2b_2 =running_ave(B_2b(:,3)/B_a(1,2),span,length(B_2b));
B_3b_2 =running_ave(B_3b(:,3)/B_a(1,3),span,length(B_3b));
B_4b_2 =running_ave(B_4b(:,3)/B_a(1,4),span,length(B_4b));
B_5b_2 =running_ave(B_5b(:,3)/B_a(1,5),span,length(B_5b));
B_6b_2 =running_ave(B_6b(:,3)/B_a(1,6),span,length(B_6b));
B_7b_2 =running_ave(B_7b(:,3)/B_a(1,7),span,length(B_7b));
B_8b_2 =running_ave(B_8b(:,3)/B_a(1,8),span,length(B_8b));
B_9b_2 =running_ave(B_9b(:,3)/B_a(1,9),span,length(B_9b));
B_10b_2 =running_ave(B_10b(:,3)/B_a(1,10),span,length(B_10b));
B_11b_2 =running_ave(B_11b(:,3)/B_a(1,11),span,length(B_11b));
B_12b_2 =running_ave(B_12b(:,3)/B_a(1,12),span,length(B_12b));


%% Tension Maximums 

[Tu(1),T_f1a_ml]=max(T_1a(:,3));
[Tu(2),T_f2a_ml]=max(T_2a(:,3));
[Tu(3),T_f3a_ml]=max(T_3a(:,3));
[Tu(4),T_f4a_ml]=max(T_4a(:,3));
[Tu(5),T_f5a_ml]=max(T_5a(:,3));
[Tu(6),T_f6a_ml]=max(T_6a(:,3));
[Tu(7),T_f7a_ml]=max(T_7a(:,3));
[Tu(8),T_f8a_ml]=max(T_8a(:,3));
[Tu(9),T_f9a_ml]=max(T_9a(:,3));
[Tu(10),T_f10a_ml]=max(T_10a(:,3));
[Tu(11),T_f11a_ml]=max(T_11a(:,3));
[Tu(12),T_f12a_ml]=max(T_12a(:,3));

%% Bending Maximums

[~,B_1b_ml]=max(B_1b(:,3));
[~,B_2b_ml]=max(B_2b(:,3));
[~,B_3b_ml]=max(B_3b(:,3));
[~,B_4b_ml]=max(B_4b(:,3));
[~,B_5b_ml]=max(B_5b(:,3));
[~,B_6b_ml]=max(B_6b(:,3));
[~,B_7b_ml]=max(B_7b(:,3));
[~,B_8b_ml]=max(B_8b(:,3));
[~,B_9b_ml]=max(B_9b(:,3));
[~,B_10b_ml]=max(B_10b(:,3));
[~,B_11b_ml]=max(B_11b(:,3));
[~,B_12b_ml]=max(B_12b(:,3));

%% Tension Linear Fit

[T_1a_reg,T_1a_u,T_1a_Fit,T_1a_Data]=linreg(T_f1a_ml,T_1a(:,2),T_f1a_2);

[T_2a_reg,T_2a_u,T_2a_Fit,T_2a_Data]=linreg(389,T_2a(1:389,2),T_f2a_2(1:389));
[T_2a_reg_2,T_2a_u_2,T_2a_Fit_2,T_2a_Data_2]=linreg(T_f2a_ml-389,T_2a(389:T_f2a_ml,2),T_f2a_2(389:T_f2a_ml));

[T_3a_reg,T_3a_u,T_3a_Fit,T_3a_Data]=linreg(T_f3a_ml,T_3a(:,2),T_f3a_2);

[T_4a_reg,T_4a_u,T_4a_Fit,T_4a_Data]=linreg(T_f4a_ml,T_4a(:,2),T_f4a_2);

[T_5a_reg,T_5a_u,T_5a_Fit,T_5a_Data]=linreg(198,T_5a(:,2),T_f5a_2);

[T_6a_reg,T_6a_u,T_6a_Fit,T_6a_Data]=linreg(230,T_6a(:,2),T_f6a_2);

[T_7a_reg,T_7a_u,T_7a_Fit,T_7a_Data]=linreg(268,T_7a(:,2),T_f7a_2);

[T_8a_reg,T_8a_u,T_8a_Fit,T_8a_Data]=linreg(420,T_8a(:,2),T_f8a_2);

[T_9a_reg,T_9a_u,T_9a_Fit,T_9a_Data]=linreg(153,T_9a(1:153,2),T_f9a_2(1:153));
[T_9a_reg_2,T_9a_u_2,T_9a_Fit_2,T_9a_Data_2]=linreg(T_f9a_ml-153,T_9a(153:T_f9a_ml,2),T_f9a_2(153:T_f9a_ml));

[T_10a_reg,T_10a_u,T_10a_Fit,T_10a_Data]=linreg(257,T_10a(1:257,2),T_f10a_2(1:257));
[T_10a_reg_2,T_10a_u_2,T_10a_Fit_2,T_10a_Data_2]=linreg(T_f10a_ml-257,T_10a(257:T_f10a_ml,2),T_f10a_2(257:T_f10a_ml));

[T_11a_reg,T_11a_u,T_11a_Fit,T_11a_Data]=linreg(101,T_11a(1:101,2),T_f11a_2(1:101));
[T_11a_reg_2,T_11a_u_2,T_11a_Fit_2,T_11a_Data_2]=linreg(T_f11a_ml-101,T_11a(101:T_f11a_ml,2),T_f11a_2(101:T_f11a_ml));

[T_12a_reg,T_12a_u,T_12a_Fit,T_12a_Data]=linreg(94,T_12a(1:94,2),T_f12a_2(1:94));
[T_12a_reg_2,T_12a_u_2,T_12a_Fit_2,T_12a_Data_2]=linreg(T_f12a_ml-94,T_12a(94:T_f12a_ml,2),T_f12a_2(94:T_f12a_ml));

%% Bending Linear Fit

[B_1b_reg,B_1b_u,B_1b_Fit,B_1b_Data]=linreg(B_1b_ml,B_1b(:,2),B_1b_2);
[B_2b_reg,B_2b_u,B_2b_Fit,B_2b_Data]=linreg(B_2b_ml,B_2b(:,2),B_2b_2);
[B_3b_reg,B_3b_u,B_3b_Fit,B_3b_Data]=linreg(B_3b_ml,B_3b(:,2),B_3b_2);
[B_4b_reg,B_4b_u,B_4b_Fit,B_4b_Data]=linreg(B_4b_ml,B_4b(:,2),B_4b_2);
[B_5b_reg,B_5b_u,B_5b_Fit,B_5b_Data]=linreg(B_5b_ml,B_5b(:,2),B_5b_2);
[B_6b_reg,B_6b_u,B_6b_Fit,B_6b_Data]=linreg(B_6b_ml,B_6b(:,2),B_6b_2);
[B_7b_reg,B_7b_u,B_7b_Fit,B_7b_Data]=linreg(B_7b_ml,B_7b(:,2),B_7b_2);
[B_8b_reg,B_8b_u,B_8b_Fit,B_8b_Data]=linreg(B_8b_ml,B_8b(:,2),B_8b_2);
[B_9b_reg,B_9b_u,B_9b_Fit,B_9b_Data]=linreg(B_9b_ml,B_9b(:,2),B_9b_2);
[B_10b_reg,B_10b_u,B_10b_Fit,B_10b_Data]=linreg(B_10b_ml,B_10b(:,2),B_10b_2);
[B_11b_reg,B_11b_u,B_11b_Fit,B_11b_Data]=linreg(B_11b_ml,B_11b(:,2),B_11b_2);
[B_12b_reg,B_12b_u,B_12b_Fit,B_12b_Data]=linreg(B_12b_ml,B_12b(:,2),B_12b_2);

%% Tension Plots

figure(1)

hold on

plot(T_1a(:,2),T_1a(:,3)/T_a(1,1),'.')
plot(T_1a(:,2),T_f1a_2)
plot(T_1a(1:T_f1a_ml,2),T_1a_reg)
plot(T_1a(:,2),T_1a_Fit)
plot(T_1a(:,2),T_1a_Data)

title('Stress vs Strain Plot of 1a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(2)

hold on

plot(T_2a(:,2),T_2a(:,3)/T_a(1,2),'.')
plot(T_2a(:,2),T_f2a_2)
plot(T_2a(1:389,2),T_2a_reg)
plot(T_2a(1:389,2),T_2a_Fit)
plot(T_2a(1:389,2),T_2a_Data)
plot(T_2a(389:T_f2a_ml-1,2),T_2a_reg_2)
plot(T_2a(389:T_f2a_ml,2),T_2a_Fit_2)
plot(T_2a(389:T_f2a_ml,2),T_2a_Data_2)
title('Stress vs Strain Plot of 2a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression epoxy','95% probability linear regression error epoxy','95% probability data error epoxy',...
    'Linear regression fibers','95% probability linear regression error fibers','95% probability data errorfibers','location','best')

hold off

figure(3)

hold on

plot(T_3a(:,2),T_3a(:,3)/T_a(1,3),'.')
plot(T_3a(:,2),T_f3a_2)
plot(T_3a(1:T_f3a_ml,2),T_3a_reg)
plot(T_3a(:,2),T_3a_Fit)
plot(T_3a(:,2),T_3a_Data)

title('Stress vs Strain Plot of 3a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(4)

hold on

plot(T_4a(:,2),T_4a(:,3)/T_a(1,4),'.')
plot(T_4a(:,2),T_f4a_2)
plot(T_4a(1:T_f4a_ml,2),T_4a_reg)
plot(T_4a(:,2),T_4a_Fit)
plot(T_4a(:,2),T_4a_Data)

title('Stress vs Strain Plot of 4a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(5)

hold on

plot(T_5a(:,2),T_5a(:,3)/T_a(1,5),'.')
plot(T_5a(:,2),T_f5a_2)
plot(T_5a(1:198,2),T_5a_reg)
plot(T_5a(:,2),T_5a_Fit)
plot(T_5a(:,2),T_5a_Data)

title('Stress vs Strain Plot of 5a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(6)

hold on

plot(T_6a(:,2),T_6a(:,3)/T_a(1,6),'.')
plot(T_6a(:,2),T_f6a_2)
plot(T_6a(1:230,2),T_6a_reg)
plot(T_6a(:,2),T_6a_Fit)
plot(T_6a(:,2),T_6a_Data)

title('Stress vs Strain Plot of 6a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off
figure(7)

hold on

plot(T_7a(:,2),T_7a(:,3)/T_a(1,7),'.')
plot(T_7a(:,2),T_f7a_2)
plot(T_7a(1:268,2),T_7a_reg)
plot(T_7a(:,2),T_7a_Fit)
plot(T_7a(:,2),T_7a_Data)

title('Stress vs Strain Plot of 7a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(8)

hold on

plot(T_8a(:,2),T_8a(:,3)/T_a(1,8),'.')
plot(T_8a(:,2),T_f8a_2)
plot(T_8a(1:420,2),T_8a_reg)
plot(T_8a(:,2),T_8a_Fit)
plot(T_8a(:,2),T_8a_Data)

title('Stress vs Strain Plot of 8a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(9)

hold on

plot(T_9a(:,2),T_9a(:,3)/T_a(1,9),'.')
plot(T_9a(:,2),T_f9a_2)
plot(T_9a(1:153,2),T_9a_reg)
plot(T_9a(1:153,2),T_9a_Fit)
plot(T_9a(1:153,2),T_9a_Data)
plot(T_9a(153:T_f9a_ml-1,2),T_9a_reg_2)
plot(T_9a(153:T_f9a_ml,2),T_9a_Fit_2)
plot(T_9a(153:T_f9a_ml,2),T_9a_Data_2)

title('Stress vs Strain Plot of 9a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression epoxy','95% probability linear regression error epoxy','95% probability data error epoxy',...
    'Linear regression fibers','95% probability linear regression error fibers','95% probability data errorfibers','location','best')

hold off

figure(10)

hold on

plot(T_10a(:,2),T_10a(:,3)/T_a(1,10),'.')
plot(T_10a(:,2),T_f10a_2)
plot(T_10a(1:257,2),T_10a_reg)
plot(T_10a(1:257,2),T_10a_Fit)
plot(T_10a(1:257,2),T_10a_Data)
plot(T_10a(257:T_f10a_ml-1,2),T_10a_reg_2)
plot(T_10a(257:T_f10a_ml,2),T_10a_Fit_2)
plot(T_10a(257:T_f10a_ml,2),T_10a_Data_2)

title('Stress vs Strain Plot of 10a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression epoxy','95% probability linear regression error epoxy','95% probability data error epoxy',...
    'Linear regression fibers','95% probability linear regression error fibers','95% probability data errorfibers','location','best')

hold off

figure(11)

hold on

plot(T_11a(:,2),T_11a(:,3)/T_a(1,11),'.')
plot(T_11a(:,2),T_f11a_2)
plot(T_11a(1:101,2),T_11a_reg)
plot(T_11a(1:101,2),T_11a_Fit)
plot(T_11a(1:101,2),T_11a_Data)
plot(T_11a(101:T_f11a_ml-1,2),T_11a_reg_2)
plot(T_11a(101:T_f11a_ml,2),T_11a_Fit_2)
plot(T_11a(101:T_f11a_ml,2),T_11a_Data_2)

title('Stress vs Strain Plot of 11a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression epoxy','95% probability linear regression error epoxy','95% probability data error epoxy',...
    'Linear regression fibers','95% probability linear regression error fibers','95% probability data errorfibers','location','best')

hold off

figure(12)

hold on

plot(T_12a(:,2),T_12a(:,3)/T_a(1,12),'.')
plot(T_12a(:,2),T_f12a_2)
plot(T_12a(1:94,2),T_12a_reg)
plot(T_12a(1:94,2),T_12a_Fit)
plot(T_12a(1:94,2),T_12a_Data)
plot(T_12a(94:T_f12a_ml-1,2),T_12a_reg_2)
plot(T_12a(94:T_f12a_ml,2),T_12a_Fit_2)
plot(T_12a(94:T_f12a_ml,2),T_12a_Data_2)

title('Stress vs Strain Plot of 12a Fiber in Tension')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression epoxy','95% probability linear regression error epoxy','95% probability data error epoxy',...
    'Linear regression fibers','95% probability linear regression error fibers','95% probability data errorfibers','location','best')

hold off

figure(13)

hold on 

plot(T_4a(:,2),T_f4a_2,':b')
plot(T_8a(:,2),T_f8a_2,'-.r')
plot(T_12a(:,2),T_f12a_2,'--g')


title('Tension for comparison averaged data')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('4a Averaged','8a Averaged','12a Averaged','location','best')

hold off

figure(14)

hold on 

plot(T_3a(:,2),T_f3a_2,'-g')
plot(T_7a(:,2),T_f7a_2,'-.b')
plot(T_11a(:,2),T_f11a_2,'--r')

title('Tension for comparison averaged data')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('3a Averaged','7a Averaged','11a Averaged','location','best')

hold off

figure(15)

hold on 

plot(T_1a(:,2),T_f1a_2,'-b')
plot(T_5a(:,2),T_f5a_2,':r')
plot(T_9a(:,2),T_f9a_2,'-.g')

title('Tension for comparison averaged data')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('1a Averaged','5a Averaged','9a Averaged','location','best')

hold off

figure(16)

hold on 

plot(T_2a(:,2),T_f2a_2,'-b')
plot(T_6a(:,2),T_f6a_2,':r')
plot(T_10a(:,2),T_f10a_2,'-.g')

title('Tension for comparison averaged data')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('2a Averaged','6a Averaged','10a Averaged','location','best')

hold off

figure(17)

hold on 

plot(T_1a(:,2),T_f1a_2,':r')
plot(T_5a(:,2),T_f5a_2,':r')
plot(T_9a(:,2),T_f9a_2,':r')

plot(T_2a(:,2),T_f2a_2,'-g')
plot(T_6a(:,2),T_f6a_2,'-g')
plot(T_10a(:,2),T_f10a_2,'-g')

plot(T_3a(:,2),T_f3a_2,'-.b')
plot(T_7a(:,2),T_f7a_2,'-.b')
plot(T_11a(:,2),T_f11a_2,'-.b')

plot(T_4a(:,2),T_f4a_2,':k')
plot(T_8a(:,2),T_f8a_2,'-.k')
plot(T_12a(:,2),T_f12a_2,'--k')

title('Tension for comparison averaged data')
ylabel('Force over area (Stress in MPa)')
xlabel('Strain (mm/mm)')
legend('1a Averaged','5a Averaged','9a Averaged','2a Averaged','6a Averaged','10a Averaged','3a Averaged','7a Averaged','11a Averaged','4a Averaged','8a Averaged','12a Averaged','location','best')

hold off

%% Bending Plots

figure(18)

hold on

plot(B_1b(:,2),B_1b(:,3)/B_a(1,1),'.')
plot(B_1b(:,2),B_1b_2)
plot(B_1b(1:B_1b_ml,2),B_1b_reg)
plot(B_1b(:,2),B_1b_Fit)
plot(B_1b(:,2),B_1b_Data)

title('Stress vs Strain Plot of 1b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(19)

hold on

plot(B_2b(:,2),B_2b(:,3)/B_a(1,2),'.')
plot(B_2b(:,2),B_2b_2)
plot(B_2b(1:B_2b_ml,2),B_2b_reg)
plot(B_2b(:,2),B_2b_Fit)
plot(B_2b(:,2),B_2b_Data)

title('Stress vs Strain Plot of 2b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(20)

hold on

plot(B_3b(:,2),B_3b(:,3)/B_a(1,3),'.')
plot(B_3b(:,2),B_3b_2)
plot(B_3b(1:B_3b_ml,2),B_3b_reg)
plot(B_3b(:,2),B_3b_Fit)
plot(B_3b(:,2),B_3b_Data)

title('Stress vs Strain Plot of 3b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')
    
hold off

figure(21)

hold on

plot(B_4b(:,2),B_4b(:,3)/B_a(1,4),'.')
plot(B_4b(:,2),B_4b_2)
plot(B_4b(1:B_4b_ml,2),B_4b_reg)
plot(B_4b(:,2),B_4b_Fit)
plot(B_4b(:,2),B_4b_Data)

title('Stress vs Strain Plot of 4b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(22)

hold on

plot(B_5b(:,2),B_5b(:,3)/B_a(1,5),'.')
plot(B_5b(:,2),B_5b_2)
plot(B_5b(1:B_5b_ml,2),B_5b_reg)
plot(B_5b(:,2),B_5b_Fit)
plot(B_5b(:,2),B_5b_Data)

title('Stress vs Strain Plot of 5b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(23)

hold on

plot(B_6b(:,2),B_6b(:,3)/B_a(1,6),'.')
plot(B_6b(:,2),B_6b_2)
plot(B_6b(1:B_6b_ml,2),B_6b_reg)
plot(B_6b(:,2),B_6b_Fit)
plot(B_6b(:,2),B_6b_Data)

title('Stress vs Strain Plot of 6b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')
    
hold off

figure(24)

hold on

plot(B_7b(:,2),B_7b(:,3)/B_a(1,7),'.')
plot(B_7b(:,2),B_7b_2)
plot(B_7b(1:B_7b_ml,2),B_7b_reg)
plot(B_7b(:,2),B_7b_Fit)
plot(B_7b(:,2),B_7b_Data)

title('Stress vs Strain Plot of 7b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(25)

hold on

plot(B_8b(:,2),B_8b(:,3)/B_a(1,8),'.')
plot(B_8b(:,2),B_8b_2)
plot(B_8b(1:B_8b_ml,2),B_8b_reg)
plot(B_8b(:,2),B_8b_Fit)
plot(B_8b(:,2),B_8b_Data)

title('Stress vs Strain Plot of 8b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(26)

hold on

plot(B_9b(:,2),B_9b(:,3)/B_a(1,9),'.')
plot(B_9b(:,2),B_9b_2)
plot(B_9b(1:B_9b_ml,2),B_9b_reg)
plot(B_9b(:,2),B_9b_Fit)
plot(B_9b(:,2),B_9b_Data)

title('Stress vs Strain Plot of 9b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')
    
hold off

figure(27)

hold on

plot(B_10b(:,2),B_10b(:,3)/B_a(1,10),'.')
plot(B_10b(:,2),B_10b_2)
plot(B_10b(1:B_10b_ml,2),B_10b_reg)
plot(B_10b(:,2),B_10b_Fit)
plot(B_10b(:,2),B_10b_Data)

title('Stress vs Strain Plot of 10b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(28)

hold on

plot(B_11b(:,2),B_11b(:,3)/B_a(1,11),'.')
plot(B_11b(:,2),B_11b_2)
plot(B_11b(1:B_11b_ml,2),B_11b_reg)
plot(B_11b(:,2),B_11b_Fit)
plot(B_11b(:,2),B_11b_Data)

title('Stress vs Strain Plot of 11b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(29)

hold on

plot(B_12b(:,2),B_12b(:,3)/B_a(1,12),'.')
plot(B_12b(:,2),B_12b_2)
plot(B_12b(1:B_12b_ml,2),B_12b_reg)
plot(B_12b(:,2),B_12b_Fit)
plot(B_12b(:,2),B_12b_Data)

title('Stress vs Strain Plot of 12b Fiber in Bending')
ylabel('Force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('Raw','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')
    
hold off

figure(30)

hold on 

plot(B_1b(:,2),B_1b_2,'-r')
plot(B_5b(:,2),B_5b_2,':g')
plot(B_9b(:,2),B_9b_2,'-.b')

title('Bending for comparison averaged data')
ylabel('Averaged force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('1b Averaged','5b Averaged','9b Averaged','location','best')

hold off


figure(31)

hold on


plot(B_2b(:,2),B_2b_2,'-r')
plot(B_6b(:,2),B_6b_2,':g')
plot(B_10b(:,2),B_10b_2,'-.b')


title('Bending for comparison averaged data')
ylabel('Averaged force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('2b Averaged','6b Averaged','10b Averaged','location','best')

hold off


figure(32)

hold on 

plot(B_3b(:,2),B_3b_2,'-r')
plot(B_7b(:,2),B_7b_2,':g')
plot(B_11b(:,2),B_11b_2,'-.b')

title('Bending for comparison averaged data')
ylabel('Averaged force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('3b Averaged','7b Averaged','11b Averaged','location','best')

hold off

figure(33)

hold on 

plot(B_4b(:,2),B_4b_2,'-r')
plot(B_8b(:,2),B_8b_2,':g')
plot(B_12b(:,2),B_12b_2,'-.b')

title('Bending for comparison averaged data')
ylabel('Averaged force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('4b Averaged','8b Averaged','12b Averaged','location','best')

hold off

figure(34)

hold on 

plot(B_1b(:,2),B_1b_2,'-r')
plot(B_5b(:,2),B_5b_2,'-r')
plot(B_9b(:,2),B_9b_2,'-r')

plot(B_3b(:,2),B_3b_2,':g')
plot(B_7b(:,2),B_7b_2,':g')
plot(B_11b(:,2),B_11b_2,':g')

plot(B_2b(:,2),B_2b_2,'-.b')
plot(B_6b(:,2),B_6b_2,'-.b')
plot(B_10b(:,2),B_10b_2,'-.b')

plot(B_4b(:,2),B_4b_2,'--k')
plot(B_8b(:,2),B_8b_2,'--k')
plot(B_12b(:,2),B_12b_2,'--k')

title('Bending for comparison averaged data')
ylabel('Averaged force normailzed by dimensions(N/mm)')
xlabel('Strain (mm/mm)')
legend('1b Averaged','5b Averaged','9b Averaged','2b Averaged','6b Averaged','10b Averaged','3b Averaged','7b Averaged','11b Averaged','4b Averaged','8b Averaged','12b Averaged','location','best')

hold off

%% Elastic Modulus for Tension and Bending

E=[T_1a_u(2) T_2a_u(2) T_3a_u(2) T_4a_u(2) T_5a_u(2) T_6a_u(2) T_7a_u(2) T_8a_u(2) T_9a_u(2) T_10a_u(2) T_11a_u(2) T_12a_u(2)
    B_1b_u(2) B_2b_u(2) B_3b_u(2) B_4b_u(2) B_5b_u(2) B_6b_u(2) B_7b_u(2) B_8b_u(2) B_9b_u(2) B_10b_u(2) B_11b_u(2) B_12b_u(2)];

E_T=E(1,:)./(T_m./(T_t.*T_L.*T_w));
E_B=E(2,:).^(1/3)./(B_m./(B_t.*B_L.*B_w));

density=[(T_m./(T_t.*T_L.*T_w));(B_m./(B_t.*B_L.*B_w))];

S_W=[T_f1a_2(T_f1a_ml)/T_w(1),T_f2a_2(T_f2a_ml)/T_w(2),T_f3a_2(T_f3a_ml)/T_w(3),T_f4a_2(T_f4a_ml)/T_w(4),T_f5a_2(T_f5a_ml)/T_w(5),T_f6a_2(T_f6a_ml)/T_w(6),T_f7a_2(T_f7a_ml)/T_w(7),T_f8a_2(T_f8a_ml)/T_w(8),T_f9a_2(T_f9a_ml)/T_w(9),T_f10a_2(T_f10a_ml)/T_w(10),T_f11a_2(T_f11a_ml)/T_w(11),T_f12a_2(T_f12a_ml)/T_w(12)];

toc