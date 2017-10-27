function in = traceOnImg(color, tracePth, mpPth, destPth)
in = imread(mpPth);
t = load(tracePth);
trace = t.pths;
for i = 1 : size(trace, 2) - 1
    ff = trace{i}{2};
    bb = trace{i}{3};
    for j = ff: bb
        in(j, trace{i}{1}(j - ff + 1), :) = color;
    end
end

save([destPth, 'traceImg.png'], 'in');