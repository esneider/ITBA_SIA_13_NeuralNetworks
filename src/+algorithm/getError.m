function error = getError(input, data)

    error = abs(norm(data.in.S(input, :)' - data.alg.V{end}(2 : end)));
end

