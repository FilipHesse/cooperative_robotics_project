function [uvms] = ComputeActivationFunctions(uvms, mission)
% compute the activation functions here
% Task 1.1 --------------------------------
% arm tool position control
% always active
uvms.A.t = eye(6);

% Vehicle position control
uvms.A.v.ang = eye(3);
uvms.A.v.lin = eye(3);

% Horizontal attitude Task (Deactivated for |rho|<0.1, activated for |rho|>0.2, bell shaped function between these values)
 uvms.A.ha = IncreasingBellShapedFunction(0.01, 0.05, 0, 1, norm(uvms.rho));
%uvms.A.ha = 0;

% Task 1.2 --------------------------------
% Minimum altitude objective
uvms.A.min_alt = DecreasingBellShapedFunction(uvms.min_alt, uvms.min_alt + uvms.target_distance_above_min_alt, 0, 1, uvms.alt);

% Task 2.1 ---------------------------------
% altitude control for "Landing" action
% start when misalignment angle to goal small
uvms.A.land = DecreasingBellShapedFunction(0.1, 0.2, 0, 1, norm(uvms.xi)); 

% Task 3.1 ---------------------------------
% Goal attitude
uvms.A.ga = 1;

% Task 4.1 ---------------------------------
% Fix Vehicle
uvms.A.fix = eye(6);

% Task 4.2 ---------------------------------
% Activation function: two combined sigmoids, which are at their maximum at the joint limits and approach zero between them
for i = 1:length(uvms.q)
    uvms.A.jl(i, i) = DecreasingBellShapedFunction( uvms.jlmin(i), uvms.jlmin(i) + 0.1, 0, 1, uvms.q(i) ) + IncreasingBellShapedFunction( uvms.jlmax(i) - 0.1,uvms.jlmax(i), 0, 1, uvms.q(i));
end
 