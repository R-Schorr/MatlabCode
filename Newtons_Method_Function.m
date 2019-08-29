%%The input variables are equ in the form of a differential expression in x
%%and X has to be symbolic (syms x command) 
%% conv is convergence criteria
%%F is the number solving for 
%%ittera_max is the max number of allowed itterations
%%x=s is the initial guess
%%The returned values are i, the number of itterations performed
%%s is the value of the number that the problem converged to (or a diverged number if no solution)
%%and fval which should be close to zero if converged
%% A call of this function may look like [~,NM2,~]=Newtons_Method_Function(equ,conv,0,ittera_max,IM); for calculating downstream mach number
function [i,s,fval]= Newtons_Method_Function(equ,conv,F,ittera_max,s)

%% Establishing Itterational Variables for Newton's Method 

error=zeros(1,ittera_max);
i=0;
boolean=1;
syms x

%% Itteration of Newton's Method
while boolean==1 && i<=ittera_max
    i=i+1;
    f=equ-F;
    fval=vpa(subs(f,x,s));
    fval=double(fval);
    df=vpa(subs(diff(f),x,s));
    df=double(df);
    x_new=s-fval/df;
    error(1,i)=abs(x_new-s);
    if (error(1,i)>=conv)
        boolean=1;
    else
        boolean=0;
    end
    s=x_new;
end
end