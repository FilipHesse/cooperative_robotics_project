function [Qp, ydotbar] = EnableTasksSetPriorities(uvms, mission, ydotbar, Qp)
    switch mission.phase
        case 1
            % Joint limit task
            [Qp, ydotbar] = iCAT_task(uvms.A.jl,    uvms.J.jl,    Qp, ydotbar, uvms.xdot.jl,  0.0001,   0.01, 10);
            %Minimum altitude
            [Qp, ydotbar] = iCAT_task(uvms.A.min_alt, uvms.J_alt, Qp, ydotbar, uvms.xdot.min_alt, 0.0001, 0.01, 10);
            %Horizontal attitude
            [Qp, ydotbar] = iCAT_task(uvms.A.ha,    uvms.Jha,    Qp, ydotbar, uvms.xdot.ha,  0.0001,   0.01, 10);
            %Angular velocity (of vehicle)
            [Qp, ydotbar] = iCAT_task(uvms.A.v.ang,    uvms.Jv.ang,    Qp, ydotbar, uvms.xdot.v.ang,  0.0001,   0.01, 10);
            %Linear velocity (of vehicle)
            [Qp, ydotbar] = iCAT_task(uvms.A.v.lin,    uvms.Jv.lin,    Qp, ydotbar, uvms.xdot.v.lin,  0.0001,   0.01, 10);
        case 2
            % Joint limit task
            [Qp, ydotbar] = iCAT_task(uvms.A.jl,    uvms.J.jl,    Qp, ydotbar, uvms.xdot.jl,  0.0001,   0.01, 10);
            % horizontal attitude
            [Qp, ydotbar] = iCAT_task(uvms.A.ha,    uvms.Jha,    Qp, ydotbar, uvms.xdot.ha,  0.0001,   0.01, 10);
            % Goal attitude
            [Qp, ydotbar] = iCAT_task(uvms.A.ga, uvms.J_ga, Qp, ydotbar, uvms.xdot.ga, 0.0001, 0.01, 10);
            % Landing
            [Qp, ydotbar] = iCAT_task(uvms.A.land, uvms.J_alt, Qp, ydotbar, uvms.xdot.land, 0.0001, 0.01, 10);
        case 3
            % Joint limit task
            [Qp, ydotbar] = iCAT_task(uvms.A.jl,    uvms.J.jl,    Qp, ydotbar, uvms.xdot.jl,  0.0001,   0.01, 10);
            % Fix the position of the robot
            [Qp, ydotbar] = iCAT_task(uvms.A.fix,    uvms.J.fix,    Qp, ydotbar, uvms.xdot.fix,  0.0001,   0.01, 10);
            % Move the tool towards the goal (=rock)
            [Qp, ydotbar] = iCAT_task(uvms.A.t,    uvms.Jt,    Qp, ydotbar, uvms.xdot.t,  0.0001,   0.01, 10);
    end