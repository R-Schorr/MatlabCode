% ORBIT.M:
%
% Simulate the motion of a satellite within the Earth-Moon
% system in a 2D planar geometry.  This code generates 
% the various sample plots in the lecture notes (just 
% set test to be an integer between 1 and 8).
%
% November 24, 2008

clear, clear all
test = 1;  % Test number

fname = ['orbit', num2str(test), '.eps'];
options = odeset('Events','on','OutputFcn','odephas2');

if test == 1
  % Original values: figure eight.
  tend = 6.2;
  mu   = 1/82.45;
  y0   = [1.2; 0; 0; -1.04935751];
  % y0   = [1.2; 0; 0; -1.04935750983031990726];
  fric = 0.0;      
elseif test == 2
  % Test 2: three lobes.  
  tend = 11.2;
  y0   = [0.994; 0; 0; -2.03173262956];
  mu   = 1 / 81.45;
  fric   = 0.0;
elseif test == 3
  % Test 3: four lobes.  
  tend = 18.0;
  y0   = [0.994; 0; 0; -2.00158510637908252240537862224]; % from Ascher
  mu   = 1 / 81.45;
  fric   = 0.0;
elseif test == 4
  % Test 4: crash into Earth.
  tend = 4.2;
  y0   = [1.2; 0; 0; -1.04935751];
  mu   = 1 / 81.45;
  fric   = 1.0;
elseif test == 5
  % Test 5: settles to elliptical orbit about Earth.
  tend = 8.2;
  y0   = [0.994; 0; 0; -2.03173262956];
  mu   = 1 / 81.45;
  fric   = 0.1;
elseif test == 6 
  % Test 6: captured by moon.
  tend = 7;
  y0   = [0.994; 0; 0; -1.93173262956];
  mu   = 1 / 81.45;
  fric   = 0.0;
elseif test == 7
  % Test 7: precessing orbit about Earth.
  tend = 15;
  y0   = [0.7; 0; 0; -1.5];
  mu   = 1 / 81.45;
  fric   = 0.0;
elseif test == 8
  % Test 8: near-circular orbit about Earth.
  tend = 6;
  y0   = [0.3; 0; 0; -2.1];
  mu   = 1 / 81.45;
  fric   = 0.0;
end

[t,y,te,ye,ie] = ode45( 'orbitode', [0; tend], [], options, y0, mu, fric );
%% plot(y(:,1),y(:,2),ye(:,1),ye(:,2),'o');
hold on
text( 1-mu, 0, 'm', 'color', 'k' );
plot( [1], [0], 'ko', 'Markersize', 20 );
text( -mu,  0, 'E', 'color', 'r' );
plot( [0], [0], 'ro', 'Markersize', 30 );
xlabel('x(t)')
ylabel('y(t)')
grid on
axis equal
hold off
print('-depsc',fname)
