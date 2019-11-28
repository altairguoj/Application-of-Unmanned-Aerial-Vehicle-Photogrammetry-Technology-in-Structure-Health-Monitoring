clc
clear all




%%数据读取 变量保存在./var文件夹中;图片保存在./img文件夹中

load('./0127_origin.mat')%读取相机参数,变量名为calibrationSession
figure(2);
hs = tight_subplot(2,4,[0.01,0.01], [0.01, 0.01], [0.01, 0.01]);
load('./var/calibrationSession.mat')%读取相机参数,变量名为calibrationSession

%%内参与外参建立
global intric
intric=calibrationSession.CameraParameters.IntrinsicMatrix;%建立内参矩阵

l1=8201;%输入激光测距仪的测量数据，单位mm
l2=7606;
[d,fai]=cameraposition(l1,l2);%获取相机位置，单位mm，°
outric=cameraoutric(d,fai);%建立外参矩阵

%%建立单应性变换
calintric=[intric(1,1)	intric(2,1)	intric(3,1) 0;intric(1,2) intric(2,2) intric(3,2) 0;0 0	1 0];
h=calintric*outric;
global hves;
hves=inv(h);

jm=pixelresolution();

%%畸变校正
%img_undistort = undistortImage(img_origin,calibrationSession.CameraParameters);
img_undistort=img_origin;
axes(hs(1));
imshow(img_origin);
axes(hs(2));
imshow(img_undistort);

%%灰度化
img_gray=rgb2gray(img_undistort);

axes(hs(3));
imshow(img_gray);

%%滤波
img_filter=mophology_filter(img_gray);
img_filter=median_filter(img_filter,3);

axes(hs(4));
imshow(img_filter);

%%图像分割,得到crackmain主体二值图
[low,h]=whatscannylh(img_filter,1);
img_cannyplus=edge(img_filter,'canny',h,1.6);
img_crackmain=eage2main(img_cannyplus,10);

axes(hs(5));
imshow(img_crackmain);

%%图像细化，得到crackskel骨架二值图
img_crackskel= bwmorph(img_crackmain,'thin',inf);
axes(hs(6));
imshow(img_crackskel);

%%将主体与骨架叠加到原图
img_crackcombine=mainskelonorigin(img_crackmain,img_crackskel,img_origin);
axes(hs(7));
imshow(img_crackcombine);

%%裂缝几何特征提取
angle=angelofcrack(img_crackmain);%角度
lenth=lenthofcrack(img_crackskel);%长度
[meanwidth,maxwidth]=widthofcrack2(img_crackmain,img_crackskel);%平均与最大宽度；

