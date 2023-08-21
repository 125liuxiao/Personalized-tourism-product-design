%% 计算单个染色体的游客期望、时间成本和货币成本
% 输入chrom：单个染色体
% 输入P：每个物品的价值
% 输入R：每个物品的体积
% 输入C：每个物品质量
% 输出sumP：单个染色体的游客期望
% 输出sumR：单个染色体的时间成本
% 输出sumC：单个染色体的时间成本
function [sumP,sumR,sumC]=chromPRC(chrom,P,R,C)
kinds=size(P,2);    
sumP=0;             %单个染色体的游客期望
sumR=0;             %单个染色体的时间成本
sumC=0;             %单个染色体的时间成本
for i=1:kinds
    sumP=sumP+P(chrom(i),i);
    sumR=sumR+R(chrom(i),i);
    sumC=sumC+C(chrom(i),i);
end
end

