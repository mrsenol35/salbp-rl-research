function atanacak=AdaySec(candidateList,Rprecedence,allPre,allSuc,ptime,nbtask,taktTime,isDone,rule)
switch rule

    case 1 %LPT
        sureler=ptime(candidateList);
        [~,I]=max(sureler);
        atanacak=candidateList(I);
    case 2 %SPT
        sureler=ptime(candidateList);
        [~,I]=min(sureler);
        atanacak=candidateList(I);
    case 3 %GNIS
        top=sum(Rprecedence(:,candidateList));
        [~,I]=max(top);
        atanacak=candidateList(I);
    case 4 %GNS
        top=sum(allPre(:,candidateList));
        [~,I]=max(top);
        atanacak=candidateList(I);
    case 5 %random
        sec=randi(length(candidateList));
        atanacak=candidateList(sec);
    case 6 %smallest task number
        atanacak=candidateList(1);
    case 7 %GRPW
        for i=1:length(candidateList)
        sureler(i)=ptime(candidateList(i))+sum(ptime.*allSuc(candidateList(i),:));
        end
        [~,I]=max(sureler);
        atanacak=candidateList(I);
    case 8 %GARPW
        for i=1:length(candidateList)
        sureler(i)=ptime(candidateList(i))+sum(ptime.*allSuc(candidateList(i),:));
        sureler(i)=sureler(i)/(sum(allSuc(candidateList(i),:))+1);
        end
        [~,I]=max(sureler);
        atanacak=candidateList(I);
    case 9 %SUB
        for i=1:length(candidateList)
        UB(i)=ptime(candidateList(i))+sum(ptime.*allSuc(candidateList(i),:));
        UB(i)=nbtask+1-(UB(i)/taktTime);
        end
        [~,I]=min(UB);
        atanacak=candidateList(I);
    case 10 %S_UB_NS
        for i=1:length(candidateList)
        UB(i)=ptime(candidateList(i))+sum(ptime.*allSuc(candidateList(i),:));
        UB(i)=nbtask+1-(UB(i)/taktTime);
        UB(i)=UB(i)/(sum(allSuc(candidateList(i),:))+1);
        end
        [~,I]=min(UB);
        atanacak=candidateList(I);
    case 11 %G_PT_UB
        for i=1:length(candidateList)
        UB(i)=ptime(candidateList(i))+sum(ptime.*allSuc(candidateList(i),:));
        UB(i)=nbtask+1-(UB(i)/taktTime);
        UB(i)=ptime(candidateList(i))/UB(i);
        end
        [~,I]=max(UB);
        atanacak=candidateList(I);
    case 12 %SLB
        for i=1:length(candidateList)
        LB(i)=ptime(candidateList(i))+sum(ptime.*allPre(candidateList(i),:));
        LB(i)=LB(i)/taktTime;
        end
        [~,I]=min(LB);
        atanacak=candidateList(I);
    case 13 %MSLK
        for i=1:length(candidateList)
        UB(i)=ptime(candidateList(i))+sum(ptime.*allSuc(candidateList(i),:));
        UB(i)=nbtask+1-(UB(i)/taktTime);
        LB(i)=ptime(candidateList(i))+sum(ptime.*allPre(candidateList(i),:));
        LB(i)=LB(i)/taktTime;
        slack(i)=UB(i)-LB(i);
        end
        [~,I]=min(slack);
        atanacak=candidateList(I);
    case 14 %M_NS_SLK
        for i=1:length(candidateList)
        UB(i)=ptime(candidateList(i))+sum(ptime.*allSuc(candidateList(i),:));
        UB(i)=nbtask+1-(UB(i)/taktTime);
        LB(i)=ptime(candidateList(i))+sum(ptime.*allPre(candidateList(i),:));
        LB(i)=LB(i)/taktTime;
        weight(i)= sum(allSuc(candidateList(i),:))/(UB(i)-LB(i));
        end
        [~,I]=min(weight);
        atanacak=candidateList(I);
    case 15 %GNIP
        for i=1:length(candidateList)
        top(i)=sum(Rprecedence(candidateList(i),:));
        end
        [~,I]=max(top);
        atanacak=candidateList(I);
end