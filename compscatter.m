function[ID0]= compscatter(z,dx,dy,dz,d_z,k,i,j,alpha0,I0,ID0,mu,mul,density)

    for n=1:dx 
        
        for p=1:dy
            
            theta=atan((z-dz-k)/sqrt((n-i)^2+(p-j)^2));
            Dif_CS=(1./(1+alpha0.*(1-cos(theta)))).^2.*((1+cos(theta).^2)/2).*(1+alpha0.^2.*(1-cos(theta)).^2./((1+cos(theta).^2).*(1+alpha0.*(1-cos(theta)))));
            Int_CS=2*pi*(((1+alpha0)./(alpha0.^2)).*((2*(1+alpha0)./(1+2*alpha0))-(1.0./alpha0).*log(1+2*alpha0))+(1.0./(2*alpha0)).*log(1+2*alpha0)-(1+3*alpha0)./((1+2*alpha0).^2));
            dcx=round((z-dz-k)/tan(theta));
                           
            if isfinite(dcx)==1
                            
                ID0(n,p)=ID0(n,p)+I0(i,j)*(1-exp(-mu*density(mul)*d_z))*cos(theta)/(z-k-dz)^2*Dif_CS/Int_CS;
                    
            end
                        
        end
        
    end
    
end