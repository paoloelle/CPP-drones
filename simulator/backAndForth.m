function orderedWaypoints = backAndForth(target_area, robot_footprint)
%BACKANDFORTH Implementation of a simple Back and Forth Coverage Path
%Planning algorithm 
%Back and Forth is performed on the major axis


% discretize the area to cover and calculate a set of possible waypoints
% ordered along the x-axis of a rectuangular area
waypoint = calculateWaypoint(target_area, robot_footprint);

% calculate the major axis
[x, y] = boundingbox(target_area);

if y(2) - y(1) >= x(2) - x(1) % y is the major axis
    orderedWaypoints = 






end

