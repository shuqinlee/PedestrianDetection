function ind = findNext(y, ll, lzero)
    global deriv;
    
    
    i = y;
    maxl = 0;
    maxr = 0;
    maxil = 0;
    maxir = 0;
    
    while i > 0 && (ll(i)>0) == lzero
        if abs(maxl) < abs(ll(i))
            maxil = i;
            maxl = ll(i);
        end
        i = i - 1;
    end
    i = y;
    while i < 1281 && (ll(i)>0) == lzero 
        if abs(maxr) < abs(ll(i))
            maxr = ll(i);
            maxir = i;
        end
        i = i + 1;
    end
    if abs(maxl) > abs(maxr)
%         val = maxl;
        ind = maxil;
    else
%         val = maxr;
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
        if sub > qsize*30
            ind = 0;
            t = sub/qsize
        end
    end
    
    
end