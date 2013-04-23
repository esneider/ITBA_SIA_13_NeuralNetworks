function y = sigmoidLog(beta, x)

    y = 1 ./ (1 + exp(-2 * beta * x));
end

