%MIMO_MODES Summary of this function goes here
%   Detailed explanation goes here
clear all
close all

%% initiallize

% sps
SPS = 8;
N = 10;%00; % number of symbols
% pulse shape - RC
RC_beta = 0.9;
RC_span = 4;
% channel properties
paths_number = 1e4;
% noise
noise_rou = 0.01;

%% Generate QPSK Modulated Signal

M = (1:4);
qpsk_symbols = exp(-1j.*(M*pi./2 + pi/4));

% random signal
bit_x = randi([1, length(M)], 1, N)';
bit_x_padded = zeros(N, SPS);
bit_x_padded(:,1) = qpsk_symbols(bit_x);
bit_x_padded = reshape(bit_x_padded', 1, N*SPS);

RC_window = rcosdesign(RC_beta, RC_span, SPS);
% pass the signal through Pulse Shape window filter
PS_x = filter(RC_window, 1, bit_x_padded);

% TODO: add sync bits that will be thrown in transiation

%% Generate Channel & Noise

beta_coeffs_real = rand(1, paths_number)';
beta_coeffs_imag = rand(1, paths_number)';
channel_h = beta_coeffs_real + 1j*beta_coeffs_imag; % No need for time spacing between betas because of rich MP
noise = noise_rou * rand(1, length(channel_h) + length(PS_x) - 1)';

%% ML

y = conv(channel_h, PS_x) + noise;

plot(abs(y))





