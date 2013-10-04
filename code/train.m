% [u; v] = 1/Z [-t_x; 0]

[X, Y] = meshgrid(-10:2:10, -10:2:10);
Z = [repmat([1:5].', 1, 11); repmat([inf], 6, 11)];
tx = 10;
U = -tx ./ Z;
V = tz * 0 ./ Z;
quiver(X, Y, U, V);
