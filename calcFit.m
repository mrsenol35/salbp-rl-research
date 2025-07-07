function fit=calcFit(Stations,ptime,taktTime)
m=length(Stations); %number  of stations
U=zeros(1,m);
Umax=0;
for i=1:length(Stations)
 U(i)=sum(ptime(Stations(i).atananlar));
 if U(i)>Umax
     Umax=U(i);
 end
end
U=U/Umax;
A=0;
for i=1:length(Stations)
A=A+U(i)/m;
end
top=0;
for i=1:length(Stations)
    top=top+(U(i)-A)^2;
end
VW=sqrt(top/m);
LE=sum(ptime)/(m*taktTime);
fit=LE+(1-VW);
end