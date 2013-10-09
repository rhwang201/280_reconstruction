function [] = plot_3d(points, name, t2)
    figure;
    hold on;
    title(sprintf('Reconstructed point cloud for %s', name));

    % Plot point cloud
    scatter3(points(:,1), points(:,2), points(:,3), 'blue');

    % Plot camera centers
    scatter3([0, t2(1,1)], [0, t2(2,1)], [0, t2(3,1)], 'red');

    legend('Points', 'Camera Centers');

    hold off;
end
