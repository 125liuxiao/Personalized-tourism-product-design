
%% 计算种群中每个染色体的物品总价值、总体积和总重量
% 输入Chrom：种群
% 输入P：消费者期望
% 输入R：非必要旅游时间
% 输入C：货币成本
% 输出allObj：种群中每个染色体的物品总价值、总体积和总重量NIND行3列，[sumP,sumR,sumC]
function allObj=allObject(Chrom,P,R,C)
NIND=size(Chrom,1); %种群大小
allObj=zeros(NIND,3);%目标值
for i=1:NIND
    [sumP,sumR,sumC]=chromPRC(Chrom(i,:),P,R,C);
    allObj(i,:)=[sumP,sumR,sumC];
end
end

