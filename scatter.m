function [mu,mu2,ID,I0]=scatter(Al,Zn,Mg,Cu,Cd,Te,mul,i,j,ID,I0,density,E,d_z)

    if mul==1
                
        %If vacuum
        mu=0;
        mu2=0;
        
    elseif mul==2
        
        %If aluminium
        [~,hdr]=min(abs(E-Al(:,1)));
        mu=Al(hdr,3);
        mu2=Al(hdr,4);
    
    elseif mul==3
        
        %If zinc
        [~,hdr]=min(abs(E-Zn(:,1)));
        mu=Zn(hdr,3);
        mu2=Zn(hdr,4);
        
    elseif mul==4
        
        %If magnesium
        [~,hdr]=min(abs(E-Mg(:,1)));
        mu=Mg(hdr,3);
        mu2=Mg(hdr,4);
        
    elseif mul==5
        
        %If copper
        [~,hdr]=min(abs(E-Cu(:,1)));
        mu=Cu(hdr,3);
        mu2=Cu(hdr,4);
    
    elseif mul==6
        
        %If Cadumium (in detector)
        [~,hdr]=min(abs(E-Cd(:,1)));
        mu=Cd(hdr,3);
        mu2=Cd(hdr,4);
        ID(i,j)=max([I0(i,j)-I0(i,j)*exp(-mu*density(mul)*d_z),I0(i,j)-I0(i,j)*exp(-mu2*density(mul)*d_z)]);
        
    elseif mul==7
                
        %If Telerium (in detector)
        [~,hdr]=min(abs(E-Te(:,1)));
        mu=Te(hdr,3);
        mu2=Te(hdr,4);
        ID(i,j)=max([I0(i,j)-I0(i,j)*exp(-mu*density(mul)*d_z),I0(i,j)-I0(i,j)*exp(-mu2*density(mul)*d_z)]);
        
    end
            
end