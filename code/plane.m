% [u; v] = 1/sqrt(2)Z [xt; (y-1)t]

[X, Y] = meshgrid(-10:1:10, -10:1:10);
Z = [repmat([1:10].', 1, 21); repmat([inf], 11, 21)];
t = 10;
U = t * X ./ (sqrt(2) * Z);
V = t * (Y - 1) ./ (sqrt(2) * Z);
quiver(X, Y, U, V);
