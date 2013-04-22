function y = d_sigmoid(x)

        y = 2 * exp(2*x) ./ (1 + exp(2*x)).^2;
end

