function [uvms, mission] = UpdateMissionPhase(uvms, mission)
    switch mission.phase
        case 1  
            [ang, lin] = CartError(uvms.wTg , uvms.wTv);
            eps_goal = 0.01;
            if norm(ang) < eps_goal && norm(lin) < eps_goal
                mission.phase = 2;
            end
        case 2 
            if uvms.alt < 0.03
                mission.phase = 3;
                uvms.goalPosition = [12.2025   37.3748  -39.8860]'; %Rock center!
                uvms.wRg = rotation(pi,0,0)*uvms.wTv(1:3,1:3);
                uvms.wTg = [uvms.wRg uvms.goalPosition; 0 0 0 1];     %For now we dont care about any rotation of the goal
                
            end
    end
end

