function dump2file(data, show)

    run = int2str(data.alg.runs / data.const.pps);

    f = fopen(strcat(data.const.path, 'output_', run, '.txt'), 'w');
    algorithm.debug.printData(data, f);
    fclose(f);

    save(strcat(data.const.path, 'data_', run, '.mat'), 'data', '-v7', '-mat');

    algorithm.debug.plot.plotError(data);
    print(gcf,strcat(data.const.path, 'error_', run, '.png'),'-dpng');

    if (size(data.in.Xi, 2) == 2)

        algorithm.debug.plot.plotRegion(data);
        print(gcf,strcat(data.const.path, 'region_', run, '.png'),'-dpng');
    end

    if (data.const.etaEps < 1)

        algorithm.debug.plot.plotEta(data);
        print(gcf,strcat(data.const.path, 'eta_', run, '.png'),'-dpng');
    end

    if (data.const.rollback)

        algorithm.debug.plot.plotRollback(data);
        print(gcf,strcat(data.const.path, 'rollback_', run, '.png'),'-dpng');
    end

    if (data.const.rollback || data.const.etaEps < 1)

        algorithm.debug.plot.plotAll(data);
        print(gcf,strcat(data.const.path, 'all_', run, '.png'),'-dpng');
    end

    if (show)
        set(gcf, 'visible', 'on');
        drawnow('expose');
    else
        set(gcf, 'visible', 'off');
    end
end

