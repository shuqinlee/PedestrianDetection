%% find path with given entry and plot it on the image
x = 554; 
y = 965;
entry = [x, y];
% while y < 3660 && 

lzero = (scaleConv(x,y) > 0);
p = zeros(1, 3660);
p(x) = y;

% after the current time
while x < 3660 && y ~= 0
    x = x + 1;
    y = findNext(y, scaleConv(x, :), lzero);
    p(x) = y;
end