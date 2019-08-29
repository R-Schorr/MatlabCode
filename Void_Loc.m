function[Void]=Void_Loc(mx,my,mz,xl,xu,yl,yu,zl,zu)
    
   z=linspace(1,1000,mz);
   y=linspace(1,100,my);
   x=linspace(1,100,mx);
   
   AL_7075=round(length(x)*length(y)*length(z)*(.056+.021+.012));
   
   Zn_loc=randperm(length(x)*length(y)*length(z),AL_7075);
   
   Void=ones(length(x),length(y),length(z));
   
   for i=1:round(length(x)*length(y)*length(z)*(.056))
      
       Void(Zn_loc(i))=2;
       
   end
      
   for i=round(length(x)*length(y)*length(z)*(.056):length(x)*length(y)*length(z)*(.021)+length(x)*length(y)*length(z)*(.056))
          
        Void(Zn_loc(i))=3;
    
   end
   
   for i=round(length(x)*length(y)*length(z)*(.056)+length(x)*length(y)*length(z)*(.021):length(x)*length(y)*length(z)*(.056)+length(x)*length(y)*length(z)*(.021)+length(x)*length(y)*length(z)*(.012))
          
        Void(Zn_loc(i))=4;
    
   end
      
   for k=1:length(z)
       
       for i=1:length(x)
           
           for j=1:length(y)           
   
                if  z(k)>zl && z(k)<zu 
       
                    if x(i)>yl && x(i)<yu
            
                        if y(j)>xl && y(j)<xu
              
                            Void(i,j,k)=0;
          
                        end
       
                    end
   
                end
                
           end
           
       end
       
   end