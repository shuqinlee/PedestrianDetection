function ind = findNext(y, x, lzero, withMark)
    global deriv;
    global parseRec;
    global scaleConv;
    global marked2;
    global marked3;
    
    i = y;
    s1 = size(scaleConv, 1);
    s2 = size(scaleConv, 2);
    
    % find max at left
    ll = scaleConv(x, :);
    while i > 0 && (ll(i)>0) == lzero && ll(i) ~= 0
        i = i - 1;
    end
    left = i + 1;
    
    % find max at right
    i = y;
    while i < s2+1 && (ll(i)>0) == lzero && ll(i) ~= 0
        i = i + 1;
    end
    right = min([s2, i]);
    l = left;
    r = right;
    
    width = 10;
    
    if y - left > width
        lVal = abs(ll(y-width));
    else
        lVal = 5000;
    end
    
    if right - y > (width + 1)
        rVal = abs(ll(y+width));
    else
        rVal = 5000;
    end
    
    
    if lVal < abs(ll(y)) 
        l = y - width;
    end
    if rVal < abs(ll(y))
        r = y + width+1;
    end
    
    if lzero
        [~, ind] = max(ll(l:r-1));
    else
        [~, ind] = min(ll(l:r-1));
    end
    if size(ind, 2) == 0
        ind = 0;
        return;
    end
    ind = ind + l - 1;
       
    % check if validate
    deriv.add(ind-y);
    qsize = 10;
    if deriv.size() > qsize
        deriv.remove();
        sub = 0;
        for i = 0:qsize-1
            sub = sub + deriv.get(i);
        end
        sub = abs(sub - (qsize-1) * deriv.getLast());
        if sub > qsize*30
            ind = 0;
            t = sub/qsize
            return
        end
    end
    
    % if it has already been drawn, stop tracing
    if parseRec(x, ind) ~= 0
        ind = 0;
    end
    
    % verify mode
    if withMark == 1
        if ind ~= 0
            if (marked2(x, y, 1) ~= 35 || marked3(x, y, 1) ~= 35) && ...
                    (marked2(x, ind, 1) == 35 && marked3(x, ind, 1) == 35)
                    disp('max val not colored!');
            end
            [lineL, lineR] = blockColoring(x, y);
            if(lineL ~= 0)
                left = min(left, lineL);
                right = max(right, lineR);
            end
            parseRec(x, left) = right;
        end
    else
        m = ones(1, right-left) * right;
        parseRec(x, left:right-1) = m;
    end
end