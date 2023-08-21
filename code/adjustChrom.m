
function [newChrom,flag]=adjustChrom(Chrom,C,cap)
flag=0;
NIND=size(Chrom,1);   %NIND种群大小
newChrom=Chrom;
for i=1:NIND
    [newChrom(i,:),f]=repair(Chrom(i,:),C,cap);
end
if sum(f)>0
    flag=1;
end
end

