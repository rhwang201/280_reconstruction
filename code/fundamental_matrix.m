function [F, res_err] = fundamental_matrix(matches)
% Computes the fundamental matrix, given matches, a Nx4 matrix.

[N, ~] = size(matches);

% Compute first transformation.
first_image_points = matches(:, 1:2);
first_x = first_image_points(:, 1);
first_y = first_image_points(:, 2);

mu_1 = mean(first_image_points,1)
sigma_1 = std(first_image_points)

sx = 1/sigma_1(1);
sy = 1/sigma_1(2);
T_1 = [sx 0 (-mu_1(1,1)*sx); 0 sy (-mu_1(1,2)*sy); 0 0 1]

% Compute second transformation.
second_image_points = matches(:, 3:4);
second_x = second_image_points(:, 1);
second_y = second_image_points(:, 2);

mu_2 = mean(second_image_points,1)
sigma_2 = std(second_image_points)

sx = 1/sigma_2(1);
sy = 1/sigma_2(2);
T_2 = [sx 0 (-mu_2(1,1)*sx); 0 sy (-mu_2(1,2)*sy); 0 0 1]

% Homogonize and normalize points.
first_homogonized = [first_image_points repmat([1], N, 1)].';
second_homogonized = [second_image_points repmat([1], N, 1)].';

first_normalized = T_1 * first_homogonized;
second_normalized = T_2 * second_homogonized;

% Construct A.
A = zeros(N, 9);
for i = 1:N
    x_1 = first_normalized(1, i);
    y_1 = first_normalized(2, i);

    x_2 = second_normalized(1, i);
    y_2 = second_normalized(2, i);

    A(i, 1) = x_1 * x_2;
    A(i, 2) = y_1 * x_2;
    A(i, 3) = x_2;
    A(i, 4) = x_1 * y_2;
    A(i, 5) = y_1 * y_2;
    A(i, 6) = y_2;
    A(i, 7) = x_1;
    A(i, 8) = y_1;
    A(i, 9) = 1;
end


% Find right singular vector of A corresponding to smallest singular value
% to obtain F_est.
[U, S, V] = svd(A);
F_est = vec2mat(V(:, end), 3)


% Find F' of rank 2 by finding F_est = USV^T, F' = US'V^T,
% where S' = [1 0 0; 0 1 0; 0 0 0].
[U, S, V] = svd(F_est);
S_prime = diag([S(1,1) S(2,2) 0]);
F_normalized = U * S_prime * V.';


% Denormalize.
F = T_2.' * F_normalized * T_1;


% Compute mean squared distance between points in their two images and their
% corresponding epipolar lines. TODO wat
res_err = 0;


% Verify F is correct. TODO
rank(F_est);
rank(F);
second_homogonized(:, 1).' * F * first_homogonized(:, 1);
second_homogonized(:, 2).' * F * first_homogonized(:, 2);
