function B=scalar_laplacian(A,dx,dy,dz)
  nx=size(A,1);
  ny=size(A,2);
  nz=size(A,3);

  d2Adx2_interior=(A(3:nx,:,:)-2*A(2:(nx-1),:,:)+A(1:(nx-2),:,:))/dx^2;
  d2Ady2_interior=(A(:,3:ny,:)-2*A(:,2:(ny-1),:)+A(:,1:(ny-2),:))/dy^2;
  d2Adz2_interior=(A(:,:,3:nz)-2*A(:,:,2:(nz-1))+A(:,:,1:(nz-2)))/dz^2;
  
  % Concatenate zeros on boundaries (neglect boundary behavior... 
  % equivalent to just assuming without calculating, for example, 
  % d^2Ax/dx^2 = 0 on xmin, and xmax boundaries)

  d2Adx2=cat(1,zeros(1,ny,nz),d2Adx2_interior,zeros(1,ny,nz));
  d2Ady2=cat(2,zeros(nx,1,nz),d2Ady2_interior,zeros(nx,1,nz));
  d2Adz2=cat(3,zeros(nx,ny,1),d2Adz2_interior,zeros(nx,ny,1));

  B=d2Adx2+d2Ady2+d2Adz2;

						  
