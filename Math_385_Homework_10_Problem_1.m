clc,clear

N = 75;
M = 75;

mx = 50;
my = 50;

x = linspace(0,1,mx);
y = linspace(0,1,my);

[X,Y] = meshgrid(x,y);

tvec = [0.0, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 100];

for n = 1:length(tvec)
  
  figure(n)
  clf
  u = solution_vector( tvec(n), X, Y, N, M );
  mesh(X,Y,u);
  set(gca,'fontsize',16);
  xlabel('x'); ylabel('y'); zlabel('u(t,x,y)');
  title(['Solution at time t = ',num2str(tvec(n))]);

end
