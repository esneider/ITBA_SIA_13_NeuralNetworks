function data = adaptativeEta(input, data)

    error = algorithm.getError(input, data);

    if data.alg.lastError < 0

        data.alg.lastError = error;
        data.alg.lastW = data.alg.W;
        return;
    end

    delta = error - data.alg.lastError;

    if delta < -data.const.etaEps

        data.alg.goodSteps = data.alg.goodSteps + 1;
        data.alg.momentum = data.const.momentum;

        data.alg.totalGoodSteps = data.alg.totalGoodSteps + 1;

        if data.alg.goodSteps >= data.const.etaSteps

            data.alg.goodSteps = 0;
            data.alg.eta = data.alg.eta + data.const.etaInc;

        end

    else

        data.alg.goodSteps = 0;

        if data.const.rollback

            data.alg.momentum = 0;
        end

        if delta > data.const.etaEps

            data.alg.eta = data.alg.eta * (1 - data.const.etaDec);

            if data.const.rollback

                error = data.alg.lastError;
                data.alg.W = data.alg.lastW;
                data.alg.rollbacks = data.alg.rollbacks + 1;
            end
        end
    end

    data.alg.lastError = error;
    data.alg.lastW = data.alg.W;
end

