function [Qp, rhop] = EnableTasksSetPriorities(uvms, mission, rhop, Qp)
    switch mission.phase
        case 1
            % Joint limit task
            [Qp, rhop] = iCAT_task(uvms.A.jl,    uvms.J.jl,    Qp, rhop, uvms.xdot.jl,  0.0001,   0.01, 10);
            %Minimum altitude
            %[Qp, rhop] = iCAT_task(uvms.A.min_alt, uvms.J_alt, Qp, rhop, uvms.xdot.min_alt, 0.0001, 0.01, 10);
            %Horizontal attitude
            [Qp, rhop] = iCAT_task(uvms.A.ha,    uvms.Jha,    Qp, rhop, uvms.xdot.ha,  0.0001,   0.01, 10);
            %Angular velocity (of vehicle)
            [Qp, rhop] = iCAT_task(uvms.A.v.ang,    uvms.Jv.ang,    Qp, rhop, uvms.xdot.v.ang,  0.0001,   0.01, 10);
            %Linear velocity (of vehicle)
            [Qp, rhop] = iCAT_task(uvms.A.v.lin,    uvms.Jv.lin,    Qp, rhop, uvms.xdot.v.lin,  0.0001,   0.01, 10);
            [Qp, rhop] = iCAT_task(uvms.A.pref_shape, uvms.J.pref_shape, Qp, rhop, uvms.xdot.pref_shape,  0.0001,   0.01, 10);
        case 2
            %[Qp, rhop] = iCAT_task(uvms.A.jl,    uvms.J.jl,    Qp, rhop, uvms.xdot.jl,  0.0001,   0.01, 10);
            [Qp, rhop] = iCAT_task(uvms.A.fix,    uvms.J.fix,    Qp, rhop, uvms.xdot.fix,  0.0001,   0.01, 10);
            [Qp, rhop] = iCAT_task(uvms.A.ha,   uvms.Jha,   Qp, rhop, uvms.xdot.ha, 0.0001,   0.01, 10);
            [Qp, rhop] = iCAT_task(uvms.A.t,    uvms.Jt,    Qp, rhop, uvms.xdot.t,  0.0001,   0.01, 10);
            [Qp, rhop] = iCAT_task(uvms.A.pref_shape, uvms.J.pref_shape, Qp, rhop, uvms.xdot.pref_shape,  0.0001,   0.01, 10);
        %     % Joint limit task
        %     [Qp, rhop] = iCAT_task(uvms.A.jl,    uvms.J.jl,    Qp, rhop, uvms.xdot.jl,  0.0001,   0.01, 10);
        %     %Minimum altitude
        %     [Qp, rhop] = iCAT_task(uvms.A.min_alt, uvms.J_alt, Qp, rhop, uvms.xdot.min_alt, 0.0001, 0.01, 10);
        %     %Horizontal attitude
        %     [Qp, rhop] = iCAT_task(uvms.A.ha,    uvms.Jha,    Qp, rhop, uvms.xdot.ha,  0.0001,   0.01, 10);
        %     %Angular velocity (of vehicle)
        %     [Qp, rhop] = iCAT_task(uvms.A.v.ang,    uvms.Jv.ang,    Qp, rhop, uvms.xdot.v.ang,  0.0001,   0.01, 10);
        %     %Linear velocity (of vehicle)
        %     [Qp, rhop] = iCAT_task(uvms.A.v.lin,    uvms.Jv.lin,    Qp, rhop, uvms.xdot.v.lin,  0.0001,   0.01, 10);
        % case 2
        %     % Joint limit task
        %     [Qp, rhop] = iCAT_task(uvms.A.jl,    uvms.J.jl,    Qp, rhop, uvms.xdot.jl,  0.0001,   0.01, 10);
        %     % horizontal attitude
        %     [Qp, rhop] = iCAT_task(uvms.A.ha,    uvms.Jha,    Qp, rhop, uvms.xdot.ha,  0.0001,   0.01, 10);
        %     % Goal attitude
        %     [Qp, rhop] = iCAT_task(uvms.A.ga, uvms.J_ga, Qp, rhop, uvms.xdot.ga, 0.0001, 0.01, 10);
        %     % Landing
        %     [Qp, rhop] = iCAT_task(uvms.A.land, uvms.J_alt, Qp, rhop, uvms.xdot.land, 0.0001, 0.01, 10);
        % case 3
        %     % Joint limit task
        %     [Qp, rhop] = iCAT_task(uvms.A.jl,    uvms.J.jl,    Qp, rhop, uvms.xdot.jl,  0.0001,   0.01, 10);
        %     % Fix the position of the robot
        %     [Qp, rhop] = iCAT_task(uvms.A.fix,    uvms.J.fix,    Qp, rhop, uvms.xdot.fix,  0.0001,   0.01, 10);
        %     % Move the tool towards the goal (=rock)
        %     [Qp, rhop] = iCAT_task(uvms.A.t,    uvms.Jt,    Qp, rhop, uvms.xdot.t,  0.0001,   0.01, 10);
        % case 4
        %   % Joint limit task
        %   [Qp, rhop] = iCAT_task(uvms.A.jl,    uvms.J.jl,    Qp, rhop, uvms.xdot.jl,  0.0001,   0.01, 10);
        %   % horizontal attitude
        %   [Qp, rhop] = iCAT_task(uvms.A.ha,    uvms.Jha,    Qp, rhop, uvms.xdot.ha,  0.0001,   0.01, 10);
        %   % Goal attitude
        %   [Qp, rhop] = iCAT_task(uvms.A.ga, uvms.J_ga, Qp, rhop, uvms.xdot.ga, 0.0001, 0.01, 10);
        %   %pref_shapeization control task
        %   [Qp, rhop] = iCAT_task(uvms.A.pref_shape, uvms.J.pref_shape, Qp, rhop, uvms.xdot.pref_shape,  0.0001,   0.01, 10);
        %   % Landing
        %   [Qp, rhop] = iCAT_task(uvms.A.land, uvms.J_alt, Qp, rhop, uvms.xdot.land, 0.0001, 0.01, 10);  
    end