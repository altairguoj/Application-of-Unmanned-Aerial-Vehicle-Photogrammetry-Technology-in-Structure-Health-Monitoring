function [l] = lenthofcrack(img_crackskel)
%这是由裂缝骨架二值图像img_crackskel得到裂缝长度l的函数
    l=0;
    img_crackskel=bwmorph(img_crackskel,'bridge');
    [L,num] = bwlabel(img_crackskel,8);
    state=regionprops(L,'PixelList');
    
    pointlist = state.PixelList;
    numofpointinskel=size(pointlist,1);
    pointlist=sortpointlist(pointlist);
    
    for j=1:numofpointinskel-1
        di=sqrt((pointlist(j,1)-pointlist(j+1,1))^2+(pointlist(j,2)-pointlist(j+1,2))^2);
        if di>sqrt(2)
            di=sqrt(2);
        end
        l=l+di;
    end
 
end

