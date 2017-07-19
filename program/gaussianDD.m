function [x, posResult] = gaussianDD(sigma)
    x = linspace(0-4*sigma,  4*sigma, 8*sigma+1); % 100 points
    gdd = @(x)(x.^2-sigma.^2)/(exp(x.^2/(2*sigma.^2))*sqrt(2*pi)*sigma.^5);
    posResult = zeros(1,8*sigma+1);
    for i = 1:size(x,2)
        posResult(i) = -feval(gdd, x(i));
    end
    plot(x,posResult)
end

