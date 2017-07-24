global scaleResult;

%% read files
% use only o3.png temporarily
sigma = 25;

rgb3 = imread('../MPTestFile/o3.png');

marked2 = imread('../MP_marked/o2.marked.sim.png');
marked3 = imread('../MP_marked/o3.marked.sim.png');


scaleResult = convertImg(sigma, rgb3);
parseRec = zeros(3660, 1280);

for i = 1: 3660
    for j = 1: 1280
        if (marked2(i, j, 1) == 35 || marked3(i, j, 1) == 35) && ...
                parseRec(i, j) ~= 0
            
            % start to find path
            pth = findPth([i,j], 
            
            