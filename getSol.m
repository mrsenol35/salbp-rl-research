function sol=getSol(nbtask,nbrules)
sol=zeros(1,nbtask);
for i=1:nbtask
    sol(i)=randi(nbrules);
end
end