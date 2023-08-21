
clear;clc;format compact;tic;hold on

%% ��������
load data
cap=20000; 

%% ��������
NIND=50;        %��Ⱥ��С
MAXGEN=200;     %��������
Pc=0.8;         %�������
Pm=0.03;        %�������

%% ��ʼ����Ⱥ
Chrom=InitPop(NIND,C,cap);

%% �Ż�
gen=0;
while gen<MAXGEN
    %�������
    SelCh=Recombin(Chrom,Pc);
    %����
    SelCh=Mutate(SelCh,Pm);
    %Խ�紦��/��Ⱥ�ϲ�
    [SelCh,flag]=adjustChrom(SelCh,C,cap);
    SelCh=[Chrom;SelCh];
    %����Ŀ�꺯��ֵ���ο�������ʱ��ɱ��ͽ�Ǯ�ɱ�
    allObj=allObject(SelCh,P,R,C);
    functionvalue=allObj(:,1:3);%�˴���Ҫ�ĳ�����Ŀ�꺯��ֵ
    %��֧������
    frontvalue=Non_DS(functionvalue);
    %����ӵ������/ѡ����һ������
    fnum=0;                                                                 %��ǰǰ����
    while numel(frontvalue,frontvalue<=fnum+1)<=NIND                        %�ж�ǰ���ٸ���ĸ�������ȫ������һ����Ⱥ
        fnum=fnum+1;
    end
    %���SelCh�е�һǰ���������Ŀ������NIND
    newnum=numel(frontvalue,frontvalue<=fnum);                              %ǰfnum����ĸ�����
    Chrom(1:newnum,:)=SelCh(frontvalue<=fnum,:);                            %��ǰfnum����ĸ��帴������һ��
    if newnum<NIND
        popu=find(frontvalue==fnum+1);                                          %popu��¼��fnum+1�����ϵĸ�����
        distancevalue=CD_Assign(functionvalue,frontvalue,fnum+1);               %����ӵ������
        popu=-sortrows(-[distancevalue';popu']')';                                %��ӵ�����뽵�������fnum+1�����ϵĸ���
        Chrom(newnum+1:NIND,:)=SelCh(popu(2,1:NIND-newnum),:);                  %����fnum+1������ӵ������ϴ��ǰNIND-newnum�����帴������һ��
    end
    %���µ�������
    gen=gen+1 ;
end
%% �ҳ����Ž�
%---�������
fprintf('�����,��ʱ%4s��\n',num2str(toc));                 %�������պ�ʱ
best_Chrom=SelCh(frontvalue==1,:);                          %���Ÿ���
best_Chrom=unique(best_Chrom,'rows');                       %ɾ���ظ������
bestObj=allObject(best_Chrom,P,R,C);
output=bestObj(:,1:3);                                      %���ս��:��Ⱥ�з�֧���ĺ���ֵ
scatter3(output(:,1),output(:,2),output(:,3),'o')




