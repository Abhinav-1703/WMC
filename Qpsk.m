clc;clear; close all
N = 10^6;
ip = randi([0 1], 1, N);
s = (2*ip(1:2:end)-1) + 1i*(2*ip(2:2:end)-1);
n = 1/sqrt(2)*[randn(1,N/2) + 1i*randn(1,N/2)];
SNR_dB = -3:10;
for i = 1:length(SNR_dB)
y = s + sqrt(10^(-SNR_dB(i)/10))*n; % Add noise
ip_hat = real(y)>0 + 1i*(imag(y)>0); % QPSK demodulation
ip_hat = [real(ip_hat)>0; imag(ip_hat)>0]; % Convert symbols back to bits
ip_hat = ip_hat(:).'; % Reshape to a row vector
No_bit_err(i) = size(find(ip - ip_hat),2);
end
simBer = No_bit_err/N; % Simulated Bit Error Rate
theoryBer = 0.5*erfc(sqrt(10.^(SNR_dB/10))); % Theoretical BER
semilogy(SNR_dB, theoryBer, 'ob'); hold on;
semilogy(SNR_dB, simBer, '*--r'); hold on;
axis([-3 10 10^-5 0.5]);
grid on;
legend('BER for AWGN theory', 'BER for AWGN simulation');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
title('Bit Error Probability Curve for QPSK Modulation');
