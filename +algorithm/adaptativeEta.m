function data = adaptativeEta(data)

    data.alg.errors = [data.alg.errors; 0.5 * sum(data.alg.errorForInputs)];
    data.alg.etas = [data.alg.etas; data.alg.eta];

    if (length(data.alg.errors) < 2)

        data.alg.lastW = data.alg.W;

        return;
    end

    delta = data.alg.errors(end) - data.alg.errors(end - 1);

    if (delta < -data.const.etaEps)

        data.alg.goodSteps = data.alg.goodSteps + 1;
        data.alg.momentum = data.const.momentum;

        if (data.alg.goodSteps >= data.const.etaSteps)

            data.alg.goodSteps = 0;
            data.alg.eta = data.alg.eta + data.const.etaInc;

        end

    else

        data.alg.goodSteps = 0;
        data.alg.momentum = 0;

        if (delta > data.const.etaEps)

            data.alg.eta = data.alg.eta * (1 - data.const.etaDec);
            data.alg.errors = data.alg.errors(1 : end - 1);
            data.alg.W = data.alg.lastW;
        end
    end

    data.alg.lastW = data.alg.W;
end

