function [M_T] = Calc_M_T(Q_n,zk,zk_1,Alpha_xy)

M_T=zeros(3,1);

    for i=1:3
        
        for k=1:length(zk)

                M_T(i,1)=M_T(i,1)+1/2*Q_n(i,:,k)*Alpha_xy(:,1,i)*(zk(k)^2-zk_1(k)^2);
                
        end
    
    end

end
