clc,clear

v= [19208 19259];

x=[38.1 38.5];

xq=70;

vq = interp1(x,v,xq,'linear','extrap');
