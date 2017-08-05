% this function suits specifically for pixel block like
%  ************ <--will only process this line and set parseRec in 3 lines
% **************
%  ************
% 
function [left, right] = blockColoring(i,j)
    global parseRec;
    global marked2;
    
    s2 = size(parseRec, 2);
    
    global marked3; % marked images should be looked at
    if (j > 0) &&(j < s2) && (marked2(i, j, 1) ~= 35 || marked3(i, j, 1) ~= 35)
        left = j;
        right = j;
        if marked2(i, j, 1) ~= 35 
            while left >= 0 && marked2(i, left, 1) ~= 35
                left = left - 1;
            end
        else
            while left >= 0 && marked3(i, left, 1) ~= 35   
                left = left - 1;
            end
        end
        left = left + 1;
        
        if (marked2(i-1, left+1, 1) == 35 && marked3(i-1, left+1, 1) == 35) % line 1
            while right <= s2 && marked2(i, right, 1) ~= 35  
                right = right + 1; 
            end
            while right <= s2 && marked3(i, right, 1) ~= 35      
                right = right + 1; 
            end

            mat = ones(1, right-left) * right;
            parseRec(i, left:right-1) = mat;
            parseRec(i+1, left-1) = right + 1;
            parseRec(i+2, left) = right;

        elseif (marked2(i-2, left+1, 1) == 35 && marked3(i-2, left+1, 1) == 35) % line 2
            right = parseRec(i-1, left + 1) + 1;
        else
            right = parseRec(i-2, left);
        end
    else
        left = 0;
        right = 0;
    end
        
end