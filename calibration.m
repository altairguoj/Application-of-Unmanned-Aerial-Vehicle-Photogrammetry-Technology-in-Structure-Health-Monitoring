imgfilenames={'./calimg/01',...'./calimg/02',...};%�궨ͼƬ��λ�ã�15-20������
d=25;%���̸�Ĵ�С����λΪmm
cameraparameters=cali(imgfilenames,d);
savepath='./var/cameraparameters.mat';
save (savepath,'cameraparameters');
