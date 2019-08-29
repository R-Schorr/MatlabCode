clc,clear

n=[1,2,3,4];
x=linspace(0,1,100);
k=1;
i=1;
j=1;
phi=zeros(length(n),length(x));
phi2=zeros(length(n),length(x));


while i<=length(n)
    
    while j<=length(x)
        
        while k<=j
            
            lam=(j*pi)^2/2;
            phi(i,j)=sum(cos(x(j)*sqrt(lam/2)));
            k=k+1;
            
        end
        
        phi2(i,j)=sum((1+x(j)).^(-3/4).*sin(n(1:i).*pi/(2*sqrt(2)-2).*(2/sqrt(1/(x(j)+1))-2)));
        k=1;
        j=j+1;
        
    end
    
    j=1;
    i=i+1;
    
end
hold on
plot(x,phi)
legend('n=1','n=2','n=3','n=4','Location','best')
xlabel('X axis')
ylabel('Eigenfunction Value')
title('Constant Amplitude Approximation')
hold off
hold on
figure
plot(x,phi2)
legend('n=1','n=2','n=3','n=4','Location','best')
xlabel('X axis')
ylabel('Eigenfunction Value')
title('Variable Amplitude Approximation')
hold off