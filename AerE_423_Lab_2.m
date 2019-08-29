clc,clear,clf

[f_4,~]=xlsread('C:\Users\Robert\Documents\MATLAB\filler_4ply.is_comp_RawData\Specimen_RawData_1.csv');
[f_8,~]=xlsread('C:\Users\Robert\Documents\MATLAB\filler_8ply.is_comp_RawData\Specimen_RawData_1.csv');
[nf_4,~]=xlsread('C:\Users\Robert\Documents\MATLAB\nofiller_4ply.is_comp_RawData\Specimen_RawData_1.csv');
[nf_8,~]=xlsread('C:\Users\Robert\Documents\MATLAB\nofiller_8ply.is_comp_RawData\Specimen_RawData_1.csv');

t=1.5*60/10^6;

f_4_a=29.5*.82/10^6;
f_8_a=26.92*1.4/10^6;
nf_4_a=26.18*.84/10^6;
nf_8_a=26.59*1.36/10^6;


f_4=f_4(6:length(f_4),:);
f_8=f_8(6:length(f_8),:);
nf_4=nf_4(6:length(nf_4),:);
nf_8=nf_8(6:length(nf_8),:);

f_4_2=running_ave(f_4(:,3)/f_4_a,9,length(f_4));
f_8_2=running_ave(f_8(:,3)/f_8_a,9,length(f_8));
nf_4_2=running_ave(nf_4(:,3)/nf_4_a,9,length(nf_4));
nf_8_2=running_ave(nf_8(:,3)/nf_8_a,9,length(nf_8));

figure(1)

hold on

title('Raw Data')
xlabel('Strain')
ylabel('Stress (Pa)')

plot(f_4(:,1)*t,f_4(:,3)/f_4_a)
plot(f_8(:,1)*t,f_8(:,3)/f_8_a)
plot(nf_4(:,1)*t,nf_4(:,3)/nf_4_a)
plot(nf_8(:,1)*t,nf_8(:,3)/nf_8_a)

legend('4 ply with filler','8 ply with filler','4 ply no filler','8 ply no filler','location','best')

hold off

[~,f_4_ml]=max(f_4_2);
[~,f_8_ml]=max(f_8_2);
[~,nf_4_ml]=max(nf_4_2);
[~,nf_8_ml]=max(nf_8_2);

[f_4_reg,f_4_m,f_f_f_4,f_f_d_4]=linreg(f_4_ml,f_4(1:f_4_ml,1)*t,f_4_2);
[f_8_reg,f_8_m,f_f_f_8,f_f_d_8]=linreg(f_8_ml,f_8(1:f_8_ml,1)*t,f_8_2);
[nf_4_reg,nf_4_m,nf_f_f_4,nf_f_d_4]=linreg(nf_4_ml,nf_4(1:nf_4_ml,1)*t,nf_4_2);
[nf_8_reg,nf_8_m,nf_f_f_8,nf_f_d_8]=linreg(nf_8_ml,nf_8(1:nf_8_ml,1)*t,nf_8_2);

figure(2)

hold on

title('4 ply with Filler')
xlabel('Strain')
ylabel('Stress (Pa)')

plot(f_4(:,1)*t,f_4(:,3)/f_4_a,'.')

plot(f_4(:,1)*t,f_4_2)
plot(f_4(1:f_4_ml,1)*t,f_4_reg)
plot(f_4(1:f_4_ml,1)*t,f_f_f_4)
plot(f_4(1:f_4_ml,1)*t,f_f_d_4)


legend('Raw data','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(3)

hold on

title('8 ply with filler')
xlabel('Strain')
ylabel('Stress (Pa)')

plot(f_8(:,1)*t,f_8(:,3)/f_8_a,'.')

plot(f_8(:,1)*t,f_8_2)
plot(f_8(1:f_8_ml,1)*t,f_8_reg)
plot(f_8(1:f_8_ml,1)*t,f_f_f_8)
plot(f_8(1:f_8_ml,1)*t,f_f_d_8)

legend('Raw data','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(4)

hold on

title('4 ply with no filler')
xlabel('Strain')
ylabel('Stress (Pa)')

plot(nf_4(:,1)*t,nf_4(:,3)/nf_4_a,'.')

plot(nf_4(:,1)*t,nf_4_2)
plot(nf_4(1:nf_4_ml,1)*t,nf_4_reg)
plot(nf_4(1:nf_4_ml,1)*t,nf_f_f_4)
plot(nf_4(1:nf_4_ml,1)*t,nf_f_d_4)

legend('Raw data','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

figure(5)

hold on

title('8 ply with no filler')
xlabel('Strain')
ylabel('Stress (Pa)')

plot(nf_8(:,1)*t,nf_8(:,3)/nf_8_a,'.')

plot(nf_8(:,1)*t,nf_8_2)
plot(nf_8(1:nf_8_ml,1)*t,nf_8_reg)
plot(nf_8(1:nf_8_ml,1)*t,nf_f_f_8)
plot(nf_8(1:nf_8_ml,1)*t,nf_f_d_8)

legend('Raw Data','Averaged','Linear regression','95% probability linear regression error','95% probability data error','location','best')

hold off

fprintf('%f 4 ply with filler Elastic Modulus (MPa)\n',f_4_m(2)/10^6)
fprintf('%f 8 ply with filler Elastic Modulus (MPa)\n',f_8_m(2)/10^6)
fprintf('%f 4 ply without filler Elastic Modulus (MPa)\n',nf_4_m(2)/10^6)
fprintf('%f 8 ply without filler Elastic Modulus (MPa)\n',nf_8_m(2)/10^6)
