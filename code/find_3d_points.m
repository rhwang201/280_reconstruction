function [points err] = find_3d_points(P1, P2, matches)

[N, ~] = size(matches);
A = zeros(4, 4);

points = zeros(N, 3);
errs = zeros(1,2*N);

for i = 1:N
    x_1 = matches(i, 1:2);
    x_2 = matches(i, 3:4);

    % P1
    % x_1(1)
    A(1, :) = [P1(3,1)*x_1(1)-P1(1,1), P1(3,2)*x_1(1)-P1(1,2), ...
                   P1(3,3)*x_1(1)-P1(1,3), P1(3,4)*x_1(1)-P1(1,4)];
    % x_1(2)
    A(2, :) = [P1(3,1)*x_1(2)-P1(2,1), P1(3,2)*x_1(2)-P1(2,2), ...
                   P1(3,3)*x_1(2)-P1(2,3), P1(3,4)*x_1(2)-P1(2,4)];

    % P2
    % x_2(1)
    A(3, :) = [P2(3,1)*x_2(1)-P2(1,1), P2(3,2)*x_2(1)-P2(1,2), ...
                   P2(3,3)*x_2(1)-P2(1,3), P2(3,4)*x_2(1)-P2(1,4)];
    % x_2(2)
    A(4, :) = [P2(3,1)*x_2(2)-P2(2,1), P2(3,2)*x_2(2)-P2(2,2), ...
                   P2(3,3)*x_2(2)-P2(2,3), P2(3,4)*x_2(2)-P2(2,4)];

    % want A*X = 0, with constraint that ||X|| = 1
    [U, S, V] = svd(A);

    point = V(:, end);
    unhomo_point = point(1:3, 1) ./ point(4, 1);
    points(i, :) = unhomo_point.';

    % Compute reconstruction error.
    proj_1 = P1 * point;
    proj_1 = proj_1(1:2, :) ./ proj_1(3,1);

    proj_2 = P2 * point;
    proj_2 = proj_2(1:2, :) ./ proj_2(3,1);

    % Compute distances.
    errs(1+i*2) = sqrt(sum((x_1.' - proj_1).^2));
    errs(2+i*2) = sqrt(sum((x_2.' - proj_2).^2));
end

err = mean(errs);
end
