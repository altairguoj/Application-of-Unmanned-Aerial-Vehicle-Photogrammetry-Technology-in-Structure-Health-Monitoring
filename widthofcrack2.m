function [meanwidth,maxwidth] = widthofcrack2(imgmain,imgskel)
%这是由裂缝主体二值图像与裂缝骨架二值图像 得到平均与最大裂缝宽度的
%方法为统计处理裂缝宽度列表，取众值+-标准差范围内的宽度值计算；适用于低像素解析度的图片

    [L,num] = bwlabel(imgskel,8);
    state=regionprops(L,'PixelList');
    pointlist=state.PixelList;
    
    
    numofpoint=size(pointlist,1);
    widthlist=zeros(numofpoint,1);
    for j=1:numofpoint
        y=pointlist(j,1);
        x=pointlist(j,2);    
        widthlist(j)=whatswidthat(imgmain,x,y);
    end
    
    widthist=HistRate(widthlist);
    nn=size(widthist,1);
    %众值
    krate=widthist(1,2);%初始化众值
    k=widthist(1,1);
    for i=1:nn
        if widthist(i,2)>krate
            krate=widthist(i,2);
            k=widthist(i,1);
        end
    end
    
    
    %众值标准差
    sumofe2=0;
    for i=1:nn
        sumofe2=sumofe2+widthist(i,2)*((widthist(i,1)-k)^2);
    end
    e2=sumofe2/numofpoint;
    e=sqrt(e2);
    
    %最大与平均宽度
    maxwidth=k+e;
    
    id=widthlist(:,1)<k-e|widthlist(:,1)>k+e;
    widthlist(id,:)=[];
    sum=0;
    
    numofwidth=size(widthlist,1);
    for i=1:numofwidth
        sum=sum+widthlist(i);
    end
    meanwidth=sum/numofwidth;


end

