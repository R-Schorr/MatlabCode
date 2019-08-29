clear,clear      
e = 0.820731;        
a = .705822;          
N = 1000;         
nTerms = 10;    
M = linspace(0,2*pi,N);   
alpha = zeros(1,N);
for j = 1:N
    alpha(j)=M(j);
    for n = 1:nTerms
        alpha(j)=alpha(j)+2/n*besselj(n,n*e).*sin(n*M(j));
    end
end
theta =2*atan(sqrt((1+e)/(1-e))*tan(alpha/2));
r = a * (1-e^2) ./ (1 + e*cos(theta));
polar(theta,r)
j=1;
while j<=length(r)
x(1,j)=r(1,j)*cos(theta(1,j));
y(1,j)=r(1,j)*sin(theta(1,j));
j=j+1;
end 
z=(zeros(1,1000));
%plot3(x,y,z)