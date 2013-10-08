% deltaz = -deltad * z^2 / (bf + deltad)
load('../data/kinect.mat');

deltad = (err * b * f) ./ (z .* (z + err));

figure(1);
hold on;
title('deltad vs deltaz');
xlabel('deltaz (cm)');
ylabel('deltad (cm)');
plot(err, deltad);
hold off;

figure(2);
hold on;
title('deltad vs z');
xlabel('z (cm)');
ylabel('deltad (cm)');
plot(z, deltad);
hold off;
