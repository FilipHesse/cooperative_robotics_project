function [uvms] = ComputeActivationFunctions(uvms, mission)
% compute the activation functions here

% arm tool position control
% always active
uvms.A.t = eye(6);

% Vehicle position control
uvms.A.v.ang = eye(3);
uvms.A.v.lin = eye(3);
