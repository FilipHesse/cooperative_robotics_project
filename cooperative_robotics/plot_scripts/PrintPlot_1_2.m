function [ ] = PrintPlot_1_2( plt )
% some predefined plots
% you can add your own
dir='./plot_output/1_2/';
suffix='_1m';

% % Plot complete pose and goals
% fig = figure();hold on;;
% hplot = plot(plt.t, plt.p);
% set(gca,'ColorOrderIndex',1)
% set(hplot, 'LineWidth', 2);
% set(hplot(4), 'LineWidth', 3);
% hplot = plot(plt.t, plt.goal, '--');
% set(hplot, 'LineWidth', 3);
% set(hplot(4), 'LineWidth', 4);
% xlabel('time [s]')
% ylabel('positions in [m], angles in [rad]')

% lgd = legend('x','y','z','roll','pitch','yaw','x goal','y goal','z goal','roll goal','pitch goal','yaw goal');
% lgd.Location = 'eastoutside';
% saveas(gcf,strcat(dir,'pose_w',suffix,'.jpg'))

% % Plot positions and goals
fig = figure();hold on;;
hplot = plot(plt.t, plt.p(1:3,:));
set(gca,'ColorOrderIndex',1)
set(hplot, 'LineWidth', 2);
%set(hplot(4), 'LineWidth', 3);
hplot = plot(plt.t, plt.goal(1:3,:), '--');
set(hplot, 'LineWidth', 3);
%set(hplot(4), 'LineWidth', 4);
xlabel('time [s]')
ylabel('positions in [m], angles in [rad]')

lgd = legend('x','y','z','x goal','y goal','z goal');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'pose',suffix,'.jpg'))

% % Plot positions and goals
fig = figure();hold on;;
hplot = plot(plt.t, plt.p(1:3,:));
set(gca,'ColorOrderIndex',1)
set(hplot, 'LineWidth', 2);
%set(hplot(4), 'LineWidth', 3);
hplot = plot(plt.t, plt.goal(1:3,:), '--');
set(hplot, 'LineWidth', 3);
%set(hplot(4), 'LineWidth', 4);
ylim([48.5 50.5])
xlabel('time [s]')
ylabel('positions in [m], angles in [rad]')

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
ylim([-15 15])
xlabel('time [s]')
ylabel('positions in [m], angles in [rad]')

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
ylim([-34 -30])
xlabel('time [s]')
ylabel('positions in [m], angles in [rad]')

lgd = legend('x','y','z','x goal','y goal','z goal');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'pose_z',suffix,'.jpg'))

% Plot activation of minimal altitude task
fig = figure();hold on;;
hplot = plot(plt.t, plt.a(10,:));
ylim([0 1])
set(hplot, 'LineWidth', 2);
xlabel('time [s]')
ylabel('activation')
lgd = legend('a\_min\_ alt');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'a_min_alt',suffix,'.jpg'))

% Plot altitude over the ground
fig = figure();hold on;;
hplot = plot(plt.t, plt.alt);
set(hplot, 'LineWidth', 2);
hplot = plot(plt.t, plt.min_alt,'--');
set(hplot, 'LineWidth', 3);
hplot = plot(plt.t, plt.min_alt + plt.target_distance_above_min_alt,'--');
set(hplot, 'LineWidth', 3);
xlabel('time [s]')
ylabel('altitude over ground [m]')
lgd = legend('altitude','minimal altitude','target altitude');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'alt',suffix,'.jpg'))


end