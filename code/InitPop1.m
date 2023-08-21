function Chrom=InitPop1(NIND,C,cap)
N=size(C,2);    %物品种类数目
Chrom=zeros(NIND,N);%用于存储种群
for i=1:NIND
    Chrom(i,:)=encode1(C,cap);%随机生成初始种群
end
