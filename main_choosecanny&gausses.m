clc
clear all




%%���ݶ�ȡ ����������./var�ļ�����;ͼƬ������./img�ļ�����

imgreadpath='./img/crack_0127.jpg';%��ȡͼ��
img_origin1=imread(imgreadpath);
figure(1);
imshow(img_origin1);
[x,y] = ginput(2); %ͼ��ü�
img_origin=imcrop(img_origin1,[x(1),y(1),abs(x(1)-x(2)),abs(y(1)-y(2))]);
figure(2);
hs = tight_subplot(2,5,[0.01,0.01], [0.01, 0.01], [0.01, 0.01]);
load('./var/calibrationSession.mat')%��ȡ�������,������ΪcalibrationSession

%%�ڲ�����ν���
global intric
intric=calibrationSession.CameraParameters.IntrinsicMatrix;%�����ڲξ���

l1=8291;%���뼤�����ǵĲ������ݣ���λmm
l2=7454;
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


%%�ҶȻ�
img_gray=rgb2gray(img_undistort);


%%�˲�
img_filter=mophology_filter(img_gray);
img_filter=median_filter(img_filter,3);

for ip=1:10


%%ͼ��ָ�,�õ�crackmain�����ֵͼ
[low,h]=whatscannylh(img_filter,1+0.1*ip);
img_cannyplus=edge(img_filter,'canny',h,1);
img_crackmain=eage2main(img_cannyplus,10);


%%ͼ��ϸ�����õ�crackskel�Ǽܶ�ֵͼ
img_crackskel= bwmorph(img_crackmain,'thin',inf);


%%��������Ǽܵ��ӵ�ԭͼ
img_crackcombine=mainskelonorigin(img_crackmain,img_crackskel,img_origin);


%%�ѷ켸��������ȡ
angle=angelofcrack(img_crackmain);%�Ƕ�
lenth=lenthofcrack(img_crackskel);%����
[meanwidth,maxwidth]=widthofcrack(img_crackmain,img_crackskel);%ƽ��������ȣ�
meanwidthmm=meanwidth*jm;
axes(hs(ip));
imshow(img_crackcombine);
xlabel(num2str(meanwidthmm));
end
