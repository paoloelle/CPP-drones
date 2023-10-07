function vertices_meters = latLonToMeters(target_area)

target_area_vertices = target_area.Vertices;

R = 6371000;  % Approximate value for the average radius of the Earth

refLat = min(target_area_vertices(:,1));
refLon = min(target_area_vertices(:,2));


% Convert reference latitude and reference longitude from degrees to radians
refLat = deg2rad(refLat);
refLon = deg2rad(refLon);

vertices_meters = [];

for i = 1 : length(target_area_vertices(:,1))    

        lat = target_area_vertices(i,1);
        lon = target_area_vertices(i,2);

        % Convert latitude and longitude from degrees to radians
        lat = deg2rad(lat);
        lon = deg2rad(lon);

        % Calculate the differences in latitude and longitude
        dlat = lat - refLat;
        dlon = lon - refLon;

        % Calculate x and y offsets in meters
        x = R * dlon * cos(refLat);
        y = R * dlat;


        vertices_meters = [vertices_meters; x y];

end


end
