function [allPre,allSuc]=getPreSuc(precedence)
for i=1:size(precedence,1)
    allprecs(i).precs=[];
    for j=1:size(precedence,2)
        if precedence(i,j)==1
            allprecs(i).precs=[allprecs(i).precs j];
        end
    end
end
for i=1:size(precedence,1)
    
    for j=1:size(precedence,2)
        if precedence(i,j)==1
            allprecs(i).precs=[allprecs(i).precs allprecs(j).precs];
        end
    end
end
for i=1:size(allprecs,2)
    allprecs(i).precs=unique(allprecs(i).precs);
end

allPre=zeros(length(precedence),length(precedence));
for i=1:size(allprecs,2)
    for j=1:length(allprecs(i).precs)
        allPre(i,allprecs(i).precs(j))=1;
    end
end
allSuc=allPre';
end