function[LL,D,II,PE,NPE]=uniform_dist_drive
% mutual information and Lyapunov exponents for maps with uniform densities 
% using the same drive function as the PSO




%lag=1;
lag=3

d=5;
%tau=1;
tau=3;
bins=32;


x0=[0.01:0.01:0.99];
% uniform distribution
f0=ones(size(x0));

f0=f0/trapz(f0);






dim=10;



% Beta(1,1) random

xx=betarnd(1,1,60,dim,5001,2);

% asym tent


[xS5,L]=drive_asym_tent_lyap(0.5,60,dim,5000);

LL(1)=L;

[xS55,L]=drive_asym_tent_lyap(0.55,60,dim,5000);

LL(2)=L;


[xS6,L]=drive_asym_tent_lyap(0.6,60,dim,5000);

LL(3)=L;

[xS65,L]=drive_asym_tent_lyap(0.65,60,dim,5000);
LL(4)=L;


[xS7,L]=drive_asym_tent_lyap(0.7,60,dim,5000);
LL(5)=L;

[xS8,L]=drive_asym_tent_lyap(0.8,60,dim,5000);
LL(6)=L;

[xS9,L]=drive_asym_tent_lyap(0.9,60,dim,5000);
LL(7)=L;



LL(8)=inf


for i=1:size(xx,1)
 for j=1:size(xx,2)

     % random
     cc=xx(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_r(i,j)=mean(abs(f/trapz(f)-f0));
     I_r(i) = mutual_information(cc(:),bins,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_r(i,j)=pe;
     npe_r(i,j)=npe;
     
  % S5

    cc=xS5(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s5(i,j)=mean(abs(f/trapz(f)-f0));
     I_s5(i) = mutual_information(cc(:),bins,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s5(i,j)=pe;
     npe_s5(i,j)=npe;

 % S55

    cc=xS55(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s55(i,j)=mean(abs(f/trapz(f)-f0));
     I_s55(i) = mutual_information(cc(:),bins,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s55(i,j)=pe;
     npe_s55(i,j)=npe;


    % S6
     cc=xS6(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s6(i,j)=mean(abs(f/trapz(f)-f0));
     I_s6(i) = mutual_information(cc(:),bins,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s6(i,j)=pe;
     npe_s6(i,j)=npe;

 % S65
     cc=xS65(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s65(i,j)=mean(abs(f/trapz(f)-f0));
     I_s65(i) = mutual_information(cc(:),bins,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s65(i,j)=pe;
     npe_s65(i,j)=npe;


      % S7
     cc=xS7(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s7(i,j)=mean(abs(f/trapz(f)-f0));
     I_s7(i) = mutual_information(cc(:),bins,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s7(i,j)=pe;
     npe_s7(i,j)=npe;


    % S8
   cc=xS8(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s8(i,j)=mean(abs(f/trapz(f)-f0));
     I_s8(i) = mutual_information(cc(:),bins,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s8(i,j)=pe;
     npe_s8(i,j)=npe;

 % S9
     cc=xS9(i,j,:,:);
     [f,x]=hist(cc(:),x0);
     dist_s9(i,j)=mean(abs(f/trapz(f)-f0));
     I_s9(i) = mutual_information(cc(:),bins,lag);
     [pe, npe] = permutation_entropy(cc(:), d, tau);
     pe_s9(i,j)=pe;
     npe_s9(i,j)=npe;

  

 
end
end

% averaging

D=[mean(dist_s5(:)),mean(dist_s55(:)),mean(dist_s6(:)),mean(dist_s65(:)),mean(dist_s7(:)),mean(dist_s8(:)),mean(dist_s9(:)),mean(dist_r(:))]
II=[mean(I_s5(:)),mean(I_s55(:)),mean(I_s6(:)),mean(I_s65(:)),mean(I_s7(:)),mean(I_s8(:)),mean(I_s9(:)),mean(I_r(:))]

PE=[mean(pe_s5(:)),mean(pe_s55(:)),mean(pe_s6(:)),mean(pe_s65(:)),mean(pe_s7(:)),mean(pe_s8(:)),mean(pe_s9(:)),mean(pe_r(:))]
NPE=[mean(npe_s5(:)),mean(npe_s55(:)),mean(npe_s6(:)),mean(npe_s65(:)),mean(npe_s7(:)),mean(npe_s8(:)),mean(npe_s9(:)),mean(npe_r(:))]











