function solution=qselect(Q)
solution=zeros(1,size(Q,1));
for i=1:length(solution)
    solution(1,i)=rulet(Q(i,:));
end
end