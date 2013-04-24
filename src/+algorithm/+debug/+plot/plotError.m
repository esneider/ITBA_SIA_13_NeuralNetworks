function plotError(data)

    clf();

    hold on;

    err = plot(data.alg.errors(10 : end));

    legend(err, {'mean sqared error per epoch'});

    hold off;

    drawnow('expose');
end

