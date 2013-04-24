function plotError(data)

    clf();

    hold on;

    err = plot(data.alg.errors(10 : end),'r');
    eta = plot(data.alg.etas(10 : end) .* 50,'b');
    rb = plot(data.alg.rollbacks(10 : end),'g');

    legend([err, eta, rb], {'mean sqared error', 'eta value * 50', 'accumulated rollbacks / 1000'});

    hold off;

    drawnow('expose');
end

