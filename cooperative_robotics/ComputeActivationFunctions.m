function [uvms] = ComputeActivationFunctions(uvms, mission)
% compute the activation functions here
% Task 1.1 --------------------------------
% arm tool position control
% always active
uvms.A.t = eye(6);

% Vehicle position control
uvms.A.v.ang = eye(3);
uvms.A.v.lin = eye(3);

% Horizontal attitude Task (Decativated for |rho|<0.1, activated for |rho|>0.2, bell shaped function between these values)
 uvms.A.ha = IncreasingBellShapedFunction(0.1, 0.2, 0, 1, norm(uvms.rho));
%uvms.A.ha = 0;

% Task 1.2 --------------------------------
% Minimum altitude objective
uvms.A.min_alt = DecreasingBellShapedFunction(uvms.min_alt, uvms.min_alt + uvms.target_distance_above_min_alt, 0, 1, uvms.alt);

%Task 2.1 ---------------------------------
% altitude control for "Landing" action
uvms.A.land = 1;



 