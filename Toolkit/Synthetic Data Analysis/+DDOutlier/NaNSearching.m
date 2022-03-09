function [r,max_nb] = NaNSearching(DataSet)
    %����Natural Neighbor searching���ҵ�
    %����Ӧ�������뾶r�����ܻ�ӭ�ĵ���ھ���max_nb
    r = 1;
    %����ӦѰ��������Χ
    while r <= DataSet.n
        %����Ӧ������Χ
        fprintf('r is now:%d\n',r);

        [Rnbi,numb] = DDOutlier.rnbs(DataSet,r);
        if r == 1
            %��ʵ���ǵ�һ��ѭ�����ͳ�ʼ����һ�������뾶
            numb_upd = numb;
            r = r + 1;
        elseif numb_upd == numb
            break;
        else
            numb_upd = numb;
            r = r + 1;
        end

    end

    %���ܻ�ӭ��Ļ�ӭ��
    max_nb = max(Rnbi);
end