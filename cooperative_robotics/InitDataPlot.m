function [plt] = InitDataPlot( maxloops)
    plt.t = zeros(1, maxloops);
    plt.q = zeros(7, maxloops);
    plt.v_q_dot = zeros(7, maxloops);

    plt.p = zeros(6, maxloops);
    plt.v_p_dot = zeros(6, maxloops);
    plt.w_p_dot = zeros(6, maxloops);

    plt.xdot_jl = zeros(7, maxloops);
    plt.xdot_mu = zeros(1, maxloops);
    plt.xdot_t = zeros(6, maxloops);

    plt.a = zeros(11, maxloops);

    plt.rho = zeros(1, maxloops);

    plt.goal = zeros(6, maxloops)

    plt.alt = zeros(1, maxloops);
    plt.min_alt = zeros(1, maxloops);
    plt.target_distance_above_min_alt = zeros(1, maxloops);  
end

