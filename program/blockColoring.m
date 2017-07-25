function blockColoring(i,j)
    global parseRec;
    global marked2;
    global marked3;
    if j <1281 && (marked2(i, j, 1) ~= 35 || marked3(i, j, 1) ~= 35) && ...
            parseRec(i,j) ~= 0
        left = j;
        right = j;
        if marked2(i, j, 1) ~= 35 
            while left >= 0 && marked2(i, left, 1) ~= 35
                left = left - 1;
            end
            while right <= 1280 && marked2(i, right, 1) ~= 35
                right = right + 1;
            end
        else
            while left >= 0 && marked3(i, left, 1) ~= 35 
                left = left - 1;
            end
            while right <= 1280 && marked3(i, right, 1) ~= 35 
                right = right + 1;
            end
        end
        parseRec(i, left) = right + 1;
        parseRec(i+1, left-1) = right + 2;
        parseRec(i+2, left) = right + 1;
    end
        
        
end