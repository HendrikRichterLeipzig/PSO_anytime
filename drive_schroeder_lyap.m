function[x,L]=drive_schroeder_lyap(a,swarmsize,dim,maxtime)
% schroeder map





for ell=1:2

for k=1:swarmsize


for j=1:dim



% schröder

x(k,j,1,ell)=0.4+0.01*rand; 

for i=1:maxtime
    x(k,j,i+1,ell)=sin(a*asin(sqrt(x(k,j,i,ell))))^2;
    ly(k,j,i,ell)=log(abs((a*cos(a*asin(x(k,j,i,ell)^(1/2)))*sin(a*asin(x(k,j,i,ell)^(1/2))))/(x(k,j,i,ell)^(1/2)*(1 - x(k,j,i,ell))^(1/2))));
end

end
end
end


L(1)=nanmean(ly(:));
