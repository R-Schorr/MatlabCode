clc,clear

%% For The Purpose of Calculating the Structure Weight Budget

TW=3500;
Passenger_Weight=920;

%% Battery Constants and Constraints

energy_density=258;
energy_density_V=877.5;

battery_voltage=3.6;
hours=20/60;
TV=1/5; %Fraction of time in VTOL kW consumpsion
CV=4/5; %Fraction of time in Cruise kW consumption
PC=1/6;   %Fraction of Power Used in Cruise
KG_LBS=2.20462;  %kg to lbs
ozin_Nm=141.61193227806; %Oz inches to Nm 
ozin_Amp=1/1.039;        %Oz inches to Ampere
possible_torque_slope=.624; %Oz inches from rpm
OP_Correction_Factor= 0.00074;


%% Jobi Motor

motor_voltage=400;
Motor_kw=60;
jobi_number=16;
MWJ=60;

Number_Batteries_Series_Joby=ceil(motor_voltage/battery_voltage);
Weight_Batteries_From_Parallel_Joby=(Motor_kw*1000*KG_LBS/(energy_density/hours)+Motor_kw*1000*KG_LBS/(energy_density/hours)*PC+MWJ)*jobi_number;
Weight_Budget_For_Structure_Joby=TW-Passenger_Weight-(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWJ)*jobi_number;
fprintf('Weight Budget for %.0f Joby: %f\n',jobi_number,Weight_Budget_For_Structure_Joby)

%% Siemens Motor

motor_voltage=580;
Motor_kw=260;
seimens_number=4;
MWS=120;

Number_Batteries_Series_Siemens=ceil(motor_voltage/battery_voltage);
Weight_Batteries_From_Parallel_Seimens=(Motor_kw*1000*KG_LBS/(energy_density/hours)*1/4+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*3/4+MWS)*seimens_number;
Weight_Budget_For_Structure_Seimens=TW-Passenger_Weight-(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*3/4+MWS)*seimens_number;
fprintf('Weight Budget for %.0f Seimens: %f\n',seimens_number,Weight_Budget_For_Structure_Seimens)


%% MAGiDRIVE Motor

motor_voltage=600;
Motor_kw=240;
MAGiDRIVE=4;
MWML=49.5;

Number_Batteries_Series_MAGiDRIVE_LG=ceil(motor_voltage/battery_voltage);
Weight_Batteries_From_Parallel_MIGiDRIVE=(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWML*KG_LBS)*MAGiDRIVE;
Weight_Budget_For_Structure_MAGiDRIVE=TW-Passenger_Weight-(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWML*KG_LBS)*MAGiDRIVE;
fprintf('Weight Budget for MagiDrive from %.0f %.0f kW: %f\n',MAGiDRIVE,Motor_kw,Weight_Budget_For_Structure_MAGiDRIVE)


%% MAGiDrive Motor Small

Motor_kw=10;
MAGiDRIVE=32;
motor_voltage=24;
MWMS=6.16;

Number_Batteries_Series_MAGiDRIVE_SM=ceil(motor_voltage/battery_voltage);
Weight_Batteries_From_Parallel_MIGiDRIVE_SM=(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWMS)*MAGiDRIVE;
Weight_Budget_For_Structure_MAGiDRIVE_SM=TW-Passenger_Weight-(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWMS*KG_LBS)*MAGiDRIVE;
fprintf('Weight Budget for MagiDrive from %.0f %.0f kW: %f\n',MAGiDRIVE,Motor_kw,Weight_Budget_For_Structure_MAGiDRIVE_SM)

%% MAGiDrive Motor Medium

Motor_kw=60;
MAGiDRIVE=16;
motor_voltage=100;
MWMM=22;

Number_Batteries_Series_MAGiDRIVE_M=ceil(motor_voltage/battery_voltage);
Weight_Batteries_From_Parallel_MIGiDRIVE_M=(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWMM)*MAGiDRIVE;
Weight_Budget_For_Structure_MAGiDRIVE_M=TW-Passenger_Weight-(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWMM*KG_LBS)*MAGiDRIVE;
fprintf('Weight Budget for MagiDrive from %.0f %.0f kW: %f\n',MAGiDRIVE,Motor_kw,Weight_Budget_For_Structure_MAGiDRIVE_M)

%% MAGiDrive Motor Small Medium

Motor_kw=16;
MAGiDRIVE_20=32;
motor_voltage=50;
MWsM=4.8;

Number_Batteries_Series_MAGiDRIVE_sM=ceil(motor_voltage/battery_voltage);
Weight_Batteries_From_Parallel_MIGiDRIVE_sM=(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWsM)*MAGiDRIVE_20;
Weight_Budget_For_Structure_MAGiDRIVE_sM=TW-Passenger_Weight-(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWsM*KG_LBS)*MAGiDRIVE_20;
fprintf('Weight Budget for MagiDrive From %.0f %.0f kW: %f\n',MAGiDRIVE_20,Motor_kw,Weight_Budget_For_Structure_MAGiDRIVE_sM)

%% MAGiDrive Motor Large Medium

Motor_kw=120;
MAGiDRIVE_20=4;
Nm=200;
rpm=4200;
MWsL=29.7;
efficiency=94.5/100;

RPM_Correction=4200;
Current=(Nm/ozin_Nm)*ozin_Amp;
op=(Nm/ozin_Nm)*RPM_Correction*OP_Correction_Factor+600;
motor_voltage=op/(Current*efficiency);
Number_Batteries_Series_MAGiDRIVE_sL=ceil(motor_voltage/battery_voltage);
Weight_Batteries_From_Parallel_MIGiDRIVE_sL=(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWsL*KG_LBS)*MAGiDRIVE_20;
Volume_Batteries_From_Parallel_MIGiDRIVE_sL=(Motor_kw*1000*KG_LBS/(energy_density_V/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density_V/hours)*CV+MWsL*KG_LBS)*MAGiDRIVE_20;
Weight_Budget_For_Structure_MAGiDRIVE_sL=TW-Passenger_Weight-(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWsL*KG_LBS)*MAGiDRIVE_20;
fprintf('Weight Budget for MagiDrive From %.0f %.0f kW: %f and Volume of %f and the Batteries in Series are %f\n',MAGiDRIVE_20,Motor_kw,Weight_Budget_For_Structure_MAGiDRIVE_sL,Volume_Batteries_From_Parallel_MIGiDRIVE_sL/0.264172,Number_Batteries_Series_MAGiDRIVE_sL)

%% MAGiDrive Large Motor

motor_voltage=800;
Motor_kw=240;
seimens_number=4;
MWL=49.5;

Number_Batteries_Series_MAGiDrive_L=ceil(motor_voltage/battery_voltage);
Weight_Batteries_From_Parallel_MAGiDrive_L=(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWL)*seimens_number;
Weight_Budget_For_Structure_MAGiDRIVE_L=TW-Passenger_Weight-(Motor_kw*1000*KG_LBS/(energy_density/hours)*TV+Motor_kw*PC*1000*KG_LBS/(energy_density/hours)*CV+MWL*KG_LBS)*seimens_number;
fprintf('Weight Budget for MagiDrive From %.0f %.0f kW: %f\n',seimens_number,Motor_kw,Weight_Budget_For_Structure_MAGiDRIVE_L)

