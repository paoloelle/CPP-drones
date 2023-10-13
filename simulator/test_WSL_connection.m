
% wsl ip addres -> $ ifconfig -> eth0, inet
setenv('ROS_MASTER_URI','http://172.24.219.119:11311')

% wsl ip on windows -> $ ipconfig -> Scheda Ethernet vEthernet (WSL), indirizzo IPV4 
setenv('ROS_IP','172.24.208.1') 

rosinit

rostopic list 


%%

% publisher
waypoint_pub = rospublisher('/MATLAB_waypoint', 'geometry_msgs/PoseArray')


% create message
waypointList_msg = rosmessage('geometry_msgs/PoseArray');

for i = 1:length(waypoint3D)
    waypoint = rosmessage('geometry_msgs/Pose');
    waypoint.Position.X = waypoint3D(i,1);  % Set the x-coordinate
    waypoint.Position.Y = waypoint3D(i,2);  % Set the y-coordinate
    waypoint.Position.Z = waypoint3D(i,3);  % Set the z-coordinate
    waypoint.Orientation.W = 1.0;

    % Add the Pose message to the PoseArray
    waypointList_msg.Poses = [waypointList_msg.Poses; waypoint];

end

send(waypoint_pub, waypointList_msg); % send this message only one time


