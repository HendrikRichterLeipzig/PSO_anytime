function [pe, normalized_pe] = permutation_entropy(time_series, d, tau)
% PERMUTATION_ENTROPY Calculates absolute and normalized Permutation Entropy.
%
% Inputs:
%   time_series : 1D double vector containing the dynamic data
%   d           : Embedding dimension (sequence sequence length, e.g., 3 to 7)
%   tau         : Time delay step (typically 1 for discrete chaotic maps)
%
% Outputs:
%   pe          : Absolute Permutation Entropy (measured in bits)
%   normalized_pe : Normalized Permutation Entropy (scaled strictly 0 to 1)

    % 1. Ensure the input data is formatted as a row vector
    time_series = time_series(:)';
    N = length(time_series);
    
    % 2. Calculate the total number of delay vectors possible
    num_vectors = N - (d - 1) * tau;
    if num_vectors <= 0
        error('Time series length is too short for the selected d and tau parameters.');
    end
    
    % 3. Construct the delay vector matrix using vectorized indexing
    % Row i contains: [x(i), x(i+tau), x(i+2*tau), ..., x(i+(d-1)*tau)]
    indices = (0:d-1)' * tau + (1:num_vectors);
    vectors = time_series(indices)'; % Size: num_vectors x d
    
    % 4. Find relative rank orders (Ordinal Patterns)
    % 'sort' returns the sorted indices, which represents the permutation pattern
    [~, permutations] = sort(vectors, 2);
    
    % 5. Tally identical ordinal patterns and calculate their frequencies
    % 'unique' with 'rows' extracts unique pattern signatures and counts matches
    [unique_patterns, ~, idx] = unique(permutations, 'rows');
    counts = accumarray(idx, 1);
    
    % 6. Compute Shannon Probabilities
    probabilities = counts / num_vectors;
    
    % 7. Calculate Absolute PE (using log base 2 for bits metric)
    pe = -sum(probabilities .* log2(probabilities));
    
    % 8. Calculate Normalized PE
    max_entropy = log2(factorial(d));
    normalized_pe = pe / max_entropy;
end