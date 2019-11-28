function [xw,yw] = uv2xy(u,v)
%这是从图像坐标转变为世界坐标的函数，其中单应性逆矩阵为全局变量；

global hves;

xw=(hves(1,1)*u+hves(1,2)*v+hves(1,3))/((hves(3,1)*u+hves(3,2)*v+hves(3,3)));
yw=(hves(2,1)*u+hves(2,2)*v+hves(2,3))/((hves(3,1)*u+hves(3,2)*v+hves(3,3)));

end

