function[R, t] = find_rotation_translation(E)
    t = cell(4);
    R = cell(4);

	[U, S, V] = svd(E);
	W = [0, -1, 0; 1, 0, 0; 0, 0, 1];

	R = U * W' * V'
	t = V * W * S * V'
	t_vect = [t(3, 2), -t(3, 1), t(2, 1)]'

    t{1} = t_vect;
    t{2} = -t_vect;

    R{1} = R_mat;

	W = inv(W);
	R = U * W' * V'
	t = V * W * S * V'
	t_vect = [t(3, 2), -t(3, 1), t(2, 1)]'

    t{3} = t_vect;
    t{4} = -t_vect;

    R{2} = R_mat;
end
