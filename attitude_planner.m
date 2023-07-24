function [rot, omega] = attitude_planner(desired_state, params)

% Input parameters
%
%   desired_state: The desired states are:
%   desired_state.pos = [x; y; z], 
%   desired_state.vel = [x_dot; y_dot; z_dot],
%   desired_state.rot = [phi; theta; psi], 
%   desired_state.omega = [phidot; thetadot; psidot]
%   desired_state.acc = [xdotdot; ydotdot; zdotdot];
%
%   params: Quadcopter parameters
%
% Output parameters
%
%   rot: will be stored as desired_state.rot = [phi; theta; psi], 
%
%   omega: will be stored as desired_state.omega = [phidot; thetadot; psidot]
%
%************  ATTITUDE PLANNER ************************

% Write code here
psi_d = desired_state.rot(3);
rot = zeros(3,1);
rot(1:2) = 1/params.gravity *...
    [sin(psi_d),-cos(psi_d);cos(psi_d),sin(psi_d)] * ...
    desired_state.acc(1:2);
rot(3) = desired_state.rot(3);
omega = zeros(3,1);
omega(1:2) = desired_state.omega(3)/params.gravity *...
    [cos(psi_d),sin(psi_d);-sin(psi_d),cos(psi_d)] * ...
    desired_state.acc(1:2);
omega(3) = desired_state.omega(3);
end

