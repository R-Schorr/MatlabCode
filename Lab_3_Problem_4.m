% AerE 161, Spring 2016, Lab 3
%Robert Schorr, Nathan Lengel, Brandon Young
%2/5/16 9:03pm
%Lab 3, Problem 4
%_________________
clc,clear
Tc=input('Enter the temperature in Kalvin of the Cold Reservior'); %Input the Temperature in Kalvin and defined to variable Tc
while Tc<=0 %starting while loop to make sure Temperature not below zero
Tc=input('Enter a temperature greater than zero in Kalvin'); %redefining as necessary the Temperature if it is not below zero will not change variable
end
Th=input('Input the heat in Kalvin of the Hot Reservior');%Input the Temperature in Kalvin and defined to variable Th
while Th<=0%starting while loop to make sure Temperature not below zero
Th=input('Enter a temperature greater than zero in Kalvin');%redefining as necessary the Temperature if it is not below zero will not change variable
end
n=1-(Tc/Th); %calculating the Carnot Efficiency  
fprintf('The Carnot efficiency is %.3f',n) %print the Carnot efficiency of the given engine in three decimals