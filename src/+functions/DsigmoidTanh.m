function y = DsigmoidTanh(beta, x)

    y = beta * sech(beta * x) .^ 2;
end

