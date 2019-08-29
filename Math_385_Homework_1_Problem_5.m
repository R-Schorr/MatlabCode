clc, clear

i=1;
y=linspace(2,150,100);
f=@(x)sin(sqrt(x))+sqrt(x)*cos(sqrt(x));

while i<length(y)
    
    x(i)=fzero(f,y(i));
    i=i+1;
    
end

z=sin(sqrt(y))+sqrt(y).*cos(sqrt(y));

plot(y,z)
title("Lambda Function")
xlabel("Possible lambda values")
ylabel("f(lambda)")