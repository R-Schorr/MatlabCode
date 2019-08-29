clc,clear
save wind_diameter_Kilowatthour.dat 'akwh' '-ascii'
clear
akwh=load ('wind_diameter_Kilowatthour.dat');
plot3(akwh(:,1),akwh(:,2),akwh(:,3),'*')
grid
axis tight
xlabel('blade diameter(ft)')
ylabel('Wind speed (mph)')
zlabel('kilowatts hours generated(kwh)')