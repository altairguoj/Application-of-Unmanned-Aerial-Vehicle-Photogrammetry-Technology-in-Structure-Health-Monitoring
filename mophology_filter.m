function [H] = mophology_filter(im)
%�������ñ�任ͼ����ǿ����

se=strel('disk',10);
H1=imtophat(im,se);
H2=imbothat(im,se);
H=(im+H1)-H2;


end

