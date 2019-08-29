function r=myleftsum(f,b,n)
    
    a=0;
    
    dx=(b-a)/n;
   
    r=f(a+1);
    
    for k=1:n-1
        
      c=a+1+k*dx;
      r=r+f(c);
      
    end 
    
    r=dx*r;
    
  end