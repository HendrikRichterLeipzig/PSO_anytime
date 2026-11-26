function[x]=drive_asym_tent(a,swarmsize,dim,maxtime)
% tent map

%a=0.6;









% tent

for ell=1:2

for k=1:swarmsize


for j=1:dim
x(k,j,1,ell)=0.4+0.01*rand; 


if a==0.5
a=a+(randi([0,1])*2-1)*10000*eps;
end


for i=1:maxtime

    if x(k,j,i,ell)<a
    
    x(k,j,i+1,ell)=x(k,j,i,ell)/a;
    %ly(j,i)=log(abs(1/a));
    else
 x(k,j,i+1,ell)=(1-x(k,j,i,ell))/(1-a);
    %ly(j,i)=log(abs(1/(a-1)));
    end
    
    
    
    
    
end

end


end
end

%L(1)=nanmean(ly(:));