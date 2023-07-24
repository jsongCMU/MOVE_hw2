function [waypoints, waypoint_times] = lookup_waypoints(question)
%
% Input parameters
%
%   question: which question of the project we are on 
%      Possible arguments for question: 2, 3, 5, 6.2, 6.3, 6.5, 7, 9, 10
%
% Output parameters
%
%   waypoints: of the form 
%   [x1, x2, x3, ...;
%    y1, y2, y3, ...; 
%    z1, z2, z3, ...; 
%    yaw1, yaw2, yaw3, ...]
% 
%   waypoint_times: [1 x n] vector of times where n is the number of waypoings, 
%   represents the seconds you should be at each respective waypoint
%
%************ LOOKUP WAYPOINTS ************************

% Write code here

%Sample waypoints for hover trajectory
if question == 2
    waypoints = [...
        0 0.1 0.2 0.3; ...
        0 0 0 0; ...
        0.5 0.5 0.5 0.5; ...
        0 0 0 0];
    waypoint_times = [0 2 4 6];
% TODO: questions 3, 5, 6.2, 6.3, 6.5, 7, 9, 10
end

end
