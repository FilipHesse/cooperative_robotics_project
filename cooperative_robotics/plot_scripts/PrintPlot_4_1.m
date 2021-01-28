function [ ] = PrintPlot_4_1( plt )
% some predefined plots
% you can add your own
dir='./plot_output/4_1/';
suffix='';

mission_transitions = [];
phases = [1 2 3 4 5 6 7 8 9 10];
for phase = phases
    mission_transitions = [mission_transitions, plt.t(find(plt.mission_phase==phase,1))];
end


fig = figure();hold on;;
hplot = plot(plt.t, plt.v_p_dot);
set(hplot, 'LineWidth', 2);
ylim([-0.03, 0.03])
xlabel('time [s]')
ylabel('velocities of uvms [m/s²]')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end

legend('xdot', 'ydot','zdot','omega_x','omega_y','omega_z');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'xdot',suffix,'.jpg'))


% % Plot altitude over the ground
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

% % Plot altitude over the ground
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

end