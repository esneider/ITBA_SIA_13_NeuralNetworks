function data = collectStatusInfo(data)

    error = algorithm.getGlobalError(data, false);

    data.info.sampleErrors = [data.info.sampleErrors; error];

    error = algorithm.getGlobalError(data, true);

    data.info.globalErrors = [data.info.globalErrors; error];

    data.info.etas = [data.info.etas; data.alg.eta];

    data.info.rollbacks = [data.info.rollbacks; data.alg.rollbacks];
end

