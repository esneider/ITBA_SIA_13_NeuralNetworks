function data = adaptativeEta(data)

    data.alg.errors = [data.alg.errors; 0.5 * sum(data.alg.errorForInputs)];
    data.alg.etas = [data.alg.etas; data.alg.eta];
    data.alg.rollbacks = [data.alg.rollbacks; data.alg.rollback / 1000];

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

        if (data.const.rollback)

            data.alg.momentum = 0;
        end

        if (delta > data.const.etaEps)

            data.alg.eta = data.alg.eta * (1 - data.const.etaDec);

            if (data.const.rollback)

                data.alg.errors(end) = data.alg.errors(end - 1);
                data.alg.W = data.alg.lastW;
                data.alg.rollback = data.alg.rollback + 1;
            end
        end
    end

    data.alg.lastW = data.alg.W;
end

