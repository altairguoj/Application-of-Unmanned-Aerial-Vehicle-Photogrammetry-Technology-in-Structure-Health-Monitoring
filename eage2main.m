function [img_crackmain] = eage2main(img_cannyplus,k)
%�ӱ�Ե��ֵͼ���Ϊ�����ֵͼ�񣬼�����Ե֮�������
%�������˵����img_cannyplusΪ��Ե��ֵͼ��kΪ�����㴰�ڰ뾶��С������10

    se=strel('disk',k);   
    img_cannyplus_closed=imclose(img_cannyplus,se);
   

   for n = 1:size(img_cannyplus_closed,1)
        for m = 1:size(img_cannyplus_closed,2)
            if img_cannyplus(n,m)==1
                img_cannyplus_closed(n,m) = 0; %����Ե������
            end
        end 
   end
   
    img=img_cannyplus_closed;
    [L,num] = bwlabel(img,4);%��ע��ͨ������

    stats = regionprops(L,'BoundingBox' ,'Area','Centroid' ,'PixelList' ); %ͳ�ư�ɫ����ͨ����
    
    noiseArea=100;

    for j=1:size(stats)
        area = stats(j).Area;                                   %��ͨ��������
        if area<noiseArea                                       %����ǰ��ͨ�������С�������������������������Ϊ0
            pointList = stats(j).PixelList;                     %ÿ����ͨ���������λ��
            rIndex=pointList(:,2);
            cIndex=pointList(:,1);
            img(rIndex,cIndex)=0;                            %��ͨ������������noisearea����Ϊ������ɫ
        end
    end
    
    se=strel('disk',2);
    img_crackmain=imclose(img,se);

end

