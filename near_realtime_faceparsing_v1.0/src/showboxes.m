function showboxes(im, boxes, posemap,out_name)

% showboxes(im, boxes)
% Draw boxes on top of image.

imagesc(im);
hold on;
axis image;
axis off;
if boxes(1).coords ~= [-1 -1 -1 -1]
    for b = boxes,
        if isempty(b.s)
            break;
        end;
%         b
        partsize = b.xy(1,3)-b.xy(1,1)+1;
        tx = (min(b.xy(:,1)) + max(b.xy(:,3)))/2;
        ty = min(b.xy(:,2)) - partsize/2;
        text(tx,ty, num2str(posemap(b.c)),'fontsize',18,'color','c');
        for i = size(b.xy,1):-1:1;
            x1 = b.xy(i,1);
            y1 = b.xy(i,2);
            x2 = b.xy(i,3);
            y2 = b.xy(i,4);
%             line([x1 x1 x2 x2 x1]', [y1 y2 y2 y1 y1]', 'color', 'b', 'linewidth', 1);
            
            plot((x1+x2)/2,(y1+y2)/2,'r.','markersize',15);
        end
    end
end
f = getframe(gca);
% if exist(out_fold,'dir') ~= 7
%     mkdir(out_fold);
% end
% strn = [out_fold '/' num2str(fnum) '.png'];
imwrite(f.cdata,[out_name(1:end-4) '_out.png']);
drawnow;
