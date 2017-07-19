function m = rescale(m)
    
    scPos = abs(m);
    maxVal = max(scPos(:))
    mVal = 0;
    mi = 0;
    mj = 0;
    for i = 1:size(scPos,1)
        for j = 1:size(scPos,2)
            if mVal < scPos(i, j)
                mVal = scPos(i,j);
                mi = i;
                mj = j;
            end
        end
    end
    mVal
    mi
    mj
    
    m = m/maxVal;
    m = m + 1;
    m = m * 128;
    
    
    imshow(uint8(m));
end