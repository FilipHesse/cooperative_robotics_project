function [uvms] = ComputeTaskReferences(uvms, mission)
% compute the task references here
% GIVEN CODE--------------------------------------
% reference for tool-frame position control task
[ang, lin] = CartError(uvms.vTg , uvms.vTt);
uvms.xdot.t = 0.2 * [ang; lin];
% limit the requested velocities...
uvms.xdot.t(1:3) = Saturate(uvms.xdot.t(1:3), 0.2);
uvms.xdot.t(4:6) = Saturate(uvms.xdot.t(4:6), 0.2);

% TASK 1.1 ---------------------------------------
% reference for vehicle-frame position control task
[ang, lin] = CartError(uvms.wTg , uvms.wTv);
uvms.xdot.v.ang = Saturate(0.2 * ang, 0.2);
uvms.xdot.v.lin = Saturate(0.2 * lin, 0.2);

%% reference for horizontal attitude
uvms.xdot.ha = - 0.2 * norm(uvms.rho); 

%% reference for altitude
uvms.xdot.min_alt = - 0.5 * (uvms.sensorDistance- (uvms.min_alt+0.5));




