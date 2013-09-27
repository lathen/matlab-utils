Matlab utilities
=================

A collection of Matlab utilities.

extendvolume
----
A script which extends a volume to a given multiple size and padding. This is useful for CUDA processing algorithms which typically assumes the volume size to be a multiple of a power of two.

nvcc
----
A nvcc compiler wrapper forked from Matlab File Exchange:
<http://www.mathworks.com/matlabcentral/fileexchange/29611-nvcc-cuda-compiler-wraper>

The changes here introduces support for Mac/Linux and more than 8 input options.
