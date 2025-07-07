
function Q=qupdate(Q,reward,alfa,gamma,solution)
for i=1:length(solution)-1
nbest=max(Q(i+1,:)); %formülde max(Q(a,a') olan deðer
Q(i,solution(i))=Q(i,solution(i))+alfa*(reward+gamma*nbest-Q(i,solution(i))); %update formülü
end
Q(length(solution),solution(length(solution)))=Q(length(solution),solution(length(solution)))+alfa*(reward-Q(length(solution),solution(length(solution))));
end