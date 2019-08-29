clc,clear

Nr=100;
Nt=100;
n=0;

r=linspace(0,1,Nr);
theta=linspace(0,2*pi,Nt);
z=[2.40482558 5.520078112 8.653727913 6.380161896 9.76102368 13.0150072];

X=zeros(Nr,Nt);
Y=zeros(Nr,Nt);
Phi=zeros(Nr,Nt);

for k=1:length(z)

    for i=1:Nr
    
        for j=1:Nt
        
            X(i,j)=r(i)*cos(theta(j));
            Y(i,j)=r(i)*sin(theta(j));
            
            if k<=3
                
                m=0;
                
            else
                
                m=3;
                
            end
            
            Phi(i,j)=besselj(m,z(k)*r(i))*cos(theta(j)*m);
        
        end
        
        j=1;
    
    end
    

    n=n+1;
    
    if n>=4
        
        n=1;
        
    end
    
    i=1;
    figure
    contourf(X,Y,Phi)
    axis equal
    axis([-1 1 -1 1])
    set(gca,'fontsize',20)
    xlabel('x'); 
    ylabel('y'); 
    zlabel('u(t,x,y)');
    title([['Solution for m = ',num2str(m)],[', n = ', num2str(n)]]);
    colorbar
    
    %figure
    %mesh(X,Y,Phi)
        
end
