clc,clear

E=10200;      
%Elastic Modulus

b=1;
h=.25;

I=(1/12)*b*h^3;      
%I=Secod Moment of Area

L=[16;8;8;16;sqrt(8^2+16.25^2);sqrt(8^2+16.25^2);16.25];              
%Length

DOF=12;             
%Degrees of freedom

member_id=7;       
%Member number

%Begin itteration variables
i=1;
j=1;
k=1;
l=1;
m=1;
%End itteration variables

A=b*h;
%Area

snn=[4,5,6,7,8,9,13,14,15,16,17,18];     
%Unknown Matrix

theta=[0;0;0;0;atan(16.25/8);-atan(16.25/8);-pi()/2];
%Theta matrix

p=[0;0;-600/1000;0;15/1000;0;0;-20/1000;0;0;0;0];   
%Force Matrix

s=zeros(DOF);
%Preallocating s matrix

while i<=DOF
    while j<=DOF
        while k<=member_id
            kmatrix=(E*I/(L(k,1)^3))*[A*L(k,1)^2/I,0,0,-A*L(k,1)^2/I,0,0;0,12,6*L(k,1),0,-12,6*L(k,1);0,6*L(k,1),4*(L(k,1))^2,0,-6*L(k,1),2*(L(k,1))^2;-A*L(k,1)^2/I,0,0,A*L(k,1)^2/I,0,0;0,-12,-6*L(k,1),0,12,-6*L(k,1);0,6*L(k,1),2*(L(k,1))^2,0,-6*L(k,1),4*(L(k,1))^2];
            %Above is the k matrix
            T=[cos(theta(k,1)),sin(theta(k,1)),0,0,0,0;-sin(theta(k,1)),cos(theta(k,1)),0,0,0,0;0,0,1,0,0,0;0,0,0,cos(theta(k,1)),sin(theta(k,1)),0;0,0,0,-sin(theta(k,1)),cos(theta(k,1)),0;0,0,0,0,0,1];
            knn=T'*kmatrix*T;
            id=k;
            if k==5
                kn=[13,14,15,4,5,6];
                while l<=6                
                    while m<=6
                        if snn(1,i)==kn(1,l)
                            if snn(1,j)==kn(1,m)
                                s(j,i)=s(j,i)+knn(l,m);
                            end
                        end
                        m=m+1;
                    end
                    l=l+1;
                    m=1;
                end
                l=1;
            end
            if k==6
                kn=[4,5,6,16,17,18];
                while l<=6                
                    while m<=6
                        if snn(1,i)==kn(1,l)
                            if snn(1,j)==kn(1,m)
                                s(j,i)=s(j,i)+knn(l,m);
                            end
                        end
                        m=m+1;
                    end
                    l=l+1;
                    m=1;
                end
                l=1;
            end
            if k==7
                kn=[7,8,9,16,17,18];
                while l<=6                
                    while m<=6
                        if snn(1,i)==kn(1,l)
                            if snn(1,j)==kn(1,m)
                                s(j,i)=s(j,i)+knn(l,m);
                            end
                        end
                        m=m+1;
                    end
                    l=l+1;
                    m=1;
                end
                l=1;
            end
            if k==1||k==2
                kn=[1,2,3,4,5,6]+(k-1)*3;
                while l<=6                
                    while m<=6
                        if snn(1,i)==kn(1,l)
                            if snn(1,j)==kn(1,m)
                                s(j,i)=s(j,i)+knn(l,m);
                            end
                        end
                        m=m+1;
                    end
                    l=l+1;
                    m=1;
                end
            l=1;            
            end
            if k==3||k==4
                kn=[10,11,12,13,14,15]+(k-3)*3;
                while l<=6                
                    while m<=6
                        if snn(1,i)==kn(1,l)
                            if snn(1,j)==kn(1,m)
                                s(j,i)=s(j,i)+knn(l,m);
                            end
                        end
                        m=m+1;
                    end
                    l=l+1;
                    m=1;
                end
            l=1;            
            end
           k=k+1;
        end
        j=j+1;
        k=1;
     end
     i=i+1;
     j=1;
end
s=s.*(abs(s)>1*10^-13);
%S matrix corrected removing rounding errors

%Calculated displacement
d=s\p;
disp('d =')
disp(d(:,1))

%V begin matricies
v(1,:)=[0;0;0;d(1,1);d(2,1);d(3,1)];
v(2,:)=[d(1,1);d(2,1);d(3,1);d(4,1);d(5,1);d(6,1)];
v(3,:)=[0;0;0;d(7,1);d(8,1);d(9,1)];
v(4,:)=[d(7,1);d(8,1);d(9,1);d(10,1);d(11,1);d(12,1)];
v(5,:)=[d(7,1);d(8,1);d(9,1);d(1,1);d(2,1);d(3,1)];
v(6,:)=[d(1,1);d(2,1);d(3,1);d(10,1);d(11,1);d(12,1)];
v(7,:)=[d(4,1);d(5,1);d(6,1);d(10,1);d(11,1);d(12,1)];
%End v matricies

while k<=member_id
    kmatrix=(E*I/(L(k,1)^3))*[A*L(k,1)^2/I,0,0,-A*L(k,1)^2/I,0,0;0,12,6*L(k,1),0,-12,6*L(k,1);0,6*L(k,1),4*(L(k,1))^2,0,-6*L(k,1),2*(L(k,1))^2;-A*L(k,1)^2/I,0,0,A*L(k,1)^2/I,0,0;0,-12,-6*L(k,1),0,12,-6*L(k,1);0,6*L(k,1),2*(L(k,1))^2,0,-6*L(k,1),4*(L(k,1))^2];
    %Above is the k matrix
    T=[cos(theta(k,1)),sin(theta(k,1)),0,0,0,0;-sin(theta(k,1)),cos(theta(k,1)),0,0,0,0;0,0,1,0,0,0;0,0,0,cos(theta(k,1)),sin(theta(k,1)),0;0,0,0,-sin(theta(k,1)),cos(theta(k,1)),0;0,0,0,0,0,1];
    knn=T.'*kmatrix*T;
    id=k;
    
    %Begining of the U matricies
    u(k,:)=T*v(k,:)';
    %End of U matricies
    
    %Begining of Q matricies
    Q(k,:)=knn*u(k,:)';
    %End of Q matricies
    
    %Begin force matrix
    F(k,:)=T'*Q(k,:)';
    %End force matrix
    
    k=k+1;
end


R=[F(1,1);F(1,2);F(1,3);F(3,1);F(3,2);F(3,3)];
%Force matrix


%Begin Stress calculations
Sa1=-Q(1,1)/A;
Sa2=-Q(2,1)/A;
Sa3=-Q(3,1)/A;
Sa4=-Q(4,1)/A;
Sa5=-Q(5,1)/A;
Sa6=-Q(6,1)/A;
Sa7=-Q(7,1)/A;
%End Stress calculations

%Begin Strain Calculations
ST1=Sa1/E;
ST2=Sa2/E;
ST3=Sa3/E;
ST4=Sa4/E;
ST5=Sa5/E;
ST6=Sa6/E;
ST7=Sa7/E;
%End Strain Calculations

k=1;
 while k<=member_id
            %begin Bending Stress Calculations
            Sb(k,:)=((Q(k,2)*L(k,1))-Q(k,3))*(h/2)/(I);
            %end Bending Stress Calculations
            k=k+1;
 end

%Begin Strain Calculations
STb1=Sb(1,:)/E;
STb2=Sb(2,:)/E;
STb3=Sb(3,:)/E;
STb4=Sb(4,:)/E;
STb5=Sb(5,:)/E;
STb6=Sb(6,:)/E;
STb7=Sb(7,:)/E;
%End Strain Calculations

%Begin plots of strain in members 5 and 6
%Plot of 5
x5=linspace(0,L(5,1),100);
Sb5(1,:)=((((Q(5,2)*x5)-Q(5,3))*(h/2)/(I))+Sa5)/E;
figure
hold on
xlabel('displacement(in)')
ylabel('strain')
title('Strain in Member 5')
plot(x5,Sb5)
plot(x5,fliplr(Sb5))
legend('Top','Bottom','Location','best');
hold off
figure 
%Plot of 6
x6=linspace(0,L(6,1),100);
Sb6(1,:)=((((Q(6,2)*x6)-Q(6,3))*(h/2)/(I))+Sa6)/E;
hold on
xlabel('displacement(in)')
ylabel('strain')
title('Strain in Member 6')
plot(x6,Sb6)
plot(x6,fliplr(Sb6))
legend('Top','Bottom','Location','best');
hold off
%End plots of strain in members 5 and 6


%Extra calculations to check force and moment numbers
Rsum=R(1,1)+R(4,1);
Rsum2=R(2,1)+R(5,1)-20/1000+15/1000;