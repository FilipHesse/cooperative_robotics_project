function [uvms] = ComputeActivationFunctions(uvms, mission)
% compute the activation functions here

% arm tool position control
% always active
uvms.A.t = eye(6);

% Vehicle position control
uvms.A.v.ang = eye(3);
uvms.A.v.lin = eye(3);

% Horizontal attitude Task (Decativated for |phi|<0.1, activated for |phi|>0.2, bell shaped function between these values)
uvms.A.ha = IncreasingBellShapedFunction(0.1, 0.2, 0, 1, norm(uvms.phi));
 