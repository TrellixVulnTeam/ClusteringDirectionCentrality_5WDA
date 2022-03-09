function [dist] = distance(DataSet,i,j,k)
    %�Ҹ���i���ھ�j�ľ��롣������Χ��k
    %�����k��Χ�ڣ�j����i���ھӾͻ����
    [kdist_obj,~] = DDOutlier.kDistObj(DataSet,k);
    
    [~,neighborLevel_j] = find(kdist_obj.id(i,:) == j);
    if ~isempty(neighborLevel_j)
        dist = kdist_obj.dist(i,neighborLevel_j); 
    else
        disp('i��k�ھ�����û��j!');
        [~,neighborLevel_i] = find(kdist_obj.id(j,:) == i);
        if ~isempty(neighborLevel_i)
            dist = kdist_obj.dist(j,neighborLevel_i); 
        else
            error('i��j���ڸ��Ե�k�ھӷ�Χ�ڣ�');
        end
    end
    
end