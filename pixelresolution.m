function [jm] = pixelresolution()
%�����ɲ���ǵľ����������ƽ�����ؽ����ȵĺ�������main�е���
global intric;

u0=intric(1,3);
v0=intric(2,3);

[xw1,yw1]=uv2xy(u0,v0);
[xw2,yw2]=uv2xy(u0+1,v0);
[xw3,yw3]=uv2xy(u0,v0+1);

ju=distance(xw1,yw1,xw2,yw2);
jv=distance(xw1,yw1,xw3,yw3);
jm=(ju+jv)/2;

end

