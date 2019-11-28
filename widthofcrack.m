function [meanwidth,maxwidth] = widthofcrack(imgmain,imgskel)
%�������ѷ������ֵͼ�����ѷ�Ǽܶ�ֵͼ�� �õ�ƽ��������ѷ��ȵģ�����Ϊȥ���ٵ�

    k=5;%��Ե�ٵ㷶Χ��pix��
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

