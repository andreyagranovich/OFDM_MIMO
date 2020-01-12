%MIMO_MODES Summary of this function goes here
%   Detailed explanation goes here
clear all
close all

%% initiallize
N = 1000; % number of symbols
% channel properties
paths_number = 1e7;
% noise
noise_rou = 0.01;

%% Generate QPSK Modulated Signal

M = (1:4);
qpsk_symbols = exp(-1j.*(M*pi./2 + pi/4));

% random signal
bit_x = randi([1, length(M)], 1, N)';
s = qpsk_symbols(bit_x);

%% Generate Channel & Noise

beta_coeffs_real = rand(1, paths_number)';
beta_coeffs_imag = rand(1, paths_number)';
channel_h = beta_coeffs_real + 1j*beta_coeffs_imag; % No need for time spacing between betas because of rich MP

%% ML - We assume we already received a symbol which is "S" this symbol is multiplied by some coefficient and recives rayligh channel
% we will create a SNR vector for which we will generate different values
% of received symbols by adding coresponding noise


