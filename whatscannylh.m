function [l,h] = whatscannylh(img,ra)
%��������Ӧ����canny�ߵ���ֵ�ĺ������㷨Ϊ��h=ֱ��ͼ��ֵ-��ֵ��׼��*ra

[n,v]=imhist(img);
nn=size(v,1);%nnΪ�Ҷȼ�����
nnn=size(img,1);
mmm=size(img,2);
nm=nnn*mmm;

%Ѱ��ֱ��ͼ���ֵ�ĻҶȼ�k
k=1;
for i=1:nn
    if n(k)<=n(i)
        k=i;
    end      
end

sumofe2=0;

for i=1:nn
    sumofe2=sumofe2+n(i)*((v(i)-v(k))^2);
end

e2=sumofe2/nm;
e=sqrt(e2);

h=(k-ra*e)/nn;
l=0.4*h;

end

