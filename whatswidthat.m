function [width] = whatswidthat(crack,x0,y0)
%是widthofcrack的辅助函数，用于求单点裂缝宽度，
%输入变量 crack为裂缝主体二值图像；x0，y0为骨架点（x对应行）；
%输出width为x0,y0处的单点裂缝宽度

[n,m]=size(crack);
if x0>n||y0>m
    width=0;
    return;
end
%%
%%0度
x1=x0;y1=y0;
x2=x0;y2=y0;
y1l=y1-1;
y2l=m-y2;

if y1==1
    y1=1;
else
    for i=1:y1l
        if crack(x1,y1-1)==0
            break;
        end
        y1=y1-1;
    end
end

if y2==m
    y2=m;
else
    for i=1:y2l
        if crack(x2,y2+1)==0
            break;
        end
        y2=y2+1;
    end
end

width0=y2-y1;
%%
%%00度
x1=x0;y1=y0;
x2=x0;y2=y0;
x1l=x1-1;
x2l=n-x2;

if x1==1
    x1=1;
else
    for i=1:x1l
        if crack(x1-1,y1)==0
            break;
        end
        x1=x1-1;
    end
end

if x2==n
    x2=n;
else
    for i=1:x2l
        if crack(x2+1,y2)==0
            break;
        end
        x2=x2+1;
    end
end

width90=x2-x1;

%%
%%45度,x1-,y1+;x2+,y2-;
x1=x0;y1=y0;
x2=x0;y2=y0;
l1=min([x1-1,m-y1]);
l2=min([n-x2,y2-1]);

if x1==1
    x1=1;
elseif y1==m
    y1=m;      
else 
    for i=1:l1
        if crack(x1-1,y1+1)==0
            break;
        end
        x1=x1-1;
        y1=y1+1;
    end
end

if x2==n
    x2=n;
elseif y2==1
    y2=1;    
else 
    for i=1:l2
        if crack(x2+1,y2-1)==0
            break;
        end
        x2=x2+1;
        y2=y2-1;
    end
end

width45=sqrt((x1-x2)^2+(y1-y2)^2);

%%
%%135度,x1+,y1-;x2-,y2+;
x1=x0;y1=y0;
x2=x0;y2=y0;
l1=min([n-x1,y1-1]);
l2=min([x2-1,m-y2]);

if x1==n
    x1=n;
elseif y1==1
    y1=1;      
else 
    for i=1:l1
        if crack(x1+1,y1-1)==0
            break;
        end
        x1=x1+1;
        y1=y1-1;
    end
end

if x2==1
    x2=1;
elseif y2==m
    y2=m;    
else 
    for i=1:l2
        if crack(x2-1,y2+1)==0
            break;
        end
        x2=x2-1;
        y2=y2+1;
    end
end

width135=sqrt((x1-x2)^2+(y1-y2)^2);
%%
%width=width90;
width=min([width0,width90,width45,width135]);
end

