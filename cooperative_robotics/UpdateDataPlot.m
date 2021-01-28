function [ plt ] = UpdateDataPlot( plt, uvms, t, loop, mission )

% this function samples the variables contained in the structure uvms
% and saves them in arrays inside the struct plt
% this allows to have the time history of the data for later plots

% you can add whatever sampling you need to do additional plots
% plots are done in the PrintPlot.m script

plt.t(loop) = t;

plt.toolPos(:, loop) = uvms.wTt(1:3,4);

plt.q(:, loop) = uvms.q;
plt.v_q_dot(:, loop) = uvms.v_q_dot;

plt.p(:, loop) = uvms.p;
plt.v_p_dot(:, loop) = uvms.v_p_dot;
plt.w_p_dot(:, loop) = uvms.w_p_dot;

%plt.xdot_jl(:, loop) = uvms.xdot.jl;
%plt.xdot_mu(:, loop) = uvms.xdot.mu;
plt.xdot_t(:, loop) =  blkdiag(uvms.wTv(1:3,1:3), uvms.wTv(1:3,1:3))*uvms.xdot.t;

plt.a(1:7, loop) = diag(uvms.A.jl);
plt.a(8, loop) = uvms.A.mu;
plt.a(9, loop) = uvms.A.ha(1,1);
plt.a(10, loop) = uvms.A.min_alt(1,1);
plt.a(11, loop) = uvms.A.v.ang(1,1);
plt.a(12, loop) = uvms.A.v.lin(1,1);
plt.a(13, loop) = uvms.A.land;

plt.toolx(:,loop) = uvms.wTt(1,4);
plt.tooly(:,loop) = uvms.wTt(2,4);
plt.toolz(:,loop) = uvms.wTt(3,4);

plt.rho(:,loop) = norm(uvms.rho);

[r, p, y] = RotMatrix2RPY(uvms.wRg);
plt.goal(:,loop) = [uvms.goalPosition; r; p; y];

plt.alt(:,loop) = uvms.alt; 
plt.min_alt(:,loop) = uvms.min_alt;
plt.target_distance_above_min_alt(:,loop) = uvms.target_distance_above_min_alt;
plt.mission_phase(:,loop) = mission.phase;
plt.xi(:,loop) = norm(uvms.xi);
end