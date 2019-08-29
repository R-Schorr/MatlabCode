clc,clear

m=xlsread('EXAMPLE 1 a.hat vs a.xlsx');

x=log(m(:,2));
y=m(:,3);

%% Making the a matrix

A=ones(2,length(x))';

A(:,2)=x;

%% Calculating the fit

u=inv(transpose(A)*A)*transpose(A)*y;
y_t=inv(transpose(A)*A)*transpose(A);

y_reg=A*u;

y_norm=y-y_reg;
Tou=sqrt(sum(y_norm.^2)*1/(length(y_norm)-1));

Var_Y= @(x) 2*x*sum(y_t(1,:).*y_t(2,:)*Tou^2)+sum(y_t(1,:).^2*Tou^2)+x.^2*sum(y_t(2,:).^2*Tou^2);

%% Adding in fits on data and bounds

Y_L_Bound_Fit=u(1,1)+u(2,1)*x+norminv(.025)*sqrt(Var_Y(x));
Y_U_Bound_Fit=u(1,1)+u(2,1)*x+norminv(.975)*sqrt(Var_Y(x));

Y_L_Bound_Data=u(1,1)+u(2,1)*x+norminv(.025)*sqrt(Var_Y(x)+Tou^2);
Y_U_Bound_Data=u(1,1)+u(2,1)*x+norminv(.975)*sqrt(Var_Y(x)+Tou^2);

%% Find POD 
y_th = 100;
x_1=log(linspace(1,30,10000));
A=ones(2,length(x_1))';

A(:,2)=x_1;
y_t=inv(transpose(A)*A)*transpose(A);
probit = @(x) sqrt(2)*erfinv(2*x-1);

%% Find CDF and POD by using error function

cdf = (1/2)*(1+erf((y_th-u(1,1)-u(2,1)*x_1)./(sqrt(2)*sqrt(Var_Y(x_1)+Tou^2))));
pod = 1-cdf;
confid_lower2 = 1-(1/2)*(1+erf((y_th-u(1,1)-u(2,1)*x_1-norminv(.025)*sqrt(Var_Y(x_1)))./(sqrt(2)*sqrt(Var_Y(x_1)+Tou^2))));
confid_higher2 = 1-(1/2)*(1+erf((y_th-u(1,1)-u(2,1)*x_1-norminv(.975)*sqrt(Var_Y(x_1)))./(sqrt(2)*sqrt(Var_Y(x_1)+Tou^2))));

%% Locating the 90/95, a90 ,a50 and 90/2.5 

[~,loc]=min(abs(pod-.9));
[~,loc_l]=min(abs(confid_lower2-.9));
[~,loc_u]=min(abs(confid_higher2-.9));
[~,loc_50]=min(abs(pod-.5));

%% Verical lines defined at the points found above

x_90=x_1(loc)*ones(1,length(x_1));
x_l=x_1(loc_l)*ones(1,length(x_1));
x_u=x_1(loc_u)*ones(1,length(x_1));
x_50=x_1(loc_50)*ones(1,length(x_1));

%% The plots of data their fits and the pod and its fit

figure(1)

hold on

plot(x,y,'.')
plot(x,y_reg)
plot(x,Y_L_Bound_Fit)
plot(x,Y_U_Bound_Fit)
plot(x,Y_L_Bound_Data)
plot(x,Y_U_Bound_Data)

hold off

figure(2)

y=linspace(0,1,length(x_1)); %vertical line's y coordinate

hold on
%plot(x_1, cdf);
plot(x_1, pod, 'r');
plot(x_1, confid_lower2, 'g');
plot(x_1, confid_higher2, 'g');
plot(x_1(loc),pod(loc),'*')
plot(x_1(loc_l),confid_lower2(loc_l),'*')
plot(x_1(loc_u),confid_higher2(loc_u),'*')
plot(x_1(loc_50),pod(loc_50),'*')
plot(x_90,y,'--')
plot(x_l,y,'--')
plot(x_u,y,'--')
plot(x_50,y,'--')
hold off

%% Debugging Plot

%figure(3)

%hold on 

%plot(x,y_norm,'*')

%hold off

%%

m=exp(x_1(loc))
m=exp(x_1(loc_l))
m=exp(x_1(loc_u))
m=exp(x_1(loc_50))