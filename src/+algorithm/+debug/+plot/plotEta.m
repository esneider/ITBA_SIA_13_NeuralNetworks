function plotError(data)

    clf();

    hold on;

    eta = plot(data.alg.etas(10 : end));

    legend(eta, {'eta value per epoch'});

    hold off;

    drawnow('expose');
end

