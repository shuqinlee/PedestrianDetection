clc;
clear;

global scaleConv;
global parseRec;
global marked2;
global marked3;


%% read files
rgb = imread('../MPTestFile/o3.png');
marked2 = imread('../MP_marked/o2.marked.sim.png');
marked3 = imread('../MP_marked/o3.marked.sim.png');
mix = imread('../MP_marked/mix.png');

%% convert image

sigma = 25;

scaleConv = convertImg(rgb, sigma);
parseRec = zeros(3660, 1280);

pths = cell(1,100);
pInd = 1;

figure(1)
hold on
imshow(mix);
title(['sigma' '=' int2str(sigma)]);

for i = 1: 3660
    j = 1;
    while j <= 1280
        if (marked2(i, j, 1) ~= 35 || marked3(i, j, 1) ~= 35) % if has special color
            if parseRec(i, j) == 0
            
                k = j+20;
                while k <= 1280 && marked2(i, k, 1) ~= 35
                    k = k+1;
                end
                while k <= 1280 && marked3(i, k, 1) ~= 35
                    k = k+1;
                end
                mid = floor((j + k)/2);

                % start to find path
                [pth, x] = findPath([i,mid],1);
                pths{pInd} = {pth(i:x-1), i, x-1};
                line(pth(i:x-1), i: x-1, 'LineWidth', 1, 'Color', 'r');
                pInd
                pInd = pInd + 1;
                disp(['i: ', int2str(i), ', j: ', int2str(j) , ', k:', int2str(k)]);
                j = k;
            elseif parseRec(i, j) ~= 1
                j = parseRec(i, j);
            else
                j = j + 1;
            end
        else
            j = j + 1;
        end
    end
end

%% draw

% show on 
figure(1)
hold on
imshow(mix);
title(['sigma' '=' int2str(sigma)]);
for i = 1:pInd-1
    line(pths{i}{1}, pths{i}{2}:pths{i}{3}, 'LineWidth', 1, 'Color', 'r');
end
hold off

% show gray image with path
figure(2)
hold on
s = rescale(scaleConv);
imshow(s);
title(['sigma' '=' int2str(sigma)]);
for i = 1:pInd-1
    line(pths{i}{1}, pths{i}{2}:pths{i}{3}, 'LineWidth', 1, 'Color', 'r');
end
hold off

% show on 2nd marked img
figure(3)
hold on
imshow(marked3);
title(['sigma' '=' int2str(sigma)]);
for i = 1:pInd-1
    line(pths{i}{1}, pths{i}{2}:pths{i}{3}, 'LineWidth', 1, 'Color', 'r');
end
hold off

% show on 3rd marked img
figure(4)
hold on
imshow(marked3);
title(['sigma' '=' int2str(sigma)]);
for i = 1:pInd-1
    line(pths{i}{1}, pths{i}{2}:pths{i}{3}, 'LineWidth', 1, 'Color', 'r');
end
hold off

