function[b] = rsum(x,z) 


b=zeros(1,length(z));

  for i=1:length(z)-1
     
      b(1,i+1)=b(i)+x(2*i+1)*z(i+1);
      
  end
    
