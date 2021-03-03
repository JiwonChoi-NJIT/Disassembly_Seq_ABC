INPUT = [
    2 3 3 2 3 4 2 1 3 2;
    3 1 1 5 6 6 4 2 6 4;
    1 0 0 1 0 0 1 1 0 1;
    0 1 1 2 1 1 2 0 1 0;
    1 2 2 2 3 3 2 3 3 3];

% contents are ordered from A to J

% first row = dt_j

% second row (Direction)
% +x = 1
% -x = 2
% +y = 3
% -y = 4
% +z = 5
% -z = 6

% Third row (Method)
% D = 1
% N = 0

% Fourth row (Demand)
% No-demand = 0
% Reuse     = 1
% Recycle   = 2

% Fifth row (Material)
% A = 1
% S = 2
% P = 3
