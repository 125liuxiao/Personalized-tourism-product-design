%% ���㵥��Ⱦɫ����ο�������ʱ��ɱ��ͻ��ҳɱ�
% ����chrom������Ⱦɫ��
% ����P��ÿ����Ʒ�ļ�ֵ
% ����R��ÿ����Ʒ�����
% ����C��ÿ����Ʒ����
% ���sumP������Ⱦɫ����ο�����
% ���sumR������Ⱦɫ���ʱ��ɱ�
% ���sumC������Ⱦɫ���ʱ��ɱ�
function [sumP,sumR,sumC]=chromPRC(chrom,P,R,C)
kinds=size(P,2);    
sumP=0;             %����Ⱦɫ����ο�����
sumR=0;             %����Ⱦɫ���ʱ��ɱ�
sumC=0;             %����Ⱦɫ���ʱ��ɱ�
for i=1:kinds
    sumP=sumP+P(chrom(i),i);
    sumR=sumR+R(chrom(i),i);
    sumC=sumC+C(chrom(i),i);
end
end

