clc;clear; close all
N = 10^6
ip = rand(1,N)>0.5;
s = 2*ip-1;
n = 1/sqrt(2)*[randn(1,N) + j*randn(1,N)];
SNR_dB = [-3:10];
for i = 1:length(SNR_dB)
y = s + sqrt(10^(-SNR_dB(i)/10))*n;
ip_estm = real(y)>0;
No_bit_err(i) = size(find(ip- ip_estm),2);
end
simBer = No_bit_err/N; % simulated ber
theoryBer = 0.5*erfc(sqrt(10.^(SNR_dB/10)));
semilogy(SNR_dB,theoryBer,'o b');hold on
semilogy(SNR_dB,simBer,'*--r'); hold on
axis([-3 10 10^-5 0.5])
grid on
legend('BER for AWGN theory', 'BER for AWGN simulation');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
title('Bit error probability curve for BPSK modulation');
