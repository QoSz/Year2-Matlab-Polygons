% Code for Task 5
function edge = highlightedge(mouse_xy, vertices)

    % Calculates length of each edge
    vertices(:,3) = 0;
    length_edges = vecnorm(diff(vertices, [], 1), 2, 2);

    % Finds the distance from each point to a line along each edge.
    a = diff(vertices, [], 1);
    mouse_xy(3) = 0; 
    distpoint_line = vecnorm(cross(a,(mouse_xy - vertices(2:end,:)),2),2,2)... 
        ./ vecnorm(a,2,2);

    % Calculates distance from mouse pointer to each individual vertex.
    dist_vertices = vecnorm(mouse_xy - vertices, 2, 2);
    dist1 = dist_vertices(1:end-1);
    dist2 = dist_vertices(2:end);

    % Make sure the invisible line doesn't go past the start and end of the edgse
    past_start = dist2 >= vecnorm([length_edges dist1], 2, 2);
    past_end = dist1 >= vecnorm([length_edges dist2], 2, 2);

    % Find the distance to the edge.    
    distpoint_line(past_end) = dist2(past_end);
    distpoint_line(past_start) = dist1(past_start);
    
    % Finds the closest edge to the mouse pointer.
    [~,edge] = min(distpoint_line);
end