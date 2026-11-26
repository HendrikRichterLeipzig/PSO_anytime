function[LL,D,II,PE,NPE]=arcsine_dist_drive
% mutual information and Lyapunov exponents for maps with arcsine densities 
% using the same drive function as the PSO




%lag=1;
lag=3;

d=5;
%tau=1;
tau=3;



x0=[0.01:0.01:0.99];
% reference for arcsine distribution
f0=1/pi./(x0.*(1-x0));

f0=f0/trapz(f0);






dim=10;



% Beta(0.5,0.5) random

xx=betarnd(0.5,0.5,60,dim,5001,2);

% Logistic

[xL,L]=drive_logistic_lyap(0,60,dim,5000);
LL(1)=L;

% Schröder 

[xS2,L]=drive_schroeder_lyap(2,60,dim,5000);
LL(2)=L;
[xS3,L]=drive_schroeder_lyap(3,60,dim,5000);
LL(3)=L;
[xS4,L]=drive_schroeder_lyap(4,60,dim,5000);
LL(4)=L;
[xS6,L]=drive_schroeder_lyap(6,60,dim,5000);
LL(5)=L;
[xS8,L]=drive_schroeder_lyap(8,60,dim,5000);
LL(6)=L;
[xS10,L]=drive_schroeder_lyap(10,60,dim,5000);
LL(7)=L;
LL(8)=inf





for i=1:size(xx,1)
 for j=1:size(xx,2)

     % random
     cc=xx(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_r(i,j)=mean(abs(f/trapz(f)-f0));
     I_r(i) = mutual_information(cc(:),32,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_r(i,j)=pe;
     npe_r(i,j)=npe;
     
 


  

    % Log

 cc=xL(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_L(i,j)=mean(abs(f/trapz(f)-f0));
     I_L(i) = mutual_information(cc(:),32,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_L(i,j)=pe;
     npe_L(i,j)=npe;


  % S2
     cc=xS2(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s2(i,j)=mean(abs(f/trapz(f)-f0));
     I_s2(i) = mutual_information(cc(:),32,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s2(i,j)=pe;
     npe_s2(i,j)=npe;

       % S3
     cc=xS3(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s3(i,j)=mean(abs(f/trapz(f)-f0));
     I_s3(i) = mutual_information(cc(:),32,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s3(i,j)=pe;
     npe_s3(i,j)=npe;

       % S4
     cc=xS4(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s4(i,j)=mean(abs(f/trapz(f)-f0));
     I_s4(i) = mutual_information(cc(:),32,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s4(i,j)=pe;
     npe_s4(i,j)=npe;


       % S6
     cc=xS6(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s6(i,j)=mean(abs(f/trapz(f)-f0));
     I_s6(i) = mutual_information(cc(:),32,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s6(i,j)=pe;
     npe_s6(i,j)=npe;


    % S8
   cc=xS8(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s8(i,j)=mean(abs(f/trapz(f)-f0));
     I_s8(i) = mutual_information(cc(:),32,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s8(i,j)=pe;
     npe_s8(i,j)=npe;


       % S10
     cc=xS10(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s10(i,j)=mean(abs(f/trapz(f)-f0));
     I_s10(i) = mutual_information(cc(:),32,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s10(i,j)=pe;
     npe_s10(i,j)=npe;




end
end

% averaging

D=[mean(dist_L(:)),mean(dist_s2(:)),mean(dist_s3(:)),mean(dist_s4(:)),mean(dist_s6(:)),mean(dist_s8(:)),mean(dist_s10(:)),mean(dist_r(:))]
II=[mean(I_L(:)),mean(I_s2(:)),mean(I_s3(:)),mean(I_s4(:)),mean(I_s6(:)),mean(I_s8(:)),mean(I_s10(:)),mean(I_r(:))]

PE=[mean(pe_L(:)),mean(pe_s2(:)),mean(pe_s3(:)),mean(pe_s4(:)),mean(pe_s6(:)),mean(pe_s8(:)),mean(pe_s10(:)),mean(pe_r(:))]
NPE=[mean(npe_L(:)),mean(npe_s2(:)),mean(npe_s3(:)),mean(npe_s4(:)),mean(npe_s6(:)),mean(npe_s8(:)),mean(npe_s10(:)),mean(npe_r(:))]













