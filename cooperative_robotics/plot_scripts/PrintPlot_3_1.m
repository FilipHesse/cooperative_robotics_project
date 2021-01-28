function [ ] = PrintPlot_3_1( plt )
% some predefined plots
% you can add your own
dir='./plot_output/3_1/';
suffix='';

mission_transitions = []
phases = [1 2 3 4 5 6 7 8 9 10];
for phase = phases
    mission_transitions = [mission_transitions, plt.t(find(plt.mission_phase==phase,1))]
end

% % Plot complete pose and goals
fig = figure();hold on;;
hplot = plot(plt.t, plt.p);
set(gca,'ColorOrderIndex',1)
set(hplot, 'LineWidth', 2);
set(hplot(4), 'LineWidth', 3);
hplot = plot(plt.t, plt.goal, '--');
set(hplot, 'LineWidth', 3);
set(hplot(4), 'LineWidth', 4);
xlabel('time [s]')
ylabel('positions in [m], angles in [rad]')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end


lgd = legend('x','y','z','roll','pitch','yaw','x goal','y goal','z goal','roll goal','pitch goal','yaw goal');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'pose_w',suffix,'.jpg'))


% % Plot positions and goals
fig = figure();hold on;;
hplot = plot(plt.t, plt.p(1:3,:));
set(gca,'ColorOrderIndex',1)
set(hplot, 'LineWidth', 2);
%set(hplot(4), 'LineWidth', 3);
hplot = plot(plt.t, plt.goal(1:3,:), '--');
set(hplot, 'LineWidth', 3);
%set(hplot(4), 'LineWidth', 4);
ylim([8 11])
xlabel('time [s]')
ylabel('positions in [m], angles in [rad]')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end

lgd = legend('x','y','z','x goal','y goal','z goal');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'pose_x',suffix,'.jpg'))


% % Plot positions and goals
fig = figure();hold on;;
hplot = plot(plt.t, plt.p(1:3,:));
set(gca,'ColorOrderIndex',1)
set(hplot, 'LineWidth', 2);
%set(hplot(4), 'LineWidth', 3);
hplot = plot(plt.t, plt.goal(1:3,:), '--');
set(hplot, 'LineWidth', 3);
%set(hplot(4), 'LineWidth', 4);
ylim([37 39])
xlabel('time [s]')
ylabel('positions in [m], angles in [rad]')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end

lgd = legend('x','y','z','x goal','y goal','z goal');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'pose_y',suffix,'.jpg'))


% % Plot positions and goals
fig = figure();hold on;;
hplot = plot(plt.t, plt.p(1:3,:));
set(gca,'ColorOrderIndex',1)
set(hplot, 'LineWidth', 2);
%set(hplot(4), 'LineWidth', 3);
hplot = plot(plt.t, plt.goal(1:3,:), '--');
set(hplot, 'LineWidth', 3);
%set(hplot(4), 'LineWidth', 4);
ylim([-40 -35])
xlabel('time [s]')
ylabel('positions in [m], angles in [rad]')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end

lgd = legend('x','y','z','x goal','y goal','z goal');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'pose_z',suffix,'.jpg'))

% % Plot positions and goals
fig = figure();hold on;;
hplot = plot(plt.t, plt.p);
set(gca,'ColorOrderIndex',1)
set(hplot, 'LineWidth', 2);
%set(hplot(4), 'LineWidth', 3);
hplot = plot(plt.t, plt.goal, '--');
set(hplot, 'LineWidth', 3);
%set(hplot(4), 'LineWidth', 4);
ylim([-0.2 0.6])
xlabel('time [s]')
ylabel('angles in [rad]')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end

lgd = legend('x','y','z','roll','pitch','yaw','x goal','y goal','z goal','roll goal','pitch goal','yaw goal');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'pose_rpy',suffix,'.jpg'))

% % Plot activations of relevant tasks
% fig = figure();hold on;;
% hplot = plot(plt.t, plt.a(9:13,:),'--');
% ylim([0 1])
% set(hplot(1), 'LineWidth', 1);
% set(hplot(2), 'LineWidth', 1.5);
% set(hplot(3), 'LineWidth', 2);
% set(hplot(4), 'LineWidth', 2.5);
% set(hplot(5), 'LineWidth', 3);
% xlabel('time [s]')
% ylabel('activation')
% for i = 1:length(mission_transitions)
%     xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
% end

% lgd = legend('a\_ha','a\_min\_ alt','a\_v\_ang','a\_v\_lin','a\_land');
% lgd.Location = 'eastoutside';
% saveas(gcf,strcat(dir,'act',suffix,'.jpg'))

% % Plot altitude over the ground
fig = figure();hold on;;
hplot = plot(plt.t, plt.alt);
set(hplot, 'LineWidth', 2);
xlabel('time [s]')
ylabel('altitude over ground [m]')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end

lgd = legend('altitude');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'alt',suffix,'.jpg'))

% % Plot xi (target misalignment)
fig = figure();hold on;;
hplot = plot(plt.t, plt.xi);
set(hplot, 'LineWidth', 2);
xlabel('time [s]')
ylabel('\xi [rad]')
for i = 1:length(mission_transitions)
    xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
end

lgd = legend('\xi');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'xi',suffix,'.jpg'))


end