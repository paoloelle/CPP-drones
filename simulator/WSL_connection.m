%% connect to WSL

% get ip addresses needed to communicate with WSL

[~, ipAdd_wsl] = system('wsl ip -4 addr show eth0 | findstr "inet"');

ipAdd_wsl = regexp(ipAdd_wsl, '\d+\.\d+\.\d+\.\d+', 'match');
ipAdd_wsl = ipAdd_wsl(1)

[~, ipAdd_windows] = system('ipconfig | findstr /C:"vEthernet (WSL)" /C:"IPv4"', '-echo');
ipAdd_windows = regexp(ipAdd_windows, '172.\d+\.\d+\.\d+', 'match')


% wsl ip addres -> $ ifconfig -> eth0, inet
string_ROS_MASTER_URI = strcat('http://', ipAdd_wsl, ':11311')
setenv('ROS_MASTER_URI',string_ROS_MASTER_URI)

% wsl ip on windows -> $ ipconfig -> Scheda Ethernet vEthernet (WSL), indirizzo IPV4 
setenv('ROS_IP', ipAdd_windows) 

rosinit

rostopic list


%% publish waypoint

clc

% publisher
waypoint_pub = rospublisher('/MATLAB_waypoint', 'geometry_msgs/PoseArray')


% create message
waypointList_msg = rosmessage('geometry_msgs/PoseArray');

for i = 1:length(waypoints3D)
    waypoint = rosmessage('geometry_msgs/Pose');
    waypoint.Position.X = waypoints3D(i,1);  % Set the x-coordinate
    waypoint.Position.Y = waypoints3D(i,2);  % Set the y-coordinate
    waypoint.Position.Z = waypoints3D(i,3);  % Set the z-coordinate
    waypoint.Orientation.W = 1.0; % rotation 

    % Add the Pose message to the PoseArray
    waypointList_msg.Poses = [waypointList_msg.Poses; waypoint];

end

send(waypoint_pub, waypointList_msg); % send message only one time




