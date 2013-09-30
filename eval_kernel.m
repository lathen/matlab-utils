function varargout = eval_kernel(k, varargin)

% Set kernel grid size based on number of elements in data
k.GridSize = ceil(numel(varargin{1})/k.ThreadBlockSize(1));
num_elements = gpuArray(int32(numel(varargin{1})));

% Build command depending on number of output arguments
cmd = '[';
for arg = 1:k.MaxNumLHSArguments
    cmd = [cmd,'out',int2str(arg),', '];
end
cmd = cmd(1:end-2);
cmd = [cmd,'] = feval(k, num_elements, varargin{:});'];
eval(cmd);

varargout = cell(k.MaxNumLHSArguments, 1);
for arg = 1:k.MaxNumLHSArguments
    varargout{arg} = eval(['out',int2str(arg)]);
end
