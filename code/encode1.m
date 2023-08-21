
%scatter3(output(:,1),output(:,2),output(:,3),'filled')

%编码
function chrom=encode1(C,cap)
kinds=size(C,2);    %物品种类数目6，旅游产品属性
nums=size(C,1); %每类物品所包含具体物品的数目取值水平不同
chrom=zeros(1,kinds);   %个体初始化
sumW=0; %初始个体所表示的物品总重量
while 1 %while 1表示判断表达式永远为真
    for i=1:kinds
        chrom(i)=ceil(rand*nums);%ceil()向上取整函数
        sumW=sumW+C(chrom(i),i);
    end
    if 0<=sumW && sumW<=cap 
        break
    else
        sumW=0;
    end
end
end
        