%% ��֧������
% ����functionvalue
% ���frontvalue��ÿ�������ǰ������
%˼·������ÿ�����壬��¼��������֧��ø��������Ŀ����ǰ������=����Ŀ+1
function frontvalue=Non_DS(functionvalue)
fnum=0;                                             %��ǰ�����ǰ������
N=size(functionvalue,1);                            %������Ŀ
frontvalue=zeros(N,1);                              %ÿ�������ǰ������
cz=false(N,1);                                      %��¼�����Ƿ��ѱ�������
while ~all(cz)                                      %��ʼ�����ж�ÿ�������ǰ����,���øĽ���deductive sort
    fnum=fnum+1;
    for i=1:N
        if ~cz(i)
            dominate_num=0;                         %��¼֧���i���������Ŀ
            for j=1:N
                if ~cz(j)
                    if i~=j
                        if ((functionvalue(j,1)>functionvalue(i,1))&&(functionvalue(j,2)<functionvalue(i,2))&&(functionvalue(j,3)<functionvalue(i,3)))...
                                ||((functionvalue(j,1)==functionvalue(i,1))&&(functionvalue(j,2)<functionvalue(i,2))&&(functionvalue(j,3)<functionvalue(i,3)))...
                                ||((functionvalue(j,1)>functionvalue(i,1))&&(functionvalue(j,2)==functionvalue(i,2))&&(functionvalue(j,3)<functionvalue(i,3)))...
                                ||((functionvalue(j,1)>functionvalue(i,1))&&(functionvalue(j,2)<functionvalue(i,2))&&(functionvalue(j,3)==functionvalue(i,3)))
                            dominate_num=dominate_num+1;
                        end
                    end
                end
            end
            if dominate_num==0
                frontvalue(i)=fnum;
                cz(i)=true;
            end
        end
    end
end
