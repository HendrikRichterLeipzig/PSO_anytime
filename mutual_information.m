function I = mutual_information(x, nbins, lag)
% mutual_information  Estimate mutual information I(X_t; X_{t+lag}) in bits
%   I = mutual_information(x)            uses nbins=16, lag=1
%   I = mutual_information(x, nbins, lag)

if nargin < 2 || isempty(nbins), nbins = 16; end
if nargin < 3 || isempty(lag), lag = 1; end
x = x(:);
x = x(isfinite(x));
if numel(x) <= lag
    error('Time series too short for the requested lag.');
end

X = x(1:end-lag);
Y = x(1+lag:end);

% Joint histogram
edgesX = linspace(min(X), max(X), nbins+1);
edgesY = linspace(min(Y), max(Y), nbins+1);
H = histcounts2(X, Y, edgesX, edgesY);

% Probabilities
Pxy = H / sum(H(:));        % nbins x nbins
Px  = sum(Pxy, 2);          % nbins x 1
Py  = sum(Pxy, 1);          % 1 x nbins

% Expected joint under independence: outer product
Pprod = Px * Py;            % nbins x nbins

% Compute MI: sum_{i,j} Pxy(i,j) * log2( Pxy(i,j) / Pprod(i,j) )
mask = Pxy > 0 & Pprod > 0;
I = sum( Pxy(mask) .* log2( Pxy(mask) ./ Pprod(mask) ) );

end