

function [chromR,flag]=repair(chrom,C,cap)
flag=0;
kinds=size(C,2);    %��Ʒ������Ŀ
nums=size(C,1); 
weightPack=zeros(1,kinds);  
chromR=chrom;
for i=1:kinds
    weightPack(i)=C(chrom(i),i);
end
sumW=sum(weightPack);  
[sortW,sortI]=sort(weightPack,'descend'); 
if sumW>cap || sumW<0
    flag=1;
    for j=1:kinds
        sumW=sumW-weightPack(sortI(j));   
        weightCon=C(:,sortI(j));   
        [minW,minI]=min(weightCon); 
        if (sumW+minW<=cap)&&(minI~=chrom(sortI(j)))
            chromR(sortI(j))=minI;   %���¸���
            sumW=sumW+minW;
            break
        else
            sumW=sumW+weightPack(sortI(j));    %����
        end
    end
    %����������������޸�����Ȼ��������Լ���������±���
    if sumW>cap || sumW<0
        chromR=encode(C,cap);
    end
    
end
end

