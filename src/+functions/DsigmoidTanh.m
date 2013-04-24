function y = DsigmoidTanh(beta, x)

    y = 0.5 * beta * sech(beta * x) .^ 2;
end

