%% find path with given entry 
% return a 1 * 3660 vector, p(x) is the interval at y-coordinates and the
% vertival coordinate index
function [p, x] = findPath(entry, withMark)
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
        y = findNext(y, x, lzero, withMark);
        p(x) = y;
        x = x + 1;
        
        if y == 0
            disp(['Exit at ', int2str(x)]);
        end
    end
    x = x-1;
    
end