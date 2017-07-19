function ind = findNext(y, ll, lzero)
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
end