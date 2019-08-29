clc, clear

%% Initial Data

tabledata=load('handbk_AI1_AI2.mat7','-mat');
%disp(tabledata.A)
%disp(tabledata.B)

i=1;
x=0;
a=1/1000;
c=1/1000;
r=.1;
pt=5/1000;
w=10/100;
M=3;
C=10^(-30);
y=pt/2;

M_max=500;
M_min=50;

I=1/12*w*(pt-a)^3;

sigma_max=M_max*y/I;
sigma_min=M_min*y/I;

sigma=sigma_max-sigma_min;
%% Starting Iteration for Part 1
while i==1
    
    x=1+x;
    
    n(1,x)=x;
    
    delta_K=sigma*2/pi*sqrt(pi*a(1,x));

    da=C*delta_K^(M);
         
    if a(1,x)>=2.5/1000
        
        i=0;
        
    else
        
        a(1,x+1)=a(1,x)+da;
        
    end
        
end

%% Part 2 Iteration

i=1;
x=0;
a2=a(1,1);

while i==1

    sigmai=0;
    
    x=1+x;
    
    [~,y]=min(abs(a2(1,x)/pt)-[2,5/2,10/3,5,10]);
    [~,b]=min(abs(2*c(1,x)/a2(1,x))-[2,5/2,10/3,5,10]);
    
    n2(1,x)=x;
      
    sigma_max=M_max*(pt/(2*a2(1,x)))*a2(1,x)/I-M_min*(pt/(2*a2(1,x)))*a2(1,x)/I;
    sigma_min=M_max*a2(1,x)/I-M_min*a2(1,x)/I;

    sigmai=sigma_max*tabledata.A(y,1,b)-sigma_min*((pt/2-a2(1,x))/a2(1,x))^1*tabledata.A(y,2,b);

    delta_K=sigmai*2/pi*sqrt(pi*a2(1,x));

    DK(1,x)=delta_K;
    
    da=C*delta_K^(M);
    
    DA(1,x)=da;
         
    if a2(1,x)>=5/1000
        
        i=0;
        
    elseif x>=50000

        i=0;
        
    else
        
        a2(1,x+1)=a2(1,x)+da;
        
    end
        
    sigmai=sigma_max*tabledata.B(y,1,b)-sigma_min*((pt/2-a2(1,x))/a2(1,x))^1*tabledata.B(y,2,b);              
    
    delta_K=(sigmai)*2/pi*sqrt(pi*c(1,x));

    da=C*delta_K^(M);
            
    c(1,x+1)=c(1,x)+da;
        
end

%% Part 3 Iteration

%setting itterational variables
i=1;
x=0;
a3=a(1,1);
c2=c(1,1);

while i==1

    x=1+x;
    
    n3(1,x)=x;
    
    %y is the parameter of which table we are calling and b is the specific
    %row in the table
    
    [~,y]=min(abs(a3(1,x)/pt)-[2,5/2,10/3,5,10]);
    [~,b]=min(abs(c2(1,x)/a3(1,x))-[2,5/2,10/3,5,10]);
    
    %I is changing iteratively from begining to crack growth
    I=1/12*w*(pt-a3(1,x))^3;

    %Calculating the max and min sigmas to find the difference between
    
    sigma_max=M_max*(pt/(2*a2(1,x)))*a2(1,x)/I-M_min*(pt/(2*a2(1,x)))*a2(1,x)/I;
    sigma_min=M_max*a2(1,x)/I-M_min*a2(1,x)/I;

    sigmai=sigma_max*tabledata.A(y,1,b)-sigma_min*((pt/2-a2(1,x))/a2(1,x))^1*tabledata.A(y,2,b);
  
    delta_K=sigmai*2/pi*sqrt(pi*a3(1,x));

    da=C*delta_K^(M);
    
    if a3(1,x)>=4/1000
        
        i=0;
        
    elseif x>=50000

        i=0;
        
    else
        
        a3(1,x+1)=a3(1,x)+da;
        
    end
    
    sigmai=sigma_max*tabledata.B(y,1,b)-sigma_min*((pt/2-a2(1,x))/a2(1,x))^1*tabledata.B(y,2,b);  
    
    delta_K=(sigmai)*2/pi*sqrt(pi*c2(1,x));

    da=C*delta_K^(M);
    
    if a>=5/1000
        
        i=0;
    else
         
        c2(1,x+1)=c2(1,x)+da;
        
    end
    
end

%% Plots

figure(1)

hold on

semilogx(n,a*1000,'r')
semilogx(n2,a2*1000,'b')
semilogx(n3,a3*1000,'g')
xlabel('Number of iterations')
ylabel('Crack size in millimeters')
title('Crack size versus cycles')

hold off

figure(2)

hold on 

plot(n,a)
plot(n2,c(1:length(c)-1))
plot(n3,c2(1:length(c2)-1))

hold off
