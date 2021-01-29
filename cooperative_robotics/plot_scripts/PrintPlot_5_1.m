function [ ] = PrintPlot_5_1( plt )
% some predefined plots
% you can add your own
dir='./plot_output/5_1/';
suffix='';

mission_transitions = [];
phases = [1 2 3 4 5 6 7 8 9 10];
for phase = phases
    mission_transitions = [mission_transitions, plt.t(find(plt.mission_phase==phase,1))];
end


% fig = figure(); hold on;
% hplot = plot(plt.t, plt.a(17:20,:));
% set(hplot,{'LineWidth'}, {4,2,2,2}', {'LineStyle'}, {'--','-','-','--'}');
% for i = 1:plt.Nphases
%     xline(plt.change_phase(i), '--r', ['Phase ',num2str(i)],'LabelVerticalAlignment', 'middle','FontSize',12);
% end
% if plt.goalreached
%     xline(plt.change_phase(plt.Nphases+1), '--r', 'Goal reached','LabelVerticalAlignment', 'middle','FontSize',12);
% end
% legend({'Aoptq_1', 'Aoptq_2', 'Aoptq_3', 'Aoptq_4'},'FontSize',16);
% xlabel('Time(s)','FontSize',14),ylabel('Activation value','FontSize',14);
% title('\fontsize{16}Activation function of arm preferred shape');
% ylim([0 1])
% saveas(gcf,strcat(dir,'a_funct',suffix,'.jpg'))

% fig = figure();hold on;
% hplot = plot(plt.t, plt.toolx);
% set(gca,'ColorOrderIndex',1);
% set(hplot, 'LineWidth', 2);
% hplot = yline(plt.pref_shape(1,end), 'LineWidth', 3, 'LineStyle','--');
% set(hplot, 'LineWidth', 3);
% ylim([11.5, 12.5]);
% xlabel('time [s]')
% ylabel('position of the tool [m]')
% for i = 1:length(mission_transitions)
%     xline(mission_transitions(i),':',strcat("Phase ",int2str(i)));
% end
% 
% 
% lgd.Location = 'eastoutside';
% saveas(gcf,strcat(dir,'x_tool',suffix,'.jpg'))





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


end