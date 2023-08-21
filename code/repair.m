

function [chromR,flag]=repair(chrom,C,cap)
flag=0;
kinds=size(C,2);    %物品种类数目
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
            chromR(sortI(j))=minI;   %更新个体
            sumW=sumW+minW;
            break
        else
            sumW=sumW+weightPack(sortI(j));    %更新
        end
    end
    %如果按照上述过程修复，依然不能满足约束，则重新编码
    if sumW>cap || sumW<0
        chromR=encode(C,cap);
    end
    
end
end

