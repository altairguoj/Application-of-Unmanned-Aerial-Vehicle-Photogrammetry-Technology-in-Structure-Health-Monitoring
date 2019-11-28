function [meanwidth,maxwidth] = widthofcrack2(imgmain,imgskel)
%�������ѷ������ֵͼ�����ѷ�Ǽܶ�ֵͼ�� �õ�ƽ��������ѷ��ȵ�
%����Ϊͳ�ƴ����ѷ����б�ȡ��ֵ+-��׼�Χ�ڵĿ��ֵ���㣻�����ڵ����ؽ����ȵ�ͼƬ

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
    %��ֵ
    krate=widthist(1,2);%��ʼ����ֵ
    k=widthist(1,1);
    for i=1:nn
        if widthist(i,2)>krate
            krate=widthist(i,2);
            k=widthist(i,1);
        end
    end
    
    
    %��ֵ��׼��
    sumofe2=0;
    for i=1:nn
        sumofe2=sumofe2+widthist(i,2)*((widthist(i,1)-k)^2);
    end
    e2=sumofe2/numofpoint;
    e=sqrt(e2);
    
    %�����ƽ�����
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

