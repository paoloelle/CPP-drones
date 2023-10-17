clear all
close all
clc

%% create target area

basemap = "satellite";
geobasemap(basemap)
geoplot(43.116118, 12.525492)
geolimits([43.11, 43.12], [12.51, 12.53]);
set(gcf, 'WindowState', 'maximized');

target_area = drawpolygon("Color", 'y') % 1 column = latitude, 2 column = longitude

target_area = polyshape(target_area.Position(:,2), target_area.Position(:,1))


figure
plot(target_area)
title('Target area')
xlabel('Longitude')
ylabel('Latitude')
grid on


target_area_verticesMeters = latLonToMeters(target_area);
target_area_meters = polyshape(target_area_verticesMeters(:,2), target_area_verticesMeters(:,1));

figure
plot(target_area_meters)
title('Target area (local coordinates in meters)')
xlabel('X (m)')
ylabel('Y (m)')
grid on

%% CPP algorithm

target_area_meters = polyshape([0 2 2 0], [0 0 2 2])

robot_footprint = polyshape([0 1 1 0], [0 0 1 1]);
waypoint = calculateWaypoint(target_area_meters, robot_footprint); 

figure
plot(target_area_meters, 'FaceColor', 'g')
hold on
scatter(waypoint(:, 1), waypoint(:, 2), '*r')
title('Target area waypoints')
xlabel('X (m)')
ylabel('Y (m)')
grid on
axis equal


%% visualize coverage of every waypoint

figure
plot(target_area_meters, 'FaceColor', 'g')
hold on
scatter(waypoint(:, 1), waypoint(:, 2), '*r')
title('Target area waypoints and robot footprint')
xlabel('X (m)')
ylabel('Y (m)')
grid on
axis equal

for  i = 1 : size(waypoint, 1)

    actual_footprint = moveFootprint(waypoint(i, 1), waypoint(i,2), robot_footprint);
    plot(actual_footprint, 'FaceColor', 'y')

end

%% add reference altitude to waypoint

ref_height =  transpose(ones(1, size(waypoint, 1))*1);
waypoint3D = [waypoint, ref_height]



