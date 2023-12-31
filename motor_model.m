function [F_motor,M_motor,rpm_motor_dot] = motor_model(F,M,motor_rpm,params)

% Input parameters
% 
%   F,M: required force and moment
%
%   motor_rpm: current motor RPM
%
%   params: Quadcopter parameters
%
% Output parameters
%
%   F_motor: Actual thrust generated by Quadcopter's Motors
%
%   M_motor: Actual Moment generated by the Quadcopter's Motors
%
%   rpm_dot: Derivative of the RPM
%
%************ MOTOR MODEL ************************

% Write code here
cT = params.thrust_coefficient;
cQ = params.moment_scale;
d = params.arm_length;
mixer = [
    cT,cT,cT,cT;
    0,d*cT,0,-d*cT;
    -d*cT,0,d*cT,0;
    -cQ,cQ,-cQ,cQ];
% F_motor = 0;
% M_motor = zeros(3,1);
temp = mixer * motor_rpm.^2;
F_motor = temp(1);
M_motor = temp(2:4);

mixer_inv = [
    1/(4*cT),           0, -1/(2*cT*d), -1/(4*cQ);
    1/(4*cT),  1/(2*cT*d),           0,  1/(4*cQ);
    1/(4*cT),           0,  1/(2*cT*d), -1/(4*cQ);
    1/(4*cT), -1/(2*cT*d),           0,  1/(4*cQ)];
rpm_d = sqrt(mixer_inv*[F;M]);
rpm_motor_dot = params.motor_constant*(rpm_d-motor_rpm);
end
