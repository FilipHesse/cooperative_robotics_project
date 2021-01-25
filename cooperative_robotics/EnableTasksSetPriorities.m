function [Qp, ydotbar] = EnableTasksSetPriorities(uvms, mission, ydotbar, Qp)
    switch mission.phase
        case 1
            %[Qp, ydotbar] = iCAT_task(uvms.A.alt, uvms.J_alt, Qp, ydotbar, uvms.xdot.alt, 0.0001, 0.01, 10);
            [Qp, ydotbar] = iCAT_task(uvms.A.min_alt, uvms.J_alt, Qp, ydotbar, uvms.xdot.min_alt, 0.0001, 0.01, 10);
            [Qp, ydotbar] = iCAT_task(uvms.A.ha,    uvms.Jha,    Qp, ydotbar, uvms.xdot.ha,  0.0001,   0.01, 10);
            %[Qp, ydotbar] = iCAT_task(uvms.A.t,    uvms.Jt,    Qp, ydotbar, uvms.xdot.t,  0.0001,   0.01, 10);
            [Qp, ydotbar] = iCAT_task(uvms.A.v.ang,    uvms.Jv.ang,    Qp, ydotbar, uvms.xdot.v.ang,  0.0001,   0.01, 10);
            [Qp, ydotbar] = iCAT_task(uvms.A.v.lin,    uvms.Jv.lin,    Qp, ydotbar, uvms.xdot.v.lin,  0.0001,   0.01, 10);
        case 2
            [Qp, ydotbar] = iCAT_task(uvms.A.ha,    uvms.Jha,    Qp, ydotbar, uvms.xdot.ha,  0.0001,   0.01, 10);
            [Qp, ydotbar] = iCAT_task(uvms.A.land, uvms.J_alt, Qp, ydotbar, uvms.xdot.land, 0.0001, 0.01, 10);
            %[Qp, ydotbar] = iCAT_task(uvms.A.min_alt, uvms.Jalt, Qp, ydotbar, uvms.xdot.min_alt, 0.0001, 0.01, 10);
            %[Qp, ydotbar] = iCAT_task(uvms.A.t,    uvms.Jt,    Qp, ydotbar, uvms.xdot.t,  0.0001,   0.01, 10);
            %[Qp, ydotbar] = iCAT_task(uvms.A.v.ang,    uvms.Jv.ang,    Qp, ydotbar, uvms.xdot.v.ang,  0.0001,   0.01, 10);
            %[Qp, ydotbar] = iCAT_task(uvms.A.v.lin,    uvms.Jv.lin,    Qp, ydotbar, uvms.xdot.v.lin,  0.0001,   0.01, 10);
end