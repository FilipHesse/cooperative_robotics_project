function [uvms, mission] = UpdateMissionPhase(uvms, mission)
    switch mission.phase
        case 1  
            [ang, lin] = CartError(uvms.wTg , uvms.wTv);
            eps_lin = 0.01;
            eps_ang = 0.05;
            norm(ang)
            norm(lin)
            if norm(lin) < eps_lin
                mission.phase = 2;
                % Rotation matrix to convert coordinates between Unity and the <w> frame
                % do not change
                wuRw = rotation(0,-pi/2,pi/2);
                vRvu = rotation(-pi/2,0,-pi/2);

                % pipe parameters
                u_pipe_center = [-10.66 31.47 -1.94]'; % in unity coordinates
                pipe_center = wuRw'*u_pipe_center;     % in world frame coordinates
                pipe_radius = 0.3;
                distanceGoalWrtPipe = 0.3;
                uvms.goalPosition = pipe_center + (pipe_radius + distanceGoalWrtPipe)*[0 0 1]';
                uvms.wRg = rotation(pi,0,0);
                uvms.wTg = [uvms.wRg uvms.goalPosition; 0 0 0 1];

                uvms.fixedPose = uvms.wTv;
            end
    end
end

