function [ output_args ] = MIMO_modes( input_args )
%MIMO_MODES Summary of this function goes here
%   Detailed explanation goes here

% QPSK Modulation
M = (1:4);
qpsk_symbols = exp(-1j.*(M*pi./2 + pi/4));

% random signal
N = 1000; % number of symbols
x = randi([1, length(M)], 1, N);

end

