function fileNames = getSubdirs(dirName)
    dirP = fullfile(dirName);
    dirOp = dir(fullfile(dirP, '*'));
    fileNames = {dirOp.name};
end