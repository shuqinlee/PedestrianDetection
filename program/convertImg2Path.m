%% batch process 
% to convert a photo belonging to a video into full-path pic
% inPth: the pic to read in 
% outPth: the directory path to put convoulution result in
function convertImg2Path(inPth, outPth, sigma)
    global scaleConv;
    global parseRec;
    
    rgb = imread(inPth);
    s1 = size(rgb, 1);
    s2 = size(rgb, 2);

    scaleConv = convertImg(rgb, sigma, outPth);
    parseRec = zeros(s1, s2);

    pths = cell(1, 4000);
    pInd = 1;

    figure(1);
    hold on
    imshow(rgb);
    title(['sigma' '=' int2str(sigma)]);
    left = sigma*4 + 1;
    right = s2 + 1 - sigma*4;
    
    for i = 1: s1
        j = left;
        while j > 0 && j < right
            if parseRec(i, j) == 0
                % start to find path
                [pth, x] = findPath([i,j], 0);
                pths{pInd} = {pth(i:x-1), i, x-1};
                line(pth(i:x-1), i: x-1, 'LineWidth', 1, 'Color', 'r');
                pInd
                pInd = pInd + 1;
                disp(['i: ', int2str(i), ', j: ', int2str(j) , ...
                    ', jump to:', int2str(parseRec(i, j))]);
                pth(i:x-1)
                if j == 0
                    continue;
                end
                j = parseRec(i, j);
            else 
                j = parseRec(i, j);
            end
        end
    end
end