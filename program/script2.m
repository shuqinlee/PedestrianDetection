clc; clear;

sigma = [40, 25, 25];
for i = 2:3
    inPth = ['../../Output/Batch1/15/FILE15_' int2str(i) '.png']
    outPth = ['../ConvolutionData/Batch1/15/' int2str(i) '/'];
    if exist(outPth, 'dir') ~= 7
        mkdir(outPth);
    end
    convertImg2Path(inPth, outPth, sigma(i));
    % for 1: 50 is good
end
