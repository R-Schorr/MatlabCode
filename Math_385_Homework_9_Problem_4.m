clc,clear

error=[10^-4,10^-5,10^-6,10^-7];
i=1;
n=1;
k=1;
m=[n,n,n,n];
e0=(24*((2*sin(k*pi/2)-sin(k*pi))/((k)^2*pi^2))^2*2*(1/2-sin(2*k*pi)/(4*k*pi)));
e=[e0,e0,e0,e0];
g=0;
x=linspace(0,1,101);

while i<=length(error)

    while e(i)>=error(i)
        
        while k<=m(i)
            
            g(1,k)=((2*sin(k*pi/2)-sin(k*pi))/((k)^2*pi^2))^2*2*(1/2-sin(2*k*pi)/(4*k*pi));
            k=k+1;
                        
        end
        
        m(i)=m(i)+1;
        k=1;
        y=sum(g);
        e(i)=1-24*y;
    end
    
    i=i+1;
    
end

f_x=zeros(1,length(x));
i=1;
j=1;
phi=zeros(length(x),max(m));
n=1;

while i<=length(x)
    
    while j<=length(m)
        
        while n<=m(j)
    
            phi(i,n)=((2*sin(n*pi/2)-sin(n*pi))/((n)^2*pi^2))*sin(x(i)*n*pi)*2;
            n=n+1;
            
        end
        
        f(i,j)=sum(phi(i,:));
        j=j+1;        
        n=1;
    end
    
     if x(i)<=1/2
    
        f_x(i)=x(i);
        
    elseif x(i)>1/2
        
        f_x(i)=1-x(i);
    end
    
   i=i+1;
   j=1;
   
end

f_val=zeros(length(f_x),1);

for k=1:length(m)
    
    for n=1:length(f_x)
    
        f_val(n,k)=f_x(1,n)-f(n,k);
    
    end
    
end

hold on
plot(x,abs(f_val(:,1)),'*')
plot(x,abs(f_val(:,2)))
plot(x,abs(f_val(:,3)),'>')
plot(x,abs(f_val(:,4)),'.')
xlabel('X')
ylabel('Functions subtracted')
legend('exponent -4','exponent -5','exponent -6','exponent -7','Location','best')
title('Function minus sine approximation versus x graph')
hold off
