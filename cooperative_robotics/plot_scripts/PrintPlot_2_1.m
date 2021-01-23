function [ ] = PrintPlot_2_1( plt )
% some predefined plots
% you can add your own
dir='./plot_output/2_1/'
suffix=''

fig = figure();
hplot = plot(plt.t, plt.p);
xlabel('time [s]')
ylabel('positions in [m], angles in [rad]')
set(hplot, 'LineWidth', 2);
lgd = legend('x','y','z','roll','pitch','yaw');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'pose_w',suffix,'.jpg'))


figure();
hplot = plot(plt.t, plt.p);
ylim([35,38])
xlabel('time [s]')
ylabel('position [m]')
set(hplot, 'LineWidth', 2);
lgd = legend('x','y','z','roll','pitch','yaw');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'pose_y_w',suffix,'.jpg'))

figure();
hplot = plot(plt.t, plt.p);
ylim([-0.1,1.6])
xlabel('time [s]')
ylabel('angles [rad]')
set(hplot, 'LineWidth', 2);
lgd = legend('x','y','z','roll','pitch','yaw');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'pose_pitch_roll_yaw_w',suffix,'.jpg'))


figure();
hplot = plot(plt.t, plt.sensorDistance);
%ylim([-38.5,-35.5])
xlabel('time [s]')
ylabel('position [m]')
set(hplot, 'LineWidth', 2);
lgd = legend('sensor distance');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'sensor_dist',suffix,'.jpg'))




end