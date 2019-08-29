function [B_xy]=Calculate_B_xy(Q_n,zk,zk_1)

B_xy=zeros(3,3);

    for i=1:3
    
        for j=1:3
            
            for k=1:length(zk)

                B_xy(i,j)=B_xy(i,j)+1/2*Q_n(i,j,k)*(zk(k)^2-zk_1(k)^2);
            
            end
        end
    
    end
    
end