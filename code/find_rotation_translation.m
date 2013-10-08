function[R, t] = find_rotation_translation(E)
    t = cell(1,2);
    R = cell(1,2);

    [U, S, V] = svd(E);
    W = [0, -1, 0; 1, 0, 0; 0, 0, 1];

    R_mat = U * W' * V';
    t_hat = V * W * S * V';
    t_vect = [t_hat(3, 2), -t_hat(3, 1), t_hat(2, 1)]';

    t{1,1} = t_vect;
    t{1,2} = -t_vect;

    R{1,1} = R_mat;

	W = inv(W);
	R_mat = U * W' * V';

    R{1,2} = R_mat;
end
