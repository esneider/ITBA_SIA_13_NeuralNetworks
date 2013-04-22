function debugData(data)

    disp('Input');
    disp('  S:');
    disp(data.in.S);
    disp('  Xi:');
    disp(data.in.Xi);
    disp('  arch:');
    disp(data.in.arch);

    disp('Constants');
    disp('  bias:');
    disp(data.const.bias);
    disp('  runs:');
    disp(data.const.runs);
    disp('  g:');
    disp(data.fun.g);
    disp('  dg:');
    disp(data.fun.dg);

    disp('Problem constants');
    disp('  M:');
    disp(data.max.M);
    disp('  I:');
    disp(data.max.I);

    disp('Algorithm variables');
    disp('  W:');
    celldisp(data.alg.W);
    disp('  V:');
    celldisp(data.alg.V);
    disp('  h:');
    celldisp(data.alg.h);
    disp('  delta:');
    celldisp(data.alg.delta);

end

