%% using marked pics


%% get filter values
sigma = 25;
sigma4 = sigma*4;
[X, result] = gaussianDD(sigma);
%% read a picture into gray matrix

rgb2 = imread('../MP_marked/o2.marked.sim.png');
figure(1)
imshow(rgb2);
gray2 = rgb2gray(rgb2);
figure(2);
imshow(gray2);

rgb3 = imread('../MP_marked/o3.marked.sim.png');
figure(3)
imshow(rgb3);
gray3 = rgb2gray(rgb3);
figure(4);
imshow(gray3);

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
s = rescale(scaleConv);
imshow(uint8(s));
title(['sigma' '=' int2str(sigma)]);
hold on
%%
for i = 1: 3660
    for j = 1: 1280
    end
end











%% find path with given entry 
x = 554; 
y = 965;
entry = [x, y];

lzero = (scaleConv(x,y) > 0);
p = zeros(1, 3660);
p(x) = y;


global deriv;
deriv = java.util.LinkedList();

% after the current time
while x < 3660 && y ~= 0
    x = x + 1;
    y = findNext(y, scaleConv(x, :), lzero);
    p(x) = y;
    if y == 0
        disp(['Exit at ', int2str(x)]);
    end
end

%% draw line on 3 distinct images
figure(4);
hold on 
imshow(uint8(s));
line(p(entry(1) : x-1), entry(1):x-1, 'LineWidth', 4, 'Color', 'r');
hold off

% figure(5);
% hold on 
% imshow(rgb);
% line(p(entry(1) : x-1), entry(1):x-1, 'LineWidth', 4, 'Color', 'r');
% hold off
% 
% figure(6);
% hold on 
% imshow(gray);
% line(p(entry(1) : x-1), entry(1):x-1, 'LineWidth', 4, 'Color', 'r');
% hold off