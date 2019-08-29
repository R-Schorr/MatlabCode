function [N_T] = Calc_N_T(Q_n,zk,zk_1,Alpha_xy)

N_T=zeros(3,1);

    for i=1:3
        
        for k=1:length(zk)

                N_T(i,1)=N_T(i,1)+Q_n(i,:,k)*Alpha_xy(:,1,i)*(zk(k)-zk_1(k));
                
        end
    
    end

end