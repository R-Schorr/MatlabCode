function [Al,Zn,Mg,Cu,Cd,Te,density]=scatterdata(varargin)
%% Stattering Data 

% Column one is Photon Energy.
% Column two is Coherent Scatter.
% Column three is Incoher. Scatter.
% Column four is Photoel. Absorb.
% Column five is Nuclear Pair Prd.
% Column six is Electron Pair Prd.
% Column seven is Tot. w/  Coherent.
% Column eight is Tot. wo/  Coherent.

Al=importdata('Aluminium_Scattering_Data.txt','\t');
Zn=importdata('Zinc_Scattering_Data.txt','\t');
Mg=importdata('Magnesium_Scattering_Data.txt','\t');
Cu=importdata('Copper_Scattering_Data.txt','\t');
Cd=importdata('Cadmium_Scattering_Data.txt','\t');
Te=importdata('Tellurium_Scattering_Data.txt','\t');

Al(:,2:8)=Al(:,2:8);
Zn(:,2:8)=Zn(:,2:8);
Mg(:,2:8)=Mg(:,2:8);
Cu(:,2:8)=Cu(:,2:8);
Cd(:,2:8)=Cd(:,2:8);
Te(:,2:8)=Te(:,2:8);

density=[0,2.7,7.13,1.63,8.96,8.7,6.24];    
    
end