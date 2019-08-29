clc,clear

bow=(2071+125.4);
mast=1.716;
x=[577 598 706]; 
y=[.137 .179 .391];    
extrap=interp1(y,x,0,'linear','extrap');
base=(extrap+bow)*mast
x=[1.438 1.491 1.759]; 
y=[.137 .179 .391];    
extrap2=interp1(y,x,0,'linear','extrap'); 
perc=(extrap2+mast)*bow

damage=(base+perc)*1.1