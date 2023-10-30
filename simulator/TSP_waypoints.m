function [ordered_waypoints] = TSP_waypoints(waypoints, varargin)

x = waypoints(:,1);
y = waypoints(:,2);

nStops = size(x,1);

idxs = nchoosek(1:nStops, 2);

dist = hypot(x(idxs(:,1)) - x(idxs(:,2)), ...
             y(idxs(:,1)) - y(idxs(:,2)));
lendist = length(dist);

G = graph(idxs(:,1),idxs(:,2));
figure
if ~isempty(varargin)
     plot(varargin{1}, 'FaceColor', 'g')
end
movegui(gcf, 'center');
grid on


hold on
hGraph = plot(G,'XData',x,'YData',y,'LineStyle','none','NodeLabel',{}, 'NodeColor', 'b');



tsp = optimproblem; % Create optimization problem
trips = optimvar('trips',lendist,1,'Type','integer','LowerBound',0,'UpperBound',1); % Create optimization variable
tsp.Objective = dist'*trips;

constr2trips = optimconstr(nStops,1); % Create empty optimization constraint array
for stop = 1:nStops
    whichIdxs = outedges(G,stop); % Identify trips associated with the stop (outgoing edges from node)
    constr2trips(stop) = sum(trips(whichIdxs)) == 2;
end
tsp.Constraints.constr2trips = constr2trips;


opts = optimoptions('intlinprog','Display','off');
tspsol = solve(tsp,'options',opts);

tspsol.trips = logical(round(tspsol.trips));
Gsol = graph(idxs(tspsol.trips,1),idxs(tspsol.trips,2),[],numnodes(G));

hold on
highlight(hGraph,Gsol,'LineStyle','-', 'EdgeColor', 'b')




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
    [tspsol, fval, exitflag, output] = solve(tsp,'options',opts);
    tspsol.trips = logical(round(tspsol.trips));
    Gsol = graph(idxs(tspsol.trips,1),idxs(tspsol.trips,2),[],numnodes(G));
    % Gsol = graph(idxs(tspsol.trips,1),idxs(tspsol.trips,2)); % Also works in most cases
    
    % Plot new solution
    hGraph.LineStyle = 'none'; % Remove the previous highlighted path
    highlight(hGraph,Gsol,'LineStyle','-', 'EdgeColor', 'b')
    drawnow

    % How many subtours this time?
    tourIdxs = conncomp(Gsol);
    numtours = max(tourIdxs); % Number of subtours
    fprintf('# of subtours: %d\n',numtours)    
end

hold off

%%

edges = Gsol.Edges.EndNodes;
    

starting_node = 1; % Change this to your desired starting node
sorted_nodes = starting_node;


while ~isempty(edges)
    
    idx = find(edges(:,1) == starting_node | edges(:,2) == starting_node);
    
    if edges(idx, 1) == starting_node 
        next_node = edges(idx, 2);
        next_node = next_node(1); % only for the first iteration
    else 
        next_node = edges(idx, 1);
    end
        
    edges(idx, :) = []; % remove currente edge from the list

    sorted_nodes = [sorted_nodes, next_node];

    starting_node = next_node;

end

ordered_waypoints = sorted_nodes;

disp('Sorted nodes:')
disp(sorted_nodes);
end