function error = getError(data)

    error = abs(norm(data.in.S(input, :)' - data.alg.V{end}(2 : end)));
end

