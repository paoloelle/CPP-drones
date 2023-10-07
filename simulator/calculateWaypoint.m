function waypoint = calculateWaypoint(target_area, robot_footprint)

[x_lim_targetArea, y_lim_targetArea] = boundingbox(target_area);

[x_lim_robotFootprint, y_lim_robotFootprint] = boundingbox(robot_footprint);

waypoint_spacing_x = (x_lim_robotFootprint(2) - x_lim_robotFootprint(1)); % x waypoint spacing
waypoint_spacing_y = (y_lim_robotFootprint(2) - y_lim_robotFootprint(1)); % y waypoint spacing

waypoint = [];

for x = x_lim_targetArea(1) : waypoint_spacing_x : x_lim_targetArea(2)
    for y = y_lim_targetArea(1) : waypoint_spacing_y : y_lim_targetArea(2)

        tmp_x = x + (x_lim_robotFootprint(2) - x_lim_robotFootprint(1))/2;
        tmp_y = y + (y_lim_robotFootprint(2) - y_lim_robotFootprint(1))/2;

        centered_footprint = moveFootprint(tmp_x, tmp_y, robot_footprint);

        % check if the robot footprint intersects target area
        [int_x, ~] = checkIntersection(centered_footprint, target_area);

        if int_x >= 0
            %waypoint = [waypoint, [tmp_x ; tmp_y]];
            waypoint = [waypoint; tmp_x, tmp_y];
        end
              
    end

end

end




