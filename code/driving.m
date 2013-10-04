% [u; v] = 1/Z [xt_z; yt_z]

[X, Y] = meshgrid(-10:.5:10, -10:.5:10);
Z = [repmat([1:20].', 1, 41); repmat([inf], 21, 41)];
tz = 50;
U = tz * X ./ Z;
V = tz * Y ./ Z;
quiver(X, Y, U, V);
