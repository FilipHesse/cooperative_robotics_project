function [uvms, mission] = UpdateMissionPhase(uvms, mission)
    switch mission.phase
        case 1  
            [ang, lin] = CartError(uvms.wTg , uvms.wTv)
            eps_goal = 0.01
            if norm(ang) < eps_goal && norm(lin) < eps_goal
                mission.phase = 2
            end
    end
end

