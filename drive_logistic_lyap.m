function[x,L]=drive_logistic_lyap(a,swarmsize,dim,maxtime)
% schroeder map


r=3.9999999;


for ell=1:2

for k=1:swarmsize


for j=1:dim



% logistic

x(k,j,1,ell)=0.4+0.01*rand; 

for i=1:maxtime
    x(k,j,i+1,ell)=r*x(k,j,i,ell)*(1-x(k,j,i,ell));
    ly(k,j,i,ell)=log(abs(r-2*r*x(k,j,i,ell)));
end

end
end
end


L(1)=nanmean(ly(:));
