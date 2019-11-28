function [a] = angelofcrack(img_crackmain)
%这是由裂缝主体二值图像img_main 得到裂缝走向a的函数

    theta=0:179;
    [R,xp]=radon(img_crackmain,theta);
    
    maxvolume=max(max(R));
    [rows,cols]=find(maxvolume==R);
    a=cols-90; 
    if a<0
        a=a+180;
    end

end

