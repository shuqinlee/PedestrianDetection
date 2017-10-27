s = 200;

a = ones(s, s, 3);

red = [255, 0, 0];
for i = 1: size(a, 1)
    for j = 1:size(a, 2)
        a(i, j, :) = red;
%         for k = 1:size(a, 3)
%             a(i, j, k) = red(k);
%         end
    end
end

imshow(a);