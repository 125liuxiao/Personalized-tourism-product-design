clear;clc;format compact;tic;hold on


%% 创建数据
load data
cap=20000; %成本20000

%% 参数设置
NIND=50;        %种群大小
MAXGEN=200;     %迭代次数
Pc=0.8;         %交叉概率
Pm=0.03;        %变异概率

%% 初始化种群
Chrom=InitPop1(NIND,C,cap);
%{
%交叉操作
SelCh=Recombin(Chrom,Pc);

function SelCh=Recombin1(SelCh,Pc)
NSel=size(SelCh,1);
for i=1:2:NSel-mod(NSel,2)%2表示步长
    if Pc>=rand %交叉概率Pc
        [SelCh(i,:),SelCh(i+1,:)]=intercross(SelCh(i,:),SelCh(i+1,:));
    end
end

function [a,b]=intercross(a,b)
L=length(a);
r1=randsrc(1,1,[1:L]);
r2=randsrc(1,1,[1:L]);
if r1~=r2
    a0=a;b0=b;
    s=min([r1,r2]);
    e=max([r1,r2]);
    for i=s:e
        a1=a;b1=b;
        a(i)=b0(i);
        b(i)=a0(i);
        %{
        x=find(a==a(i));
        y=find(b==b(i));
        i1=x(x~=i);
        i2=y(y~=i);
        if ~isempty(i1)
            a(i1)=a1(i);
        end
        if ~isempty(i2)
            b(i2)=b1(i);
        end
        %}
    end
end