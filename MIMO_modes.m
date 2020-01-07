function [] = MIMO_modes( )
%MIMO_MODES Summary of this function goes here
%   Detailed explanation goes here
clear all
close all
% sps
SPS = 8;
N = 10;%00; % number of symbols
% pulse shape - RC
RC_beta = 0.9;
RC_span = 4;

% QPSK Modulation
M = (1:4);
qpsk_symbols = exp(-1j.*(M*pi./2 + pi/4));

% random signal
bit_x = randi([1, length(M)], 1, N)';
bit_x_padded = zeros(N, 8);
bit_x_padded(:,1) = qpsk_symbols(bit_x);
bit_x_padded = reshape(bit_x_padded', 1, N*SPS);

RC_window = rcosdesign(RC_beta, RC_span, SPS);

x = qpsk_symbols(bit_x)

end

