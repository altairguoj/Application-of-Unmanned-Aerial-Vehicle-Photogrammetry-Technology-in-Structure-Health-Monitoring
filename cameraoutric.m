function [outric] = cameraoutric(d,fai)
%这是由相机位置建立相机外参矩阵的函数

    outric=zeros(4,3);
    outric(2,2)=1;
    outric(4,3)=1;
    outric(1,1)=-cosd(fai);
    outric(3,1)=sind(fai);  
    outric(3,3)=d;

end

