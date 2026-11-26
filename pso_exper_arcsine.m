function[bestF1,bestF2,bestF3,bestF4,bestF5,bestF6,bestF7,bestF8]=pso_exper_arcsine(inn,outt,dim)

% calculate 45 repetions of PSO runs with 3 BBOB instances each
% 
% 
% inn -- first BBOB index calculated between 1-24 
% outt -- last BBOB index calculated between 1-24
% (used to parallelize calculation over BBOB ids)
%
% dim -- dimension of the search space
% bestFx -- best fitness for each of the 10000 iterations for each
% repetiton and each BBOB id



% bbob index
for b_id=[inn:1:outt]


rep=45;

% asym tent map

for i=1:rep, 
  i
   [x]=drive_logistic(0,60,dim,9999); 
  s3=randperm(size(x,3));
    y=x(:,:,s3,:);

    bestF1(i,:,b_id)= simple_pso1(b_id,y,rem(i,3)+1);
    [x]=drive_schroeder(2,60,dim,9999);
      s3=randperm(size(x,3));
    y=x(:,:,s3,:);
    bestF2(i,:,b_id)= simple_pso1(b_id,y,rem(i,3)+1);
  [x]=drive_schroeder(3,60,dim,9999);
    s3=randperm(size(x,3));
    y=x(:,:,s3,:);
    bestF3(i,:,b_id)= simple_pso1(b_id,y,rem(i,3)+1);

  [x]=drive_schroeder(4,60,dim,9999);
    s3=randperm(size(x,3));
    y=x(:,:,s3,:);
    bestF4(i,:,b_id)= simple_pso1(b_id,y,rem(i,3)+1);
    [x]=drive_schroeder(6,60,dim,9999);
      s3=randperm(size(x,3));
    y=x(:,:,s3,:);
    bestF5(i,:,b_id)= simple_pso1(b_id,y,rem(i,3)+1);
[x]=drive_schroeder(8,60,dim,9999);
  s3=randperm(size(x,3));
    y=x(:,:,s3,:);
    bestF6(i,:,b_id)= simple_pso1(b_id,y,rem(i,3)+1);
[x]=drive_schroeder(10,60,dim,9999);
  s3=randperm(size(x,3));
    y=x(:,:,s3,:);
    bestF7(i,:,b_id)= simple_pso1(b_id,y,rem(i,3)+1);


end






% Beta(0.5,0.5)







for i=1:rep, 
 
    xx=betarnd(0.5,0.5,60,dim,10000,2);
  s3=randperm(size(xx,3));
    yy=xx(:,:,s3,:);

    bestF8(i,:,b_id)= simple_pso1(b_id,yy,rem(i,5)+1);

end






end

