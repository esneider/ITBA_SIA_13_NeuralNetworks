function plotInfo(plots, name)

    clf();

    hold on;

    ret = [];
    msg = {};

    colors = {'b', 'g', 'r'};

    for i = 1 : length(plots)

        ret = [ret, plot(plots{i}{1}, colors{i})];
        msg = [msg, {plots{i}{2}}];
    end

    legend(ret, msg);

    hold off;

    drawnow('expose');

    print(gcf, strcat(name, '.png'),'-dpng');
end

