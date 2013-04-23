function plotRegion(data)

    if (size(data.in.Xi, 2) ~= 2)
        return;
    end

    if (size(data.in.S, 2) ~= 1)
        return;
    end

    old_eqn = {'-1'; 'x'; 'y'};

    for m = 2 : data.alg.M

        new_eqn = {'-1'};

        for i = 1 : size(data.alg.W{m}, 1)

            term = '0';

            for j = 1 : size(data.alg.W{m}, 2)

                term = strcat(term, '+(', num2str(data.alg.W{m}(i,j)), '*(', old_eqn{j}, '))');
            end

            term = strcat('0.5*tanh(', num2str(data.const.beta), '*(', term, '))+0.5');

            new_eqn{i+1} = term;
        end

        old_eqn = new_eqn;
    end

    eqn = strcat(old_eqn{2}, '=0.5');

    clf();

    hold on;

    border = ezplot(eqn, [-2 2 -2 2]);

    for input = 1 : size(data.in.Xi, 1)
        if (data.in.S(input) > 0.5)
            one = plot(data.in.Xi(input, 1), data.in.Xi(input, 2), 'r.', 'MarkerSize', 20);
        else
            zero = plot(data.in.Xi(input, 1), data.in.Xi(input, 2), 'b.', 'MarkerSize', 20);
        end
    end

    plot([-2 2], [0 0], 'k', [0 0], [-2 2], 'k');

    title('');

    legend([one, zero, border], {'expected 1', 'expected 0', 'frontier at 0.5'});

    hold off;

    drawnow('expose');
end

