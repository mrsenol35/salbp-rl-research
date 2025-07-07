function rwhel=rulet(x)
%hepsi negatifse 1/ yap
for i=1:length(x)
    x(i)=max(0,x(i));
end 
a=x;
a=a/sum(a);
for i=2:length(a)
    a(i)=a(i)+a(i-1);
end
say=rand();
for i=1:length(a)
    if a(i)>say
        break;
    end
end
rwhel=i;
end