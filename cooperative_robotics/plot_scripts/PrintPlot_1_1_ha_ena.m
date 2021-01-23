function [ ] = PrintPlot_1_1_ha_ena( plt )
% some predefined plots
% you can add your own
dir='./plot_output/1_1/'
suffix='_ha_ena'

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
hplot = plot(plt.t, plt.p);
ylim([-38.5,-35.5])
xlabel('time [s]')
ylabel('position [m]')
set(hplot, 'LineWidth', 2);
lgd = legend('x','y','z','roll','pitch','yaw');
lgd.Location = 'eastoutside';
saveas(gcf,strcat(dir,'pose_z_w',suffix,'.jpg'))

figure();
hplot = plot(plt.t, plt.rho);
%ylim([-38.5,-35.5])
xlim([0,5])
xlabel('time [s]')
ylabel('rho [rad]')
set(hplot, 'LineWidth', 2);
lgd = legend('rho');
lgd.Location = 'eastoutside';
grid on
saveas(gcf,strcat(dir,'rho_w',suffix,'.jpg'))

figure();
hplot = plot(plt.t, plt.a(9,:));
%ylim([-38.5,-35.5])
xlim([0,5])
xlabel('time [s]')
ylabel('activation')
set(hplot, 'LineWidth', 2);
lgd = legend('Aha');
lgd.Location = 'eastoutside';
grid on
saveas(gcf,strcat(dir,'aha_w',suffix,'.jpg'))


end