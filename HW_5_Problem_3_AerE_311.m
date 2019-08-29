clc,clear

%% Defining the Constants of the Problem 
M=2.13;
t_c=.1;
AOA=[0,4,8];
x=linspace(0,1,10);
CP_POS=zeros(length(AOA),length(x));
CP_NEG=zeros(length(AOA),length(x));
i=1;
j=1;
%% Section Calculating CP positive and negitive values from angle of attacks, Mach numbers and chord thickness ratio 
for k=length(AOA)
    while (i<=length(AOA))
        while j<=length(x)
            %usage of Equation 1
            CP_POS(i,j)=2/(sqrt(M^2-1))*((((4*t_c)*(1-2*x(1,j))))-AOA(1,i));
            %Usage of Equaition 2
            CP_NEG(i,j)=2/(sqrt(M^2-1))*(((4*t_c)*(1-2*x(1,j)))+AOA(1,i));
            j=j+1;
        end
        j=1;
        i=i+1;
    end
    i=1;
end

%% Plotting the different AOA's and CP's for them against the distance along X (normalized across chord)

while i<=length(AOA)
    figure
    hold on
    set(gca,'Ydir','reverse')
    plot(x,CP_POS(i,:),'O')
    plot(x,CP_NEG(i,:),'*')
    hold off
    i=i+1;
end
