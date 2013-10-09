function draw_dynamic(X, Y, Z, t, w)
    % t, w: 3 x 1 column vectors
    % X Y Z: m x m matrices s.t. cols correspond to x values, rows to y values
    x = X ./ Z
    y = Y ./ Z
    % x y: m x m matrices
    u = zeros(size(x,2));
    v = zeros(size(y,2));
    for ix = 1:size(x,2)
        for iy = 1:size(y,2)
            cx = x(iy, ix);
            cy = y(iy, ix);
            cz = Z(iy, ix);
            trans =  (1 / cz) * [ -1 0 cx ; 0 -1 cy ] * t;
            ang   = [cx*cy -(1 + (cx*cx)) cy ; (1 + (cy*cy)) -cx*cy -cx] * w;
            u(iy,ix) = trans(1) + ang(1);
            v(iy,ix) = trans(2) + ang(2);
        end
    end
    quiver(x, y, u, v)
end
