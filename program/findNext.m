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
    right = min([1280, i]);
    
    if abs(maxl) > abs(maxr)
        ind = maxil;
    else
        ind = maxir;
    end
    
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
            return
        end
    end
    ind
    x
    y
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
%     disp(['x: ' int2str(x) ...
%         ', left:' int2str(left) ...
%         ',right: ' int2str(right)]);
%     if (marked2(x, right, 1) ~= 35 || marked3(x, right, 1) ~= 35)
%         while  marked2(x, right, 1) ~= 35
%             right = right + 1;
%         end
%         while  marked3(x, right, 1) ~= 35
%             right = right + 1;
%         end
%     end
%     left
%     right
end