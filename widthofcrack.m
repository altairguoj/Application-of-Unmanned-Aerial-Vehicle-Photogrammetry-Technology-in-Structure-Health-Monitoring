function [meanwidth,maxwidth] = widthofcrack(imgmain,imgskel)
%这是由裂缝主体二值图像与裂缝骨架二值图像 得到平均与最大裂缝宽度的，方法为去除假点

    k=5;%边缘假点范围（pix）
    [n,m]=size(imgmain);
    [L,num] = bwlabel(imgskel,8);
    state=regionprops(L,'PixelList');
    pointlist=state.PixelList;
    
    id=pointlist(:,1)<k|pointlist(:,1)>m-k|pointlist(:,2)<k|pointlist(:,2)>n-k;
    pointlist(id,:)=[];
    
    [numofpoint,nus]=size(pointlist);
    widthlist=zeros(numofpoint,1);
    for j=1:numofpoint
        y=pointlist(j,1);
        x=pointlist(j,2);    
        widthlist(j)=whatswidthat(imgmain,x,y);
    end
    
    maxwidth=0;
    sum=0;
    
    for i=1:numofpoint
        if widthlist(i)>maxwidth
            maxwidth=widthlist(i);
        end
        sum=sum+widthlist(i);
    end
    meanwidth=sum/numofpoint;


end

