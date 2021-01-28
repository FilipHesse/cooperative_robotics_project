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

% TASK 1.2 --------------------------------------
%% Compute altitude from sensor distance: Transform sensor distance from 
% vehicle frame to world frame and consider only the z-component
% => The distance will be projected on the k-axis of the world 
uvms.alt = [0 0 1]*uvms.wTv(1:3,1:3)*[0; 0; uvms.sensorDistance];

%% reference for minimal altitude
velocity_min_alt = 0.5;        %Move faster than normal navigation as this is more relevant
uvms.xdot.min_alt = Saturate(velocity_min_alt * (uvms.min_alt + uvms.target_distance_above_min_alt - uvms.alt), 0.5);

%TASK 2.1 ----------------------------------------
%% reference for altitude of the vehicle that converges to 0
velocity_landing = 0.2;
uvms.xdot.land = - velocity_landing * (uvms.alt - 0);

%TASK 3.1 ------------------------------------------------

%% reference for attitude towards goal
uvms.xdot.ga = - 0.2 * norm(uvms.xi);

%TASK 4.1 -----------------------------------------------
[ang, lin] = CartError(uvms.fixedPose , uvms.wTv);
uvms.xdot.fix = Saturate(0.2 * [ang; lin], 0.2);

