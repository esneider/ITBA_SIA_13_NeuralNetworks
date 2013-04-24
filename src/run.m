params = struct('runs', 5000, 'debug', '', 'path', 'output/', 'rollback', false, 'etaEps', 1);

algorithm.main([-1 -1; -1 1; 1 -1; 1 1; 0 1; 0 -1; 1 0; -1 0], [0; 0; 0; 0; 1; 1; 1; 1], [4], params);
% algorithm.main([-1 -1; -1 1; 1 -1; 1 1; 0 1; 0 -1; 1 0; -1 0], [0; 0; 0; 0; 1; 1; 1; 1], [2], params);
