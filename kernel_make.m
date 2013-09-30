
function k = kernel_make(name, threads_per_block)

if nargin < 2
    threads_per_block = 1024;
end

[p, filename, ext] = fileparts(name);
ptx_name = [filename,'.ptx'];
cu_name = [filename,'.cu'];
ptx = fullfile(p, ptx_name);
cu = fullfile(p, cu_name);

if ~exist(ptx, 'file')
    disp(['Compiling kernel ',ptx_name,'...']);
    nvcc('-ptx', ...
        ['-o "',ptx,'"'], ...
        ['"',cu,'"']);
else
    disp(['Loading kernel ',ptx_name,' from cache...']);
end

% Create kernel object and set thread block size
k = parallel.gpu.CUDAKernel(ptx, cu);
k.ThreadBlockSize = threads_per_block;
