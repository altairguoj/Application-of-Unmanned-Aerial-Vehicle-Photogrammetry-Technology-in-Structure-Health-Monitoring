function [l,h] = whatscannylh(img,ra)
%这是自适应计算canny高低阈值的函数，算法为：h=直方图极值-最值标准差*ra

[n,v]=imhist(img);
nn=size(v,1);%nn为灰度级数量
nnn=size(img,1);
mmm=size(img,2);
nm=nnn*mmm;

%寻找直方图最大值的灰度级k
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

