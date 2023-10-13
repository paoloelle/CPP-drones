function [data, info] = position3D
%position3D gives an empty data for simulator/position3D
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'simulator/position3D';
[data.X, info.X] = ros.internal.ros.messages.ros.default_type('double',NaN);
[data.Y, info.Y] = ros.internal.ros.messages.ros.default_type('double',NaN);
[data.Z, info.Z] = ros.internal.ros.messages.ros.default_type('double',NaN);
info.MessageType = 'simulator/position3D';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,3);
info.MatPath{1} = 'x';
info.MatPath{2} = 'y';
info.MatPath{3} = 'z';
