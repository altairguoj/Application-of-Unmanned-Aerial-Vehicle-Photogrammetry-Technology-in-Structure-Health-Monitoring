function [d,fai] = cameraposition(l1,l2)
%�����ɼ������ǵõ�������l1,l2,�������λ�õĺ���

alpha=9.260709026;l0=266.334535;%��������У׼����
beta=85.36964549;
if l2<l1
    temp=l2;
    l2=l1;
    l1=temp;
end
fai=atand(((l2-l1)*sind(beta))/(2*(l2+l0)*sind(alpha/2)-(l2-l1)*cosd(beta)));
d=l2*cosd(alpha/2)-(l2+l0)*sind(alpha/2)*tand(fai);
end

