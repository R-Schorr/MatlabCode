function [A_xy]=Calculate_A_xy(Q_n,zk,zk_1)

A_xy=zeros(3,3);

    for i=1:3
    
        for j=1:3
            
            for k=1:length(zk)

                A_xy(i,j)=A_xy(i,j)+Q_n(i,j,k)*(zk(k)-zk_1(k));
            
            end
        end
    
    end

end