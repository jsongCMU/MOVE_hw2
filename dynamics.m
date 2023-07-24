function [state_dot] = dynamics(params, state, F, M, rpm_motor_dot)
% Input parameters
% 
%   state: current state, will be using ode45 to update
%   [x,y,z,xdot,ydot,zdot,phi,theta,psi,phidot,thetadot,psidot,rpm x 4]T
%
%   F, M: actual force and moment from motor model
%
%   rpm_motor_dot: actual change in RPM from motor model
% 
%   params: Quadcopter parameters
%
%   question: Question number
%
% Output parameters
%
%   state_dot: change in state
%   [xdot,ydot,zdot,
%    xdotdot,ydotdot,zdotdot,
%    phidot,thetadot,psidot,
%    phidotdot,thetadotdot,psidotdot,
%    rpmdot x 4]T
%   statedot 10~12 = alpha?
%   w = phidot, thetadot, psidot
%************  DYNAMICS ************************

% Write code here
% [m * 1^3 0^3][a    ] + [0        ] = [Reb Fb - mg]  ]
% [0^3     I^3][alpha]   [w x I^3 w]   [[Mb1 Mb2 Mb3]T]
A = [
    params.mass * eye(3), zeros(3,3);
    zeros(3,3), params.inertia];
Ainv = inv(A);
phi = state(7);
theta = state(8);
psi = state(9);
w = state(10:12);
Fe = [
    F*cos(phi)*cos(psi)*sin(theta)+sin(phi)*sin(psi);
    F*cos(phi)*sin(psi)*sin(theta)-sin(phi)*cos(psi);
    F*cos(theta)*cos(phi)-params.mass*params.gravity];
C = [
    Fe;
    M(1);M(2);M(3)];
B = [
    zeros(3,1);
    cross(w, params.inertia*w)];
accels = Ainv*(C-B);
a = accels(1:3,1);
alpha = accels(4:6,1);

% state_dot
state_dot = zeros(16,1);
state_dot(1:3) = state(4:6);
state_dot(4:6) = a;
state_dot(7:9) = w;
state_dot(10:12) = alpha;
state_dot(13:16) = rpm_motor_dot;





end