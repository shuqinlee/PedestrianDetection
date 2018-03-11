%% read a picture into gray

% test path: /Users/shuqinlee/Documents/PROJECT/Transportation/o3.png
rgb = imread('../MPTestFile/o3.png');
% imshow(rgb);
gray = rgb2gray(rgb);
% imshow(gray);


%% 

convResult = zeros(3660, 1280);
for i = 1:3660
    for j = 25:1280-25
        sum = 0;
        for k = 1:16
            sum = sum - double(gray(i, j - 25 + k));
        end
        for k = 1:18
            sum = sum + 2 * double(gray(i, j - 9 + k));
        end
        for k = 1:16
            sum = sum - double(gray(i, j + 9 + k));
        end
      
        convResult(i, j) = sum;
    end
    i
end

imshow(convResult);
        
        