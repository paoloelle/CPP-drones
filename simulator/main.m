clear all
close all
clc

%% create target area

basemap = "satellite";
geobasemap(basemap)
longitude = 43.116118;
latitude = 12.525492;
[long_Lowlim, longUpLim] = roundNumber_2digits(longitude);
[lat_LowLim, latUpLim] = roundNumber_2digits(latitude);
geoplot([long_Lowlim, longUpLim], [lat_LowLim, latUpLim])
set(gcf, 'WindowState', 'maximized');

target_area = drawpolygon("Color", 'y'); 

target_area = polyshape(target_area.Position(:,2), target_area.Position(:,1));
close

% conversion to local coordinates expressed in metres
target_area_verticesMeters = latLonToMeters(target_area);
target_area_meters = polyshape(target_area_verticesMeters(:,2), target_area_verticesMeters(:,1));

subplot(1,2,1)
plot(target_area)
title('Target area')
xlabel('Longitude')
ylabel('Latitude')
grid on

subplot(1,2,2)
plot(target_area_meters)
title('Target area (local coordinates in meters)')
xlabel('X (m)')
ylabel('Y (m)')
grid on

%% calculation of waypoints

% target_area_meters = polyshape([0 4 4 0], [0 0 3 3]); % only for test

robot_footprint = polyshape([0 50 50 0], [0 0 50 50]);
% specify the footprint of the sensor mounted on the UAV, the algorithm
% will calculate a enough number of waypoints which cover the entire area
% taking into account sensor's footprint

waypoints = calculateWaypoints(target_area_meters, robot_footprint);
% the function above can be seen as the CPP algorithm if we leave the waypoint in the
% order calculated by the function (of course this waypoints aren't optimized regsarding any metrics)


figure
plot(target_area_meters, 'FaceColor', 'g')
hold on
scatter(waypoints(:, 1), waypoints(:, 2), '*r')
title('Target area waypoints')
xlabel('X (m)')
ylabel('Y (m)')
grid on
axis equal

% Set labels to be displayed near the waypoints
labels = 1:size(waypoints, 1);  % Assuming you want to label each waypoint with numbers 1, 2, 3, ...
labelOffsets = [0.1, 0.1];  % Adjust the offsets for label positioning

% Add text labels near the symbols
for i = 1:size(waypoints, 1)
    x = waypoints(i, 1) + labelOffsets(1);
    y = waypoints(i, 2) + labelOffsets(2);
    text(x, y, num2str(labels(i)), 'FontSize', 10);
end

%% algorithm to order the waypoints based on some metric

waypoint_ordered = TSP_waypoints(waypoints, target_area_meters)

% figure
% plot(target_area_meters, 'FaceColor', 'g')
% hold on
% scatter(waypoint(:, 1), waypoint(:, 2), '*r')
% title('Target area waypoints and robot footprint')
% xlabel('X (m)')
% ylabel('Y (m)')
% grid on
% axis equal

% for  i = 1 : size(waypoint, 1)
% 
%     actual_footprint = moveFootprint(waypoint(i, 1), waypoint(i,2), robot_footprint);
%     plot(actual_footprint, 'FaceColor', 'y')
% 
% end

%% add referece altitude

% until now the waypoints computed where planar waypoints, for now a
% simply reference altitude of 1 meter is added

ref_height =  transpose(ones(1, size(waypoints, 1))*1); %% add reference altitude to waypoint
waypoints3D = [waypoints, ref_height]; % waypoints in 3D space



%% load rosbag

bag = rosbag('rosbag_2.bag'); % load rosbag file registered from simulation

% retrive quadcopter position
quadcopter_pos = select(bag, 'Topic', '/mavros/local_position/pose')
quadcopter_pos = timeseries(quadcopter_pos, 'Pose.Position.X', 'Pose.Position.Y', 'Pose.Position.Z')

% get position informations
time = quadcopter_pos.Time;
x = quadcopter_pos.Data(:, 1); % X is in the first column
y = quadcopter_pos.Data(:, 2); % Y is in the second column
z = quadcopter_pos.Data(:, 3); % Z is in the third column

title('Drone trajectory')
xlabel('X')
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
plot3(x, y, z)
grid on

% TODO add to the existing plot the waypoints
