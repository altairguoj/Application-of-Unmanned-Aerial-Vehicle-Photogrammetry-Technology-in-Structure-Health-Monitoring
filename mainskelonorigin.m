function [img_combine] = mainskelonorigin(img_crackmain,img_crackskel,img_origin)
%����һ�����Ǽܣ����帲�ǵ�ԭͼ�ϵĺ���

img_combine=img_origin;

%mainΪ��ɫ
    for n = 1:size(img_origin,1)
        for m = 1:size(img_origin,2)
            if img_crackmain(n,m)==1
                img_combine(n,m,1) = 255;
                img_combine(n,m,2) = 0;
                img_combine(n,m,3) = 0;
                
            end
         end 
    end

%skelΪ��ɫ
      for n = 1:size(img_origin,1)
        for m = 1:size(img_origin,2)
            if img_crackskel(n,m)==1
                img_combine(n,m,1) = 0;
                img_combine(n,m,2) = 255;
                img_combine(n,m,3) = 0;
                
            end
        end 
      end
end

