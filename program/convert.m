%% get filter values
sigma = 10;
sigma4 = sigma*4;
[X, result] = gaussianDD(sigma);
%% read a picture into gray matrix

% test path: /Users/shuqinlee/Documents/PROJECT/Transportation/o3.png
rgb = imread('/Users/shuqinlee/Documents/PROJECT/Transportation/MotionProfileOutput/o3.png');
figure(1)
imshow(rgb);
gray = rgb2gray(rgb);
figure(2);
imshow(gray);

%% pic convolution and plot the convolution result

convResult = zeros(3660, 1280);
for i = 1:3660
    
    for j = sigma4+1 :1280-sigma4
        arr = double(gray(i, j-sigma4:j+sigma4));
        sum = result * arr';
        convResult(i, j) = sum;
    end
%     i
end
figure(3);
scaleConv = 10000*convResult;
imshow(uint8(scaleConv));
title(['sigma' '=' int2str(sigma)]);
hold on

%% find path with given entry 
x = 554; 
y = 965;
entry = [x, y];

lzero = (scaleConv(x,y) > 0);
p = zeros(1, 3660);
p(x) = y;

% after the current time
while x < 3660 && y ~= 0
    x = x + 1;
    y = findNext(y, scaleConv(x, :), lzero);
    p(x) = y;
end

%% draw line on 3 distinct images
line(p(entry(1) : x), entry(1):x, 'LineWidth', 4, 'Color', 'r');

figure(1);
hold on 
line(p(entry(1) : x), entry(1):x, 'LineWidth', 4, 'Color', 'r');
hold off

figure(2);
hold on 
line(p(entry(1) : x), entry(1):x, 'LineWidth', 4, 'Color', 'r');
hold off

















        