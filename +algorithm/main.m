% 1; % script file

function main(Xi, S, arch)

    data = algorithm.init(Xi, S, arch);

    for run = 1 : data.const.runs

        for input = 1 : size(data.in.Xi, 1)

            data = algorithm.evalNetwork(input, data);
            data = algorithm.backPropagate(input, data);
        end
        % disp('---');
        % for input = 1 : size(data.in.Xi, 1)
        %     % disp(data.in.Xi(input,:));
        %     disp(algorithm.evalNetwork(input, data).alg.V{data.max.M}(2));
        % end
    end

    % algorithm.debugData(data);

    % data.alg.W{2} = [-2 -2 4.3; .1 9.2 8.8];
    % data.alg.W{3} = [.8 -4.5 5.3];

    for input = 1 : size(data.in.Xi, 1)
        disp(data.in.Xi(input,:));
        disp(algorithm.evalNetwork(input, data).alg.V{data.max.M}(2));
    end
end

