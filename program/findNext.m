function ind = findNext(y, x, lzero)
    global deriv;
    global parseRec;
    global scaleConv;
    global marked2;
    global marked3;
    
    i = y;
    maxl = 0;
    maxr = 0;
    maxil = 0;
    maxir = 0;
    
    ll = scaleConv(x, :);
    while i > 0 && (ll(i)>0) == lzero
        if abs(maxl) < abs(ll(i))
            maxil = i;
            maxl = ll(i);
        end
        i = i - 1;
        
    end
    left = i + 1;
    i = y;
    while i < 1281 && (ll(i)>0) == lzero 
        if abs(maxr) < abs(ll(i))
            maxr = ll(i);
            maxir = i;
        end
       
        i = i + 1;
        
    end
    right = i - 1;
    if abs(maxl) > abs(maxr)
%         val = maxl;
        ind = maxil;
    else
%         val = maxr;
        ind = maxir;
    end
%     parseRec(x, left) = right + 1;
    
    deriv.add(ind-y);
    qsize = 10;
    if deriv.size() > qsize
        deriv.remove();
        
        sub = 0;
        for i = 0:qsize-1
            sub = sub + deriv.get(i);
        end
        sub = abs(sub - (qsize-1) * deriv.getLast());
        if sub > qsize*50
            ind = 0;
            t = sub/qsize
        end
    end
    if ind~= 0
        if (marked2(x, y, 1) ~= 35 || marked3(x, y, 1) ~= 35) && ...
                (marked2(x, ind, 1) == 35 && marked3(x, ind, 1) == 35)
            disp('max val not colored!');
        end
    end
    blockColoring(x, ind);
    if (marked2(x, right, 1) ~= 35 || marked3(x, right, 1) ~= 35)
        while  marked2(x, right, 1) ~= 35
            right = right + 1;
        end
        while  marked3(x, right, 1) ~= 35
            right = right + 1;
        end
    end
%     left
%     right
    disp(['x: ' int2str(x) 'left:' int2str(left) ',right: ' int2str(right)]);
    parseRec(x, left) = right + 1;
    
    
end