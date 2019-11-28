function [d,fai] = cameraposition(l1,l2)
%这是由激光测距仪得到的数据l1,l2,计算相机位置的函数

alpha=9.260709026;l0=266.334535;%这是两项校准数据
beta=85.36964549;
if l2<l1
    temp=l2;
    l2=l1;
    l1=temp;
end
fai=atand(((l2-l1)*sind(beta))/(2*(l2+l0)*sind(alpha/2)-(l2-l1)*cosd(beta)));
d=l2*cosd(alpha/2)-(l2+l0)*sind(alpha/2)*tand(fai);
end

