function [uvms] = ComputeJacobians(uvms)
% compute the relevant Jacobians here
% joint limits
% manipulability
% tool-frame position control
% vehicle-frame position control
% horizontal attitude 
% minimum altitude
% preferred arm posture ( [-0.0031 1.2586 0.0128 -1.2460] )
%
% remember: the control vector is:
% [v_q_dot; v_p_dot] 
% [qdot_1, qdot_2, ..., qdot_7, xdot, ydot, zdot, omega_x, omega_y, omega_z]
% with the vehicle velocities projected on <v>
%
% therefore all task jacobians should be of dimensions
% m x 13
% where m is the row dimension of the task, and of its reference rate

% computation for tool-frame Jacobian
% [omegax_t omegay_t omegaz_t xdot_t ydot_t zdot_t] = Jt ydot
% [angular velocities; linear velocities]
%
% vehicle contribution is simply a rigid body transformation from vehicle
% frame to tool frame. Notice that linear and angular velocities are
% swapped due to the different definitions of the task and control
% variables
% GIVEN CODE
% Ste is the rigid body transformation from vehicle-frame to end-effector
% frame projected on <v>
uvms.Ste = [eye(3) zeros(3);  -skew(uvms.vTe(1:3,1:3)*uvms.eTt(1:3,4)) eye(3)];
% uvms.bJe contains the arm end-effector Jacobian (6x7) wrt arm base
% top three rows are angular velocities, bottom three linear velocities
uvms.Jt_a  = uvms.Ste * [uvms.vTb(1:3,1:3) zeros(3,3); zeros(3,3) uvms.vTb(1:3,1:3)] * uvms.bJe;
% vehicle contribution is simply a rigid body transformation from vehicle
% frame to tool frame. Notice that linear and angular velocities are
% swapped due to the different definitions of the task and control
% variables
uvms.Jt_v = [zeros(3) eye(3); eye(3) -skew(uvms.vTt(1:3,4))];
% juxtapose the two Jacobians to obtain the global one
uvms.Jt = [uvms.Jt_a uvms.Jt_v];

% EXERCISE 1.1 ------------------------------------------
uvms.Jv.ang = [zeros(3,7), zeros(3,3), uvms.wTv(1:3,1:3)];
uvms.Jv.lin = [zeros(3,7), uvms.wTv(1:3,1:3), zeros(3,3) ];


%% Horizontal attitude Jacobian
v_kv = [0 0 1]';                   % k-vector of vehicle frame wrt to w
w_kw = [0 0 1]';                   % k-vector of world frame wrt to w
v_kw = (uvms.vTw(1:3,1:3)) * w_kw; %Transform k in the world frame to k in the vehicle frame

% Compute misalignment vector of k-axis
uvms.rho   = ReducedVersorLemma(v_kw, v_kv); 

if (norm(uvms.rho) > 0) % Avoid division by zero
    nrho = uvms.rho/norm(uvms.rho); % compute unit vector 
else
    nrho = [0 0 0]';
end
uvms.Jha =[zeros(1,7) zeros(1,3) nrho'];


%EXERCISE 1.2, 2.1 -------------------------------------------
%% Altitude Jacobian
uvms.J_alt = [0 0 1]*[zeros(3,7) uvms.wTv(1:3,1:3) zeros(3,3)];

%EXERCISE 3.1 ------------------------------------------------ 
%% Goal attitude Jacobian
v_goal_position = uvms.vTw * [uvms.goalPosition; 1];

v_goal_projected = [1 0 0 0; 0 1 0 0; 0 0 0 0] * v_goal_position;
v_iv = [1; 0; 0];
uvms.xi = ReducedVersorLemma(v_goal_projected, v_iv); 

if (norm(uvms.rho) > 0) % Avoid division by zero
    nxi = uvms.xi/norm(uvms.xi); % compute unit vector 
else
    nxi = [0 0 0]';
end

uvms.J_ga =[zeros(1,7) zeros(1,3) nxi'];

%TASK 4.1 --------------------------------------
uvms.J.fix = [uvms.Jv.ang; uvms.Jv.lin];

%TASK 4.2 ---------------------------------------
% Joint limits
uvms.J.jl = [eye(7), zeros(7,6)];  %We are directly acting on the joint configurations

%TASK 5.1 ---------------------------------------
% pref_shapeized Jacobian for the preferred arm posture
uvms.J.pref_shape =  [eye(4) zeros(4,3) zeros(4,6)];

