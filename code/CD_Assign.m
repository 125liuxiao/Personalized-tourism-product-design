
function distancevalue=CD_Assign(functionvalue,frontvalue,fnum)
popu=find(frontvalue==fnum);                                            %popu��¼��fnum�����ϵĸ�����
distancevalue=zeros(size(popu));                                        %popu�������ӵ������
fmax=max(functionvalue(popu,:),[],1);                                   %popuÿά�ϵ����ֵ
fmin=min(functionvalue(popu,:),[],1);                                   %popuÿά�ϵ���Сֵ
for i=1:size(functionvalue,2)                                           %��Ŀ�����ÿ��Ŀ����popu�������ӵ������
    [temp,newsite]=sortrows(functionvalue(popu,i));
    temp=temp';
    distancevalue(newsite(1))=inf;
    distancevalue(newsite(end))=inf;
    for j=2:length(popu)-1
        distancevalue(newsite(j))=distancevalue(newsite(j))+(functionvalue(popu(newsite(j+1)),i)-functionvalue(popu(newsite(j-1)),i))/(fmax(i)-fmin(i));
    end
end
end

