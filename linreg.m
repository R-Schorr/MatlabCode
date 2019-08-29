function [y_reg,u,Y_Fit,Y_Data]= linreg(len,x,y)

A=ones(2,len)';

A(:,2)=x(1:len);

%% Calculating the fit

u=(transpose(A)*A)^-1*transpose(A)*y(1:len);
y_t=(transpose(A)*A)^-1*transpose(A);

y_reg=A*u;

y_norm=y(1:len)-y_reg;
Tou=sqrt(sum(y_norm.^2)*1/(length(y_norm)-1));

Var_Y= @(x) 2*x*sum(y_t(1,:).*y_t(2,:)*Tou^2)+sum(y_t(1,:).^2*Tou^2)+x.^2*sum(y_t(2,:).^2*Tou^2);

%% Adding in fits on data and bounds

Y_L_Bound_Fit=u(1,1)+u(2,1)*x+norminv(.025)*sqrt(Var_Y(x));
Y_U_Bound_Fit=u(1,1)+u(2,1)*x+norminv(.975)*sqrt(Var_Y(x));

Y_L_Bound_Data=u(1,1)+u(2,1)*x+norminv(.025)*sqrt(Var_Y(x)+Tou^2);
Y_U_Bound_Data=u(1,1)+u(2,1)*x+norminv(.975)*sqrt(Var_Y(x)+Tou^2);

Y_Fit=[Y_L_Bound_Fit,Y_U_Bound_Fit];
Y_Data=[Y_L_Bound_Data,Y_U_Bound_Data];


end