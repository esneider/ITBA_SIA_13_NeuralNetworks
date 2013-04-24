function plotError(data)

    clf();

    hold on;

    rb = plot(data.alg.rollbacks(10 : end));

    legend(rb, {'accumulated rollbacks / 1000'});

    hold off;

    drawnow('expose');
end

