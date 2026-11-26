function cbf = simple_pso1(funID,driv,init_id)
% SIMPLE_PSO Minimal particle swarm optimizer
%   bestF = SIMPLE_PSO(funID, dim, maxtime)
%   funID   : function handle or function name that accepts a vector of length dim
%   dim     : problem dimension (positive integer)
%   maxtime : maximum run time in seconds
%   bestF   : best fitness value found (scalar)



% Parameters
swarmSize =size(driv,1);
dim=size(driv,2);
maxtime=size(driv,3);



w = 0.79;        % inertia
c1 = 1.49;       % cognitive
c2 = 1.49;       % social


% BBOB handle

[~,fopt,opfun1] = bbob_problems_eval(dim,funID,init_id);


velMaxFactor = 0.2; % fraction of bounds
lb = -30*ones(1,dim);
ub =  30*ones(1,dim);

% Precompute repeated bounds
lbM = repmat(lb,swarmSize,1);
ubM = repmat(ub,swarmSize,1);
vMax = (ub - lb) * velMaxFactor;
vMaxM = repmat(vMax,swarmSize,1);

% Initialization
rng('shuffle');

% uniformly distributed initialization
X = lbM + rand(swarmSize,dim).*(ubM - lbM);
rng('shuffle'); 
V = (rand(swarmSize,dim)-0.5).*vMaxM;
pBestPos = X;
pBestVal = inf(swarmSize,1);



    %pBestVal=bbob(X',funID);
    %size(pBestVal)

    
    pBestVal=feval(opfun1,X)';
     

[bestF, idx] = min(pBestVal);
gBestPos = pBestPos(idx,:);




for i=1:maxtime
    % Update velocities and positions
    r1 = driv(:,:,i,1);
    r2 = driv(:,:,i,2);


    V = w.*V + c1.*r1.*(pBestPos - X) + c2.*r2.*(repmat(gBestPos,swarmSize,1) - X);
    
    
    % velocity clamping
    V = max(min(V, vMaxM), -vMaxM);
    X = X + V;
    % enforce bounds and zero velocity on hit
    outLow = X < lbM;
    outHigh = X > ubM;
    X(outLow) = lbM(outLow);
    X(outHigh) = ubM(outHigh);
    V(outLow | outHigh) = 0;
    
    
    
    % Evaluate
    
    
    fval=feval(opfun1,X)';
    

    for ii=1:swarmSize
       
        if fval(ii) < pBestVal(ii)
            pBestVal(ii) = fval(ii);
            pBestPos(ii,:) = X(ii,:);
        end
    end

    [currBestF, idx] = min(pBestVal);

 cbff(i)=currBestF;

    if currBestF < bestF
        bestF = currBestF;
        gBestPos = pBestPos(idx,:);
    end
end


cbf=cbff-fopt;



end