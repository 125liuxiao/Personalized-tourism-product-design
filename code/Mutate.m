%
%      @���ߣ�����390
%      @΢�Ź��ںţ��Ż��㷨������
%
%% �������
%���룺
%SelCh  ��ѡ��ĸ���
%Pm     �������
%�����
% SelCh �����ĸ���
function SelCh=Mutate(SelCh,Pm)
[NSel,L]=size(SelCh);
for i=1:NSel
    if Pm>=rand
        A1=randi([1 23]);
        A2=randi([1 3]);
        A3=randi([1 4]);
        A4=randi([1 3]);
        A5=randi([1 3]);
        R=[A1,A2,A3,A4,A5];
        for j=1:L
            SelCh(i,j)=R(1,j);
        end
    end
end
