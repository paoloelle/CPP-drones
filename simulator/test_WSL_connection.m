
% wsl ip addres -> $ ifconfig -> eth0, inet
setenv('ROS_MASTER_URI','http://172.24.219.119:11311')

% wsl ip on windows -> $ ipconfig -> Scheda Ethernet vEthernet (WSL), indirizzo IPV4 
setenv('ROS_IP','172.24.208.1') 

rosinit

rostopic list 

