tic

clc,clear,clf

%% Defining the Testing Space

%Material size

mx=30*2;
my=26*2;
mz=540;

%Distance from detector

z=550;

%Size of detector

dx=32*2;
dy=26*2;
dz=5;

bits=14;
Noise_Circuit=2300;

% The differential thickness that compairs the length to pixel size

d_z=1;

%Beam Intensity

I0=1*10^8;

%Quantium Efficienty

qe=1;

%Integration Time

int_t=1/60;

%Temperature/Noise

T=298.15;
Kb=1.38*10^-23;

Johnson_Noise=4*Kb*T;
 
%% Operating on Inputs

%Location of defect in material

xl=ceil(.3*mx);
xu=ceil(.4*mx);
yl=ceil(.2*my);
yu=ceil(.3*my);
zl=ceil(.2*mz);
zu=ceil(.7*mz);

%Size of the testing space

x=ceil(1*dx);  
y=ceil(1*dy);

%Material location in space

ml=ceil(min([x-mx,y-my]/2)); 

[Al,Zn,Mg,Cu,Cd,Te,density]=scatterdata;

E=Al(60,1);

%% Universal Constants

c=299792458;
m0=9.10938356*10^-31;
alpha0=E/(m0*c^2);

%Making the material

m=Void_Loc(mx,my,mz,xl,xu,yl,yu,zl,zu);

RM=zeros(x,y,z);
l=[mx,my,mz];

%Populating the testing space with the material in the proper location

for i=1:l(1,1)

   for j=1:l(2)
       
       for k=1:l(1,3)
    
            RM(ml+i,ml+j,ml+k)=m(i,j,k);
            
       end
       
   end
    
end

%% Definining detector location in room

dl_x=ceil((x-dx)/2);
dl_y=ceil((y-dy)/2);
dm=round(rand(dx,dy));

for k=1:ceil(dz)

    for i=1:dx
    
        for j=1:dy

            if dm(i,j)==0 
            
                RM(dl_x+i,dl_y+j,z-k)=5;
            
            elseif dm(i,j)==1
            
                RM(dl_x+i,dl_y+j,z-k)=6;
            
            end       
        
        end
    
    end
    
end
%% Calculating the intensity change of the beam from one layer to another

% Intensity Matrix to pass through the material

ID=zeros(x,y);
ID0=zeros(x,y);
I0=ones(x,y)*I0;
pdm=0;

J_N_M=ones(x,y)*Johnson_Noise; 

for k=1:z

    for i=1:x
    
        for j=1:y
           
            [~,mul]=min(abs(RM(i,j,k)-[0,1,2,3,4,5,6]));
            [mu,mu2,ID,I0]=scatter(Al,Zn,Mg,Cu,Cd,Te,mul,i,j,ID,I0,density,E,d_z);
            
            if k==z-dz
                
                I_0=I0;
                
            end
            
            %% Comption Scattering
                % Defining the scattering based on cypherical coordinates
                % Theta lies in the x-z plane and azimuth is in y-z plane
                
                [~,cs]=min([I0(i,j),I0(i,j)*exp(-mu*density(mul)*d_z),I0(i,j)*exp(-mu2*density(mul)*d_z)]);
                
                if cs==2
                
                    ID0=compscatter(z,dx,dy,dz,d_z,k,i,j,alpha0,I0,ID0,mu,mul,density);                  
                    
                end
          
            %% Intensity Calcualtion
            
            if z-dz==k
                
                I0(i,j)=I0(i,j)+ID(i,j);
                
            end
            
            I0(i,j)=min([I0(i,j),I0(i,j)*exp(-mu*density(mul)*d_z),I0(i,j)*exp(-mu2*density(mul)*d_z)]);
        
        end
    
        
    end
    
end

%% Electrons Seen

IS=ID*qe*int_t+J_N_M;

%% Shot Noise

Alpha=mean(mean(IS));

lam=Alpha*int_t;

P_0=1-lam^0*exp(-lam);

for i=1:x
    
    for j=1:y

        if IS(i,j)>9.3*10^6
            
            IS(i,j)=75*10^6;
            
        end
        
    end
    
end

%% Full Scale Noise

Total_Noise=sqrt((ID*int_t*qe/bits).^2+P_0.^2+J_N_M.^2+Noise_Circuit.^2);    

%% Check Data Imported Correctly

figure(1)

hold on

plot(log10(Al(:,1)),log10(Al(:,3)))
plot(log10(Al(:,1)),log10(Al(:,4)))

grid on

hold off

figure(2)

hold on

plot(log10(Zn(:,1)),log10(Zn(:,4)))
plot(log10(Zn(:,1)),log10(Zn(:,5)))

grid on

hold off

figure(3)

hold on

plot(log10(Mg(:,1)),log10(Mg(:,4)))
plot(log10(Mg(:,1)),log10(Mg(:,5)))

grid on

hold off

figure(4)

hold on

plot(log10(Cu(:,1)),log10(Cu(:,4)))
plot(log10(Cu(:,1)),log10(Cu(:,5)))

grid on

hold off

figure(5)

hold on

plot(log10(Cd(:,1)),log10(Cd(:,4)))
plot(log10(Cd(:,1)),log10(Cd(:,5)))

grid on

hold off

figure(6)

hold on

plot(log10(Te(:,1)),log10(Te(:,4)))
plot(log10(Te(:,1)),log10(Te(:,5)))

grid on

hold off

figure(7)

hold on 

imagesc(I0)
colorbar

grid on

hold off

figure(8)

hold on

imagesc(ID)
colorbar

hold off

figure(9)

hold on

imagesc(I_0)
colorbar

hold off

figure(10)

hold on

imagesc(ID0)
colorbar

hold off

figure(11)

hold on

imagesc(IS)
colorbar

hold off

toc