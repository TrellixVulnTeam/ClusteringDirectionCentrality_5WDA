function [Rnbi,numb] = rnbs(DataSet,k)
    %rnbs Ϊÿһ�����ҵ����Լ����ھӵ�������ĸ�����
    %Rnbi ����ÿһ����Ļ�ӭ��
    %numb �ǲ��ܻ�ӭ����ĸ���
    
    if k > DataSet.nn
        DataSet.increaseBuffer(k + 10);
    end
    [kdist_obj,~] = DDOutlier.kDistObj(DataSet,k);
    
    
    edges = [0.5:1:(DataSet.n + 0.5)];
    [Rnbi,~] = histcounts(kdist_obj.id,edges);
    Rnbi = Rnbi';
    
    numb = sum(Rnbi == 0);
end