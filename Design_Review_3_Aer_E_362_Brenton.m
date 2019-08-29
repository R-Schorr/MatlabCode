clc,clear
Wing_Area=8*2*.092903; %m^2
CL=.9;
Desired_Velocity=60; %m/s

rho=1.225;
Drag=600; %lbs
Skin_Weight_lbs=179.47;
Frame_Weight_lbs=308.62;
Interior_Weight_lbs=450;
Wings_Weight_lbs=100;
Passenger_Weight=920; %lbs
Prop_radius=26.1*.0254; %meters
mg_rad=(14.2/2)*.0254;
fprintf("Prop radius is %f inches.\n",Prop_radius/.0254);

energy_density=258; %W*hrs/kg
battery_voltage=3.6; %Volts
TO_Time=2/60; %Fraction of time in VTOL kW consumpsion
Cruise_Time=18/60; %Fraction of time in Cruise kW consumption
KG_LBS=2.20462;  %kg to lbs
OP_Correction_Factor= 0.00074;
ozin_Nm=141.61193227806; %Oz inches to Nm 
ozin_Amp=1/1.039;        %Oz inches to Ampere
possible_torque_slope=.624; %Oz inches from rpm
VTOL_Power=120; %kWatts
Cruise_Power=12.9; %kWatts
MAGiDRIVE=4;
MAGiDRIVE_Weight=29.7; %lbs
Nm=200;
rpm=4200;
MWsL=29.7;
KWC=155;
efficiency=94.5/100;
RPM_Correction=4200;
energy_density_V=877.5;
Current=(Nm/ozin_Nm)*ozin_Amp;
op=(Nm/ozin_Nm)*RPM_Correction*OP_Correction_Factor+600;
motor_voltage=op/(Current*efficiency);
Number_Batteries_Series_MAGiDRIVE=ceil(motor_voltage/battery_voltage);
Battery_Weight=((1000*VTOL_Power*(TO_Time/energy_density)*KG_LBS)*2+(1000*Cruise_Power*(Cruise_Time/energy_density)*KG_LBS))*1.06*MAGiDRIVE;
Volume_Batteries_From_Parallel_MIGiDRIVE_sL=(Cruise_Power*1000*KG_LBS/(energy_density_V/Cruise_Time)+VTOL_Power*1000*KG_LBS/(energy_density_V/TO_Time))*MAGiDRIVE;
Battery_Cost=((1000*VTOL_Power*(TO_Time/KWC)*KG_LBS)*2+(1000*Cruise_Power*(Cruise_Time/KWC)*KG_LBS))*1.06*MAGiDRIVE;
Total_Weight_lbs=Battery_Weight+MAGiDRIVE_Weight*KG_LBS*4+Passenger_Weight+Skin_Weight_lbs+Frame_Weight_lbs+Interior_Weight_lbs+Wings_Weight_lbs;
fprintf("Weight estimation is %f lbs.\n",Total_Weight_lbs);

%Test for Take Off
Motor_Thrust=Total_Weight_lbs/4; %lbs
TO_Power=sqrt((Motor_Thrust*4.4482216)^3/(2*rho*(pi*(Prop_radius-mg_rad)^2)))/1000;
fprintf("Power required for takeoff is %f kW.\n",TO_Power);

%Cruise
Thrust_Cruise=(2*rho*pi*(Prop_radius-mg_rad)^2*(Cruise_Power*1000)^2)^(1/3); %Newtons
fprintf("Cruise thrust per engine is %f lbs.\n",Thrust_Cruise*.22480894244);
fprintf("Drag is %d lbs.\n",Drag);
fprintf("Total thrust is %f lbs.\n",4*Thrust_Cruise*.22480894244);
Induced_Cruise_Velocity=sqrt(Thrust_Cruise/(2*rho*pi*(Prop_radius-mg_rad)^2));
fprintf("Induced velocity is %f m/s.\n",Induced_Cruise_Velocity);
Required_Thrust=Cruise_Power*1000/(Desired_Velocity+Induced_Cruise_Velocity);
fprintf("Required thrust for desired velocity is %f lbs.\n",Required_Thrust*.22480894244);

%Lift
Lift=.5*rho*Desired_Velocity^2*CL*Wing_Area*4; %Newtons
fprintf("Total lift is %f lbs.\n",Lift*.22480894244);
TR=(Thrust_Cruise*.22480894244)/(Lift*.22480894244);