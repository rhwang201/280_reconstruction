function[R, t] = find_rotation_translation(E)
    t = cell(1,2);
    R = cell(1,2);

    [U, S, V] = svd(E);
    W = [0, -1, 0; 1, 0, 0; 0, 0, 1];

    R_mat = U * W' * V';
    t{1,1} =  U(:,3);
    t{1,2} = -U(:,3);

    R{1,1} = R_mat;

	W = inv(W);
	R_mat = U * W' * V';

    R{1,2} = R_mat;
end
