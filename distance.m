function [d] = distance(x1,y1,x2,y2)
%这是一个辅助函数，计算两点（x1,y1）与(x2,y2)欧式距离
d2=(x1-x2)^2+(y1-y2)^2;
d=sqrt(d2);

end

