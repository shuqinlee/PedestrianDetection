mpfileRoot = '/home/shuqinlee/Documents/MPOutput/imgResult';
processRoot = '/home/shuqinlee/Documents/MatlabOutput';

mpNames = getSubdirs(mpfileRoot);

for i = 1:size(mpNames, 2)
    if mpNames{i}(1) == 'C'
        % process this video's Motion profile
        name = mpNames{i};
        path_pth = [processRoot  '/Path/' name '/'];
        scale_pth = [processRoot  '/ScaleOutput/' name '/'];
        mp_dir = [mpfileRoot '/' mpNames{i}];
        if ~exist(path_pth, 'dir')
            mkdir(path_pth);
        end
        if ~exist(scale_pth, 'dir')
            mkdir(scale_pth);
        end
        
        convertImg2Path(mp_dir, scale
        
        
        
        
        
    end
end


