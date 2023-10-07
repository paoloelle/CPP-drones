function [int_x, int_y] = checkIntersection(centered_footprint, target_area)

% check intersection
[result_x, result_y] = polybool('intersection', centered_footprint.Vertices(:, 1), centered_footprint.Vertices(:, 2), target_area.Vertices(:, 1), target_area.Vertices(:, 2));

if ~isempty(result_x) && ~isempty(result_y)
    int_x = result_x;
    int_y = result_y;
else 
    int_x = -1;
    int_y = -1;

end