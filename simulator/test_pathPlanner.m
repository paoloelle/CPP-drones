% this script is used to test the matlab coverage path planner provided
% since release R2023a

polygons = coverageDecomposition(target_area_verticesMeters);
cs = uavCoverageSpace(Polygons=polygons);
figure
show(cs)
takeoff = [0 0 0];
landing = [0 500 0];


%%

cpeExh = uavCoveragePlanner(cs, Solver="MinTraversal");
cpeExh.SolverParameters.VisitingSequence = [1];
[wptsExh,solnExh] = plan(cpeExh,takeoff,landing);

figure
show(cs);
title("Exhaustive Solver Algorithm")
hold on
scatter(wptsExh(:,1), wptsExh(:,2))
