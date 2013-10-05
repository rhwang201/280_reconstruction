% Create 3D points
[X, Y] = meshgrid(-5:5, repmat([-1], 1, 11));
Z = repmat([1:11].', 1, 11);

% Projective Geometry
% x = fX/Z, y = fY/Z
f = 1;
x = f .* X ./ Z;
y = f .* Y ./ Z;

% Translation along Z axis
% [u; v] = 1/Z [xt_z; yt_z]
tz = 10;
U = tz .* x ./ Z;
V = tz .* y ./ Z;

quiver(x, y, U, V);
