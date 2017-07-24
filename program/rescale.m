function m = rescale(m)
    
    scPos = abs(m);
    maxVal = max(scPos(:));
    
    m = m/maxVal;
    m = m + 1;
    m = m * 128;
end