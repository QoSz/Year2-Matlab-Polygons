% Function to plot a circle given the radius and center point
% Code from lecture notes
% Author of this code: John Burkardt
function p = circle_imp_points_2d (r, center, n)
    p = zeros(2,n);
    for ii = 1 : n
        theta = ( 2.0 * pi * ( ii - 1 ) ) / n;
        p(1,ii) = center(1) + r * cos ( theta );
        p(2,ii) = center(2) + r * sin ( theta );
    end
    return
end