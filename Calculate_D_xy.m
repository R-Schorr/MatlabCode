function [D_xy]=Calculate_D_xy(Q_n,zk,zk_1)

D_xy=zeros(3,3);

    for i=1:3
    
        for j=1:3
            
            for k=1:length(zk)

                D_xy(i,j)=D_xy(i,j)+1/3*Q_n(i,j,k)*(zk(k)^3-zk_1(k)^3);
            
            end
        end
    
    end
    
end