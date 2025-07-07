function [nbtask,ptimes,precmatrix]=getData(file)
fid = fopen(file);
counter=0;
c=1;
tline = fgetl(fid);
nbtask=str2num(tline);
sayac=0;
ptimes=zeros(1,nbtask);
while sayac<nbtask
    tline = fgetl(fid);
    sayac=sayac+1;
    ptimes(1,sayac)=str2num(tline);
end
precedence=[];
tline = fgetl(fid);
while ischar(tline)
    precedence=[precedence; str2num(tline)];
    tline = fgetl(fid);
end

precmatrix=zeros(nbtask,nbtask);
for i=1:size(precedence,1)-1
    precmatrix(precedence(i,2),precedence(i,1))=1;
end
fclose(fid);