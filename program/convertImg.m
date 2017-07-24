%% convolute the image with laplase gaussian filter
function scaleConv = convertImg(rgb)
    global sigma;
    fileName = ['scale_' int2str(sigma) '.mat'];
    if exist(fileName, 'file') == 2
        s = load(fileName);
        scaleConv = s.scaleConv;
    else
        % get filter values
        sigma = 15;
        sigma4 = sigma*4;
        [~, result] = gaussianDD(sigma);
        
        % read a picture into gray matrix
%         rgb = imread('../MPTestFile/o3.png');
%         figure(1)
%         imshow(rgb);
        
        gray = rgb2gray(rgb);
%         figure(2);
%         imshow(gray);

        % pic convolution and plot the convolution result

        convResult = zeros(3660, 1280);
        for i = 1:3660
            for j = sigma4+1 :1280-sigma4
                arr = double(gray(i, j-sigma4:j+sigma4));
                sum = result * arr';
                convResult(i, j) = sum;
            end
        %     i
        end
%         figure(3);

        scaleConv = 10000*convResult;
    end















        
    
        
end