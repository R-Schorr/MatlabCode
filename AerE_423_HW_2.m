clc,clear

E1=69*10^9;
Sy1=310*10^6;
nu1=.33;
ro1=2700;

l=3;
w=2;
ratio=.1;
P=400;

Stiffness=[10^4 10^5 10^6]';

G1=E1/(2*(1-nu1));

G_c=.4*G1*(ratio)^2;

c=linspace(.01,.4,10000);

c_l=c/l;

t_l=2.*8./2.*(G_c./(E1*c_l)).*(1./(2.*(1./Stiffness).*w*G_c.*c_l-1));
t=t_l*l;
W=(2*ro1*w*t_l.*l^2+ro1.*ratio*w.*c_l*l^2)*9.81;

[x,k]=min(W');

EQ1=E1*w*t_l(1,k(1))*l*(c_l(1,k(1,1)))^2/2;
EQ2=E1*w*t_l(2,k(2))*l*(c_l(1,k(1,2)))^2/2;
EQ3=E1*w*t_l(3,k(3))*l*(c_l(1,k(1,3)))^2/2;

def1=P*l^3/(8*EQ1)+P*l/(G_c*w*(c_l(1,k(1,1)))*2);
def2=P*l^3/(8*EQ2)+P*l/(G_c*w*(c_l(1,k(1,2)))*2);
def3=P*l^3/(8*EQ3)+P*l/(G_c*w*(c_l(1,k(1,3)))*2);

W_opt=W(1,k(1));
W_opt(1,2)=W(2,k(2));
W_opt(1,3)=W(3,k(3));

hold on 

plot(c_l,t_l)
plot(c_l(k(1)),t_l(1,k(1)),'*')
plot(c_l(k(2)),t_l(2,k(2)),'*')
plot(c_l(k(3)),t_l(3,k(3)),'*')

hold off