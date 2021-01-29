function [uvms] = InitUVMS(robotname)

% uvms.vTb
% transformation matrix betwene the arm base wrt vehicle frame
% expresses how the base of the arm is attached to the vehicle
% do NOT change, since it must be coherent with the visualization tool
if (strcmp(robotname, 'DexROV'))    
    % do NOT change
    uvms.vTb = [rotation(pi, 0, pi) [0.167 0 -0.43]'; 0 0 0 1]; 
else
    if (strcmp(robotname, 'Robust'))
        % do NOT change
        uvms.vTb = [rotation(0, 0, pi) [0.85 0 -0.42]'; 0 0 0 1];
    end
end

uvms.v_q_dot = [0 0 0 0 0 0 0]';
uvms.v_p_dot = [0 0 0 0 0 0]';
uvms.w_p_dot = [0 0 0 0 0 0]';

% joint limits corresponding to the actual MARIS arm configuration
uvms.jlmin  = [-2.9;-1.6;-2.9;-2.95;-2.9;-1.65;-2.8];
uvms.jlmin  = [-2.9;-0.5;-2.9;-2.95;-2.9;-1.65;-2.8]; %For testing if joint limit task works
uvms.jlmax  = [2.9;1.65;2.9;0.01;2.9;1.25;2.8];

%Constants for minimum altitude objective
uvms.min_alt = 1                         % Constants
uvms.target_distance_above_min_alt = 0.3  % Inequality objective! Target should be above the minimal height


% to be computed at each time step
uvms.wTv = eye(4,4);
uvms.wTt = eye(4,4);
uvms.vTw = eye(4,4);
uvms.vTe = eye(4,4);
uvms.vTt = eye(4,4);
uvms.vTg = eye(4,4);
uvms.Ste = eye(6,6);
uvms.bTe = eye(4,4);
uvms.bJe = eye(6,7);
uvms.djdq = zeros(6,7,7);
uvms.mu  = 0;
uvms.rho = zeros(3,1);
uvms.sensorDistance = 0;
uvms.alt = 0;
uvms.fixedPose = zeros(4,4);

uvms.J.jl = [];
uvms.Jmu = [];
uvms.Jha = [];
uvms.Jt_a = [];
uvms.Jt_v = [];
uvms.Jt = [];
uvms.J_alt = [];
uvms.J_ga = [];

uvms.Jv.ang = [];
uvms.Jv.lin = [];

uvms.J.fix = [];


uvms.xdot.jl = [];
uvms.xdot.mu = [];
uvms.xdot.ha = [];
uvms.xdot.t = [];
uvms.xdot.v.ang = [];
uvms.xdot.v.lin = [];
uvms.xdot.min_alt = [];
uvms.xdot.land = [];
uvms.xdot.ga = [];
uvms.xdot.fix = [];

uvms.A.jl = zeros(7,7);
uvms.A.mu = 0;
uvms.A.ha = zeros(1,1);
uvms.A.t = zeros(6,6);
uvms.A.v.ang = zeros(3,3)
uvms.A.v.lin = zeros(3,3)
uvms.A.min_alt = zeros(3,3)
uvms.A.land = 0;
uvms.A.ga = 0
uvms.A.fix = zeros(6,6)


end

