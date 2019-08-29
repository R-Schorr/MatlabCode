clc,clear
gamma=1.4;
M=linspace(.01,4);
A=(1./M(1,:)).*((2/(gamma+1)).*(1+(gamma-1)./2*M(1,:).^2)).^((gamma+1)./(2*(gamma-1)));
hold on
plot(M,A)
ittera_max=1000;
g=.01;
boolean=1;
conv=1e-6;
i=0;
F=input('Enter A');
while boolean==1 && i<=ittera_max
    boolean=0;
    i=i+1;
    fval=(1./g).*((2/(gamma+1)).*(1+(gamma-1)./2*g.^2)).^((gamma+1)./(2*(gamma-1)))-F;
    syms x
    f=(1./x.*((2/(gamma+1)).*(1+(gamma-1)./2*x.^2)).^3);
    df=vpa(subs(diff(f),x,g));
    df=double(df);
    x_new=g-fval/df;
    error=abs(x_new-g);
    if (error>=conv)
        boolean=1;
    end
    g=x_new;
end
plot(g,fval+F,'*')
xlabel('Mach Number')
ylabel('A Value')
title('Mach number versus A')
hold off