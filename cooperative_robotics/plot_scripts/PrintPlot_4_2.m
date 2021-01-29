function [ ] = PrintPlot_4_2( plt )
% some predefined plots
% you can add your own
dir='./plot_output/4_2/';
suffix='_wrong_limits';

mission_transitions = [];
phases = [1 2 3 4 5 6 7 8 9 10];
for phase = phases
    mission_transitions = [mission_transitions, plt.t(find(plt.mission_phase==phase,1))];
end



fig = figure();hold on;
hplot = plot(plt.t, plt.toolx);
set(gca,'ColorOrderIndex',1);
set(hplot, 'LineWidth', 2);
hplot = yline(plt.goal(1,end), 'LineWidth', 3, 'LineStyle','--');
set(hplot, 'LineWidth', 3);
ylim([11.5, 12.5]);
xlabel('time [s]')
ylabel('position of the tool [m]')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end

legend('x_{tool}', 'x_{rock}');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'x_tool',suffix,'.jpg'))

% % Plot altitude over the ground
fig = figure();hold on;
set(gca,'ColorOrderIndex',2);
hplot = plot(plt.t, plt.tooly);
set(hplot, 'LineWidth', 2);
hplot = yline(plt.goal(2,end), 'LineWidth', 3, 'LineStyle','--');
set(hplot, 'LineWidth', 3);
ylim([37, 38]);
xlabel('time [s]')
ylabel('position of the tool [m]')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end
legend('y_{tool}','y_{rock}');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'y_tool',suffix,'.jpg'))



fig = figure();hold on;
set(gca,'ColorOrderIndex',3)
hplot = plot(plt.t, plt.toolz);
set(hplot, 'LineWidth', 2);
hplot = yline(plt.goal(3,end), 'LineWidth', 3, 'LineStyle','--');
ylim([-40, -39]);
xlabel('time [s]')
ylabel('position of the tool [m]')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end
legend('z_{tool}','z_{rock}');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'z_tool',suffix,'.jpg'))



fig = figure();hold on;
for j = 1:7
    subplot(3,3,j)
    set(gca,'ColorOrderIndex',3)
    hplot = plot(plt.t, plt.q(j,:));
    ylim([-3, 3])
    set(hplot, 'LineWidth', 2);
    %hplot = yline(plt.goal(3,end), 'LineWidth', 3, 'LineStyle','--');
    xlabel('time [s]')
    ylabel(strcat('q_',num2str(j), ' [rad]'))
    for i = 1:length(mission_transitions)
        xline(mission_transitions(i),':');
    end
    hplot = yline(plt.jlmin(j),'r--');
    set(hplot, 'LineWidth', 2);
    hplot = yline(plt.jlmax(j),'r--');
    set(hplot, 'LineWidth', 2);
end
saveas(gcf,strcat(dir,'q',suffix,'.jpg'))

% Activation of joint limit task
fig = figure();hold on;
set(gca,'ColorOrderIndex',3)
hplot = plot(plt.t, plt.a(1:7,:));
set(hplot, 'LineWidth', 2);
xlabel('time [s]')
ylabel('activation of joint limits task')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end

legend('al_1','al_2','al_3','al_4','al_5','al_6','al_7');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'al',suffix,'.jpg'))


q1_range = -4:0.01:4;
a_jl1 = []
for i = q1_range
a_jl1 = [a_jl1, DecreasingBellShapedFunction( plt.jlmin(1), plt.jlmin(1) + 0.1, 0, 1, i ) ...
+ IncreasingBellShapedFunction( plt.jlmax(1) - 0.1,plt.jlmax(1), 0, 1, i)];
end

fig = figure();hold on;
    set(gca,'ColorOrderIndex',3)
    hplot = plot(q1_range, a_jl1);
    ylim([-1.5, 2.5])
    set(hplot, 'LineWidth', 2);
    xline(plt.jlmin(1),':',"min angle");
    xline(plt.jlmax(1),':',"max angle");
    %hplot = yline(plt.goal(3,end), 'LineWidth', 3, 'LineStyle','--');
    xlabel('q1 [rad]')
    ylabel(strcat('a'))
saveas(gcf,strcat(dir,'act_graph',suffix,'.jpg'))


end