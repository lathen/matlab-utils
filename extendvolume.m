
function [vol_ext, offset] = extendvolume(vol, multiples, padding)

if isscalar(multiples)
    multiples = multiples*ones(1,3);
end

if isscalar(padding)
    padding = padding*ones(1,3);
end

% Add padding and correct for multiples
dim_ext = size(vol) + 2*padding;
dim_ext = dim_ext - 1;
dim_ext = dim_ext + multiples - mod(dim_ext, multiples);

% Compute desired padding
padsize = floor((dim_ext - size(vol))/2);
offset = padsize;

% Pad equally in both directions
vol_ext = padarray(vol, padsize, 'replicate', 'both');

% For cases when the padding must be asymmetric
padsize = dim_ext - size(vol_ext);
vol_ext = padarray(vol_ext, padsize, 'replicate', 'post');
