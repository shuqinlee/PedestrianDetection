%% rescaled to height * width * 3 and approporiate range

function t = rescale(m)
    
    scPos = abs(m);
    maxVal = max(scPos(:));
    
    m = m/maxVal;
    m = m + 1;
    m = m * 128;
    
    h = size(m, 1);
    w = size(m, 2);
    
    t = zeros(h, w, 3);
    t(:, :, 1) = m;
    t(:, :, 2) = m;
    t(:, :, 3) = m;
    
    t = uint8(t);
end