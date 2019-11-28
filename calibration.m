imgfilenames={'./calimg/01',...'./calimg/02',...};%标定图片的位置，15-20张左右
d=25;%棋盘格的大小，单位为mm
cameraparameters=cali(imgfilenames,d);
savepath='./var/cameraparameters.mat';
save (savepath,'cameraparameters');
