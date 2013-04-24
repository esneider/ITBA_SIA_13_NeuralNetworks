function plotError(data)

    clf();

    hold on;

    err = plot(data.alg.etas(10 : end));

    legend(err, {'eta value per epoch'});

    hold off;

    drawnow('expose');
end

