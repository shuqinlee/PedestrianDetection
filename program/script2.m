clc; clear;
% inPth = '/Users/shuqinlee/Documents/PROJECT/Transportation/Output/第一批/15/FILE15_1.png';
% outPth = '/Users/shuqinlee/Documents/PROJECT/Transportation/PedestrianDetection/ConvolutionData/Batch1/15/';
sigma = [50, 35, 25];
for i = 1:3
    inPth = ['/Users/shuqinlee/Documents/PROJECT/Transportation/Output/第一批/15/FILE15_' int2str(i) '.png']
    outPth = ['/Users/shuqinlee/Documents/PROJECT/Transportation/PedestrianDetection/ConvolutionData/Batch1/15/' int2str(i) '/'];
    if exist(outPth, 'dir') ~= 7
        mkdir(outPth);
    end
    convertImg2Path(inPth, outPth, sigma(i));
    % for 1: 50 is good
end
