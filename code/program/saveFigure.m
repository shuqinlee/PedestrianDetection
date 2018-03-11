function saveFigure(num, fileName)
figure(num);
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 12.8 36.6]);
% print -djpeg path.jpg -r500
print(fileName, '-dpng', '-r500')
 
end