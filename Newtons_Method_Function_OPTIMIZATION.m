function [i,s,fval]= Newtons_Method_Function_OPTIMIZATION(equ,conv,ittera_max,s)
error=zeros(1,ittera_max);
i=0;
boolean=1;
syms x
while boolean==1 && i<=ittera_max
    i=i+1;
    f=equ;
    fval=vpa(subs(diff(f),x,s));
    df=vpa(subs(diff(diff(f)),x,s));
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