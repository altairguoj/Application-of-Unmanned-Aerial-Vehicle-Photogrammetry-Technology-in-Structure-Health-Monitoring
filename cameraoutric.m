function [outric] = cameraoutric(d,fai)
%���������λ�ý��������ξ���ĺ���

    outric=zeros(4,3);
    outric(2,2)=1;
    outric(4,3)=1;
    outric(1,1)=-cosd(fai);
    outric(3,1)=sind(fai);  
    outric(3,3)=d;

end

