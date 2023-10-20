clear all
close all
clc

%% create target area

basemap = "satellite";
geobasemap(basemap)
longitude = 43.116118
latitude = 12.525492
[long_Lowlim, longUpLim] = roundNumber_2digits(longitude);
[lat_LowLim, latUpLim] = roundNumber_2digits(latitude);
geoplot([long_Lowlim, longUpLim], [lat_LowLim, latUpLim])
set(gcf, 'WindowState', 'maximized');

target_area = drawpolygon("Color", 'y') % 1 column = latitude, 2 column = longitude

target_area = polyshape(target_area.Position(:,2), target_area.Position(:,1))
close

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

target_area_meters = polyshape([0 2 2 0], [0 0 2 2]) % only for test

robot_footprint = polyshape([0 1 1 0], [0 0 1 1]);
waypoint = calculateWaypoint(target_area_meters, robot_footprint); % CPP algorithm

figure
plot(target_area_meters, 'FaceColor', 'g')
hold on
scatter(waypoint(:, 1), waypoint(:, 2), '*r')
title('Target area waypoints')
xlabel('X (m)')
ylabel('Y (m)')
grid on
axis equal

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

ref_height =  transpose(ones(1, size(waypoint, 1))*1); %% add reference altitude to waypoint
waypoint3D = [waypoint, ref_height] % waypoints in 3D space

%% load rosbag

clc

bag = rosbag('rosbag_1.bag'); % load rosbag file registered from simulation

% retrive quadcopter position
quadcopter_pos = select(bag, 'Topic', '/mavros/local_position/pose', 'Time', [200 bag.EndTime])
quadcopter_pos = timeseries(quadcopter_pos, 'Pose.Position.X', 'Pose.Position.Y', 'Pose.Position.Z')

time = quadcopter_pos.Time;
x = quadcopter_pos.Data(:, 1); % X is in the first column
y = quadcopter_pos.Data(:, 2); % Y is in the second column
z = quadcopter_pos.Data(:, 3); % Z is in the third column

figure
scatter3(waypoint3D(:,1), waypoint3D(:,2), waypoint3D(:,3), '*r')
axis([0, 1.8 0, 1.8, 0, 1.6])
hold on

plot3(x(:), y(:), z(:), 'b--')
