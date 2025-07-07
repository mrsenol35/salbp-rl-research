function candidateList=AdayBul(precedence,ptime,stationTime,taktTime,nbtask,isDone)
candidateList=[];
for i=1:nbtask
    if sum(precedence(i,:))==0
        if isDone(i)==0
            if stationTime+ptime(i)<=taktTime
            candidateList=[candidateList i];
            end
        end
    end    
end
end