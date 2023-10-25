% TSP example

clc
close all

x = [0.5 1.0 0.1 1.2 1.5 0.0 0.3 0.6 0.8 0.3 0.9]';
y = [0.2 1.8 0.4 0.8 1.6 0.0 0.3 1.4 1.0 0.9 0.2]';

% waypoints = [x', y']
figure
movegui(gcf, 'center');
scatter(x, y)

nStops = size(x,1);

idxs = nchoosek(1:nStops, 2)

dist = hypot(x(idxs(:,1)) - x(idxs(:,2)), ...
             y(idxs(:,1)) - y(idxs(:,2)))
lendist = length(dist);

G = graph(idxs(:,1),idxs(:,2));
figure
movegui(gcf, 'center');
hGraph = plot(G,'XData',x,'YData',y,'LineStyle','none','NodeLabel',{});

tsp = optimproblem;
trips = optimvar('trips',lendist,1,'Type','integer','LowerBound',0,'UpperBound',1);
tsp.Objective = dist'*trips;

constr2trips = optimconstr(nStops,1);
for stop = 1:nStops
    whichIdxs = outedges(G,stop); % Identify trips associated with the stop
    constr2trips(stop) = sum(trips(whichIdxs)) == 2;
end
tsp.Constraints.constr2trips = constr2trips;


opts = optimoptions('intlinprog','Display','off');
tspsol = solve(tsp,'options',opts)

tspsol.trips = logical(round(tspsol.trips));
Gsol = graph(idxs(tspsol.trips,1),idxs(tspsol.trips,2),[],numnodes(G));

hold on
highlight(hGraph,Gsol,'LineStyle','-')
title('Solution with Subtours')

tourIdxs = conncomp(Gsol);
numtours = max(tourIdxs); % Number of subtours
fprintf('# of subtours: %d\n',numtours);

% Index of added constraints for subtours
k = 1;
while numtours > 1 % Repeat until there is just one subtour
    % Add the subtour constraints
    for ii = 1:numtours
        inSubTour = (tourIdxs == ii); % Edges in current subtour
        a = all(inSubTour(idxs),2); % Complete graph indices with both ends in subtour
        constrname = "subtourconstr" + num2str(k);
        tsp.Constraints.(constrname) = sum(trips(a)) <= (nnz(inSubTour) - 1);
        k = k + 1;        
    end
    
    % Try to optimize again
    [tspsol,fval,exitflag,output] = solve(tsp,'options',opts);
    tspsol.trips = logical(round(tspsol.trips));
    Gsol = graph(idxs(tspsol.trips,1),idxs(tspsol.trips,2),[],numnodes(G));
    % Gsol = graph(idxs(tspsol.trips,1),idxs(tspsol.trips,2)); % Also works in most cases
    
    % Plot new solution
    hGraph.LineStyle = 'none'; % Remove the previous highlighted path
    highlight(hGraph,Gsol,'LineStyle','-')
    drawnow

    % How many subtours this time?
    tourIdxs = conncomp(Gsol);
    numtours = max(tourIdxs); % Number of subtours
    fprintf('# of subtours: %d\n',numtours)    
end

title('Solution with Subtours Eliminated');
hold off

disp(output.absolutegap)
