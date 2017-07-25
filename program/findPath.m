%% find path with given entry 
% return a 1 * 3660 vector, p(x) is the interval at y-coordinates 
function [p, x] = findPath(entry)
    global scaleConv;
    x = entry(1);
    y = entry(2);
    lzero = (scaleConv(x,y) > 0);
    p = zeros(1, 3660);
    p(x) = y;


    global deriv;
    deriv = java.util.LinkedList();

    % after the current time
    while x < 3660 && y ~= 0
        y = findNext(y, x, lzero);
        x = x + 1;
        p(x) = y;
        if y == 0
            disp(['Exit at ', int2str(x)]);
        end
    end
    
end