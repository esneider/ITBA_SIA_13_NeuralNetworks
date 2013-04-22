function y = d_sigmoid(beta, x)

    y = 2 * exp(2 * beta * x) ./ (1 + exp(2 * beta * x)) .^ 2;
end

