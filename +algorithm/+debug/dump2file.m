function dump2file(data, show)

    run = int2str(data.alg.runs / 100);

    f = fopen(strcat(data.const.path, 'output_', run, '.txt'), 'w');
    algorithm.debug.printData(data, f);
    fclose(f);

    save(strcat(data.const.path, 'data_', run, '.mat'), 'data', '-v7', '-mat');

    algorithm.debug.plot.plotRegion(data);
    print(gcf,strcat(data.const.path, 'region_', run, '.png'),'-dpng');

    algorithm.debug.plot.plotEta(data);
    print(gcf,strcat(data.const.path, 'eta_', run, '.png'),'-dpng');

    algorithm.debug.plot.plotError(data);
    print(gcf,strcat(data.const.path, 'error_', run, '.png'),'-dpng');

    if (show)
        set(gcf, 'visible', 'on');
        drawnow('expose');
    else
        set(gcf, 'visible', 'off');
    end
end

