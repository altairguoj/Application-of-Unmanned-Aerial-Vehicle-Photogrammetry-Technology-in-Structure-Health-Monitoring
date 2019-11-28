clc
clear all




%%���ݶ�ȡ ����������./var�ļ�����;ͼƬ������./img�ļ�����

load('./0127_origin.mat')%��ȡ�������,������ΪcalibrationSession
figure(2);
hs = tight_subplot(2,4,[0.01,0.01], [0.01, 0.01], [0.01, 0.01]);
load('./var/calibrationSession.mat')%��ȡ�������,������ΪcalibrationSession

%%�ڲ�����ν���
global intric
intric=calibrationSession.CameraParameters.IntrinsicMatrix;%�����ڲξ���

l1=8201;%���뼤�����ǵĲ������ݣ���λmm
l2=7606;
[d,fai]=cameraposition(l1,l2);%��ȡ���λ�ã���λmm����
outric=cameraoutric(d,fai);%������ξ���

%%������Ӧ�Ա任
calintric=[intric(1,1)	intric(2,1)	intric(3,1) 0;intric(1,2) intric(2,2) intric(3,2) 0;0 0	1 0];
h=calintric*outric;
global hves;
hves=inv(h);

jm=pixelresolution();

%%����У��
%img_undistort = undistortImage(img_origin,calibrationSession.CameraParameters);
img_undistort=img_origin;
axes(hs(1));
imshow(img_origin);
axes(hs(2));
imshow(img_undistort);

%%�ҶȻ�
img_gray=rgb2gray(img_undistort);

axes(hs(3));
imshow(img_gray);

%%�˲�
img_filter=mophology_filter(img_gray);
img_filter=median_filter(img_filter,3);

axes(hs(4));
imshow(img_filter);

%%ͼ��ָ�,�õ�crackmain�����ֵͼ
[low,h]=whatscannylh(img_filter,1);
img_cannyplus=edge(img_filter,'canny',h,1.6);
img_crackmain=eage2main(img_cannyplus,10);

axes(hs(5));
imshow(img_crackmain);

%%ͼ��ϸ�����õ�crackskel�Ǽܶ�ֵͼ
img_crackskel= bwmorph(img_crackmain,'thin',inf);
axes(hs(6));
imshow(img_crackskel);

%%��������Ǽܵ��ӵ�ԭͼ
img_crackcombine=mainskelonorigin(img_crackmain,img_crackskel,img_origin);
axes(hs(7));
imshow(img_crackcombine);

%%�ѷ켸��������ȡ
angle=angelofcrack(img_crackmain);%�Ƕ�
lenth=lenthofcrack(img_crackskel);%����
[meanwidth,maxwidth]=widthofcrack2(img_crackmain,img_crackskel);%ƽ��������ȣ�

