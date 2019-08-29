function [y2] =running_ave(y,span,len)

    y2=zeros(len,1);
    side=(span-1)/2;
    y2(1,1)=y(1,1);
    x=2;
    i=2;
    t=side+1;

    while i<=side
    
        I=i-(x/2);
        F=i+(x/2);
        y2(i,1)=mean(y(I:F,1));
        x=x+2;
        i=i+1;
    
    end

    while t<=length(y)-side

        I=t-(side);
        F=t+(side);
        y2(t,1)=mean(y(I:F,1));
        t=t+1;
    
    end

    i=length(y)-side;

    while i<=length(y)
    
        I=i-(x/2);
        F=i+(x/2);  
        y2(i,1)=mean(y(I:F,1));
        x=x-2;
        i=i+1;
    
    end
end