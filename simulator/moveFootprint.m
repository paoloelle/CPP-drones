function centered_footprint = moveFootprint(ref_x, ref_y, robot_footprint)


    % compute the center of the robot footprint
    [footprint_centerX, footprint_centerY] = centroid(robot_footprint);

    % Calculate the translation vector
    dx = ref_x - footprint_centerX;
    dy = ref_y - footprint_centerY;

    % Translate the polyshape to the desired center point
    centered_footprint = translate(robot_footprint, dx, dy);

end