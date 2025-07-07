clc;
clear;
data;
oldfit=1;
best=-99999;
bestsol=[];

Qtable=zeros(nbtask,nbrules);
itr=1;
while itr<1000
data;
istSay=1;
stationTime=0;
Stations=[];
Stations(istSay).atananlar=[];
sol=getSol(nbtask,nbrules);
candidateList=[];
candidateList=AdayBul(precedence,ptime,stationTime,taktTime,nbtask,isDone);
sayac=1;
while sayac<=nbtask
if ~isempty(candidateList)
    atanacak=AdaySec(candidateList,Rprecedence,allPre,allSuc,ptime,nbtask,taktTime,isDone,sol(sayac));%rule seçme buraya RL gelecek fitten sonra
    precedence(:,atanacak)=0;
    isDone(atanacak)=1;
    stationTime=stationTime+ptime(atanacak);
    Stations(istSay).atananlar=[Stations(istSay).atananlar atanacak];
    sayac=sayac+1;
else
istSay=istSay+1;
stationTime=0;
Stations(istSay).atananlar=[];
end
candidateList=AdayBul(precedence,ptime,stationTime,taktTime,nbtask,isDone);
end
fit=calcFit(Stations,ptime,taktTime);
%fit=calcFit2(Stations);
if fit>oldfit
    reward=(fit-oldfit)/fit;
    
elseif fit==oldfit
        reward=0;
else
    reward=(fit-oldfit)/oldfit;
end
if fit>best
    best=fit;
    bestsol=Stations;
end
fits(itr)=fit
oldfit=fit;
rewards(itr)=reward;
Qtable=qupdate(Qtable,reward,0.9,0.1,sol);
itr=itr+1
end
while itr>=1000 && itr<5000
data;
istSay=1;
stationTime=0;
Stations=[];
Stations(istSay).atananlar=[];
sol=qselect(Qtable);
candidateList=[];
candidateList=AdayBul(precedence,ptime,stationTime,taktTime,nbtask,isDone);
sayac=1;
while sayac<=nbtask
if ~isempty(candidateList)
    atanacak=AdaySec(candidateList,Rprecedence,allPre,allSuc,ptime,nbtask,taktTime,isDone,sol(sayac));%rule seçme buraya RL gelecek fitten sonra
    precedence(:,atanacak)=0;
    isDone(atanacak)=1;
    stationTime=stationTime+ptime(atanacak);
    Stations(istSay).atananlar=[Stations(istSay).atananlar atanacak];
    sayac=sayac+1;
else
istSay=istSay+1;
stationTime=0;
Stations(istSay).atananlar=[];
end
candidateList=AdayBul(precedence,ptime,stationTime,taktTime,nbtask,isDone);
end
fit=calcFit(Stations,ptime,taktTime);
%fit=calcFit2(Stations);

if fit>oldfit
    reward=(fit-oldfit)/fit;
    
elseif fit==oldfit
        reward=0;
else
    reward=(fit-oldfit)/oldfit;
end
if fit>best
    best=fit;
    bestsol=Stations;
end
fits(itr)=fit
rewards(itr)=reward;
Qtable=qupdate(Qtable,reward,0.8,0.2,sol);
itr=itr+1
end