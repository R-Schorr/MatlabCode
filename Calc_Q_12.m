function [Q_12]=Calc_Q_12(E1,E2,nu_12,G_12)

Q_12=[E1/(1-nu_12*(E2*nu_12/E1)),E2*nu_12,0;E2*nu_12,E2,0;0,0,(2*G_12)]; 

end