clc,clear
E=70*10^9;        
%Elastic Modulus

I=1.45833e-7;      
%I=Secod Moment of Area

L=1.75;              
%length

DOF=4;             
%degrees of freedom

member_id=2;       
%member number

%begin itteration variables
i=1;
j=1;
k=1;
l=1;
m=1;
%end itteration variables

knn=E*I/(L)^3*[12,6*L,-12,6*L;6*L,4*(L)^2,-6*L,2*(L)^2;-12,-6*L,12,-6*L;6*L,2*(L)^2,-6*L,4*(L)^2]
%Above is the K matrix for all (and is constant for this problem)

snn=[3,4,4,6];     
%Unknown Matrix

kn=[1,2,3,4];               
%initial nodes

p=[1000;0;2000;0]   
%force Matrix

s=zeros(DOF);
%preallocating s matrix

while i<=DOF
    while j<=DOF
        while k<=member_id            
            while l<=4                
                while m<=4
                    if snn(1,i)==kn(1,l)
                        if snn(1,j)==kn(1,m)
                            s(i,j)=s(i,j)+knn(m,l);
                        end
                    end
                    m=m+1;
                end
                l=l+1;
                m=1;
            end
            l=1;            
            k=k+1;
            kn=kn+2;
        end
        j=j+1;
        k=1;
        kn=[1,2,3,4];
    end
    i=i+1;
    j=1;
end

%calculated displacement
d=s\p;                    
disp('d =')
disp(d(:,1))

%Begining of the U matricies
u1=[0;0;0;d(1,1)]            
u2=[0;d(1,1);d(2,1);d(3,1)]
u3=[d(2,1);d(3,1);0;d(4,1)]
%u4=[0;d(4,1);0;d(5,1)]
%u5=[0;d(5,1);d(6,1);d(7,1)]  
%end of U matricies

%Begining of Q matricies
Q1=knn*u1                    
Q2=knn*u2
Q3=knn*u3
%Q4=knn*u4
%Q5=knn*u5                    
%End of Q matricies

R=[Q1(1,1);Q1(2,1);Q1(3,1)+Q2(1,1);Q3(3,1)]
%force matrix


%extra calculations to check force and moment numbers
Rsum=R(1,1)+R(5,1)+R(3,1)+R(4,1)-350-200
Msum=R(2,1)+p(1,1)+p(2,1)*(2/5)*L+p(4,1)+p(6,1)*L+R(3,1)*(1/5)*L+R(4,1)*(3/5)*L+R(5,1)*(4/5)*L