function [pointlist] = sortpointlist(pointlist)
%����lengthofcrack�ĸ������������Ǽܵ��б��������������
[n,m]=size(pointlist);
sum=zeros(n,1);

for i=1:n
    sum(i)=pointlist(n,1)+pointlist(n,2);
end

for i=1:n-1 
    for j=i+1:n
        if sum(i)>sum(j)
            t=sum(j);
            sum(j)=sum(i);
            sum(i)=t;
            
            t=pointlist(j,1);
            pointlist(j,1)=pointlist(i,1);
            pointlist(i,1)=t;
            
            t=pointlist(j,2);
            pointlist(j,2)=pointlist(i,2);
            pointlist(i,2)=t;        
        end
    end
end


end

