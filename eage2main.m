function [img_crackmain] = eage2main(img_cannyplus,k)
%从边缘二值图像变为主体二值图像，即填充边缘之间的像素
%输入变量说明：img_cannyplus为边缘二值图像，k为闭运算窗口半径大小，建议10

    se=strel('disk',k);   
    img_cannyplus_closed=imclose(img_cannyplus,se);
   

   for n = 1:size(img_cannyplus_closed,1)
        for m = 1:size(img_cannyplus_closed,2)
            if img_cannyplus(n,m)==1
                img_cannyplus_closed(n,m) = 0; %将边缘画出来
            end
        end 
   end
   
    img=img_cannyplus_closed;
    [L,num] = bwlabel(img,4);%标注连通域数量

    stats = regionprops(L,'BoundingBox' ,'Area','Centroid' ,'PixelList' ); %统计白色的连通区域
    
    noiseArea=100;

    for j=1:size(stats)
        area = stats(j).Area;                                   %连通区域的面积
        if area<noiseArea                                       %若当前连通区域面积小于噪声点的面积，则该区域设置为0
            pointList = stats(j).PixelList;                     %每个连通区域的像素位置
            rIndex=pointList(:,2);
            cIndex=pointList(:,1);
            img(rIndex,cIndex)=0;                            %连通区域的面积不足noisearea，置为背景颜色
        end
    end
    
    se=strel('disk',2);
    img_crackmain=imclose(img,se);

end

