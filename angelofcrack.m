function [a] = angelofcrack(img_crackmain)
%�������ѷ������ֵͼ��img_main �õ��ѷ�����a�ĺ���

    theta=0:179;
    [R,xp]=radon(img_crackmain,theta);
    
    maxvolume=max(max(R));
    [rows,cols]=find(maxvolume==R);
    a=cols-90; 
    if a<0
        a=a+180;
    end

end

