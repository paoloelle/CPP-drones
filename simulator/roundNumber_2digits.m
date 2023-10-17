function [lowLim, upLim] = roundNumber_2digits(reference_value)

% round a number with 2 digits after zero 

% round upwards
upLim = ceil(reference_value * 100) / 100;

% round downwards
lowLim = floor(reference_value * 100) / 100;

end