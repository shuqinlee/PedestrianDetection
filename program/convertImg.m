%% convolute the image with laplase gaussian filter
% pth is the saving directory
% pth's like: '../ConvolutionData/Batch1/216/2/'
function scaleConv = convertImg(rgb, sigma, pth)
    
    fileName = [pth 'scale_' int2str(sigma) '.mat'];
    if exist(fileName, 'file') == 2
        s = load(fileName);
        scaleConv = s.scaleConv;
    else
        % get filter values
        sigma4 = sigma*4;
        [~, result] = gaussianDD(sigma);
        
        % read a picture into gray matrix
        gray = rgb2gray(rgb);

        % size
        s1 = size(rgb, 1);
        s2 = size(rgb, 2);
        % pic convolution and plot the convolution result
        convResult = zeros(s1, s2);
        for i = 1:s1
            for j = sigma4+1 :s2-sigma4
                arr = double(gray(i, j-sigma4:j+sigma4));
                sum = result * arr';
                convResult(i, j) = sum;
            end
        %     i
        end

        scaleConv = 10000*convResult;
        if exist(pth, 'dir') ~= 2
            mkdir(pth);
        end
        imshow(scaleConv);
        save(fileName, 'scaleConv');
    end















        
    
        
end