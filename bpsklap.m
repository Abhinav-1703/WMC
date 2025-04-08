clc;clear; close all
N = 10^6; % Number of bits
% Generate random bits
ip = rand(1,N) > 0.5;
s = 2*ip - 1; % BPSK modulation 0 -> -1; 1 -> 1
% Laplacian noise generation
mu = 0; % Mean
b = 1/sqrt(2); % Scale parameter
u = rand(1,N) - 0.5; % Uniform distribution [-0.5, 0.5]
n = mu - b * sign(u) .* log(1 - 2 * abs(u));
SNR_dB = [-3:10]; % Signal-to-Noise Ratio in dB
for i = 1:length(SNR_dB)
% Adjust noise variance according to SNR
y = s + sqrt(10^(-SNR_dB(i)/10)) * n;
ip_estm = real(y) > 0; % Demodulation
No_bit_err(i) = size(find(ip - ip_estm), 2); % Count
errors
end
simBer = No_bit_err / N; % Simulated BER
% Note: Theoretical BER for Laplacian noise is not
straightforward and
% typically requires numerical integration or simulations
for exact analysis.
% Plotting
semilogy(SNR_dB, simBer, '*--r'); hold on;
axis([-3 10 10^-5 0.5]);
grid on;
legend('BER for Laplacian Noise simulation');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
title('Bit Error Probability Curve for BPSK Modulation
with Laplacian Noise')
