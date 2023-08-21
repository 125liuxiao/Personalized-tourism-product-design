
clear;clc;format compact;tic;hold on

%% 创建数据
load data
cap=20000; 

%% 参数设置
NIND=50;        %种群大小
MAXGEN=200;     %迭代次数
Pc=0.8;         %交叉概率
Pm=0.03;        %变异概率

%% 初始化种群
Chrom=InitPop(NIND,C,cap);

%% 优化
gen=0;
while gen<MAXGEN
    %交叉操作
    SelCh=Recombin(Chrom,Pc);
    %变异
    SelCh=Mutate(SelCh,Pm);
    %越界处理/种群合并
    [SelCh,flag]=adjustChrom(SelCh,C,cap);
    SelCh=[Chrom;SelCh];
    %计算目标函数值，游客期望、时间成本和金钱成本
    allObj=allObject(SelCh,P,R,C);
    functionvalue=allObj(:,1:3);%此处需要改成三个目标函数值
    %非支配排序
    frontvalue=Non_DS(functionvalue);
    %计算拥挤距离/选出下一代个体
    fnum=0;                                                                 %当前前沿面
    while numel(frontvalue,frontvalue<=fnum+1)<=NIND                        %判断前多少个面的个体能完全放入下一代种群
        fnum=fnum+1;
    end
    %如果SelCh中第一前沿面个体数目不大于NIND
    newnum=numel(frontvalue,frontvalue<=fnum);                              %前fnum个面的个体数
    Chrom(1:newnum,:)=SelCh(frontvalue<=fnum,:);                            %将前fnum个面的个体复制入下一代
    if newnum<NIND
        popu=find(frontvalue==fnum+1);                                          %popu记录第fnum+1个面上的个体编号
        distancevalue=CD_Assign(functionvalue,frontvalue,fnum+1);               %计算拥挤距离
        popu=-sortrows(-[distancevalue';popu']')';                                %按拥挤距离降序排序第fnum+1个面上的个体
        Chrom(newnum+1:NIND,:)=SelCh(popu(2,1:NIND-newnum),:);                  %将第fnum+1个面上拥挤距离较大的前NIND-newnum个个体复制入下一代
    end
    %更新迭代次数
    gen=gen+1 ;
end
%% 找出最优解
%---程序输出
fprintf('已完成,耗时%4s秒\n',num2str(toc));                 %程序最终耗时
best_Chrom=SelCh(frontvalue==1,:);                          %最优个体
best_Chrom=unique(best_Chrom,'rows');                       %删除重复数组对
bestObj=allObject(best_Chrom,P,R,C);
output=bestObj(:,1:3);                                      %最终结果:种群中非支配解的函数值
scatter3(output(:,1),output(:,2),output(:,3),'o')




