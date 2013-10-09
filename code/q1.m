% PART 1
% speed
ts = 5 % translation
ws = 5 % angular

[X, Y] = meshgrid(-5:4, ones(1,10)*-1);
% e.g. Z(1, 5) = Z value at X = 5, Y = 1
Z = repmat(1:10, 10, 1)';
t = [ 0; 0; ts ];
w = [ 0; 0; 0 ];
figure(1)
draw_dynamic(X, Y, Z, t, w);

% PART 2
[X, Y] = meshgrid(-5:4, -5:4);
Z = ones(10)*2;
t = [ ts ; 0 ; 0 ];
w = [ 0 ; 0 ; 0 ];
figure(2)
draw_dynamic(X, Y, Z, t, w);

% PART 3
[X, Y] = meshgrid(-5:4, ones(1,10)*-1);
% e.g. Z(1, 5) = Z value at X = 5, Y = 1
Z = repmat(1:10, 10, 1)';
t = [ 0 ; ts * cos(pi / 4) ; ts * sin(pi / 4) ];
w = [ 0 ; 0 ; 0 ];
figure(3)
draw_dynamic(X, Y, Z, t, w);

% PART 4
[X, Y] = meshgrid(-5:4, -5:4);
Z = ones(10)*2;
t = [ 0; 0 ; 0 ];
w = [ 1 / sqrt(2) ; 1 / sqrt(2) ; 0 ];
figure(4)
draw_dynamic(X, Y, Z, t, w);
