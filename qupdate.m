
function Q=qupdate(Q,reward,alfa,gamma,solution)
for i=1:length(solution)-1
nbest=max(Q(i+1,:)); %form�lde max(Q(a,a') olan de�er
Q(i,solution(i))=Q(i,solution(i))+alfa*(reward+gamma*nbest-Q(i,solution(i))); %update form�l�
end
Q(length(solution),solution(length(solution)))=Q(length(solution),solution(length(solution)))+alfa*(reward-Q(length(solution),solution(length(solution))));
end