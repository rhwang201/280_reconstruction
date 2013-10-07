function [] = plot_3d(points)
    figure(2)
    scatter3(points(:,1), points(:,2), points(:,3));
