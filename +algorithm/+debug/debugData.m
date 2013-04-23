function debugData(data)

    disp('Constants');
    disp('  bias:');
    disp(data.const.bias);
    disp('  runs:');
    disp(data.const.runs);
    disp('  eta:');
    disp(data.const.eta);
    disp('  momentum:');
    disp(data.const.momentum);
    disp('  beta:');
    disp(data.const.beta);
    disp('  g:');
    disp(data.fun.g);
    disp('  dg:');
    disp(data.fun.dg);

    disp('Input');
    disp('  S:');
    disp(data.in.S);
    disp('  Xi:');
    disp(data.in.Xi);
    disp('  arch:');
    disp(data.in.arch);

    disp('Algorithm variables');
    disp('  M:');
    disp(data.alg.M);
    disp('  W:');
    celldisp(data.alg.W);
    disp('  V:');
    celldisp(data.alg.V);
    disp('  h:');
    celldisp(data.alg.h);
    disp('  dW:');
    celldisp(data.alg.dW);

end

