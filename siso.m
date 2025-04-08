clc; clear all;
numb_simul = 5000;
n = 2; Ps = 1; d =
linspace(5, 50, 20);
SNR_siso_avg = zeros(1, length(d));
SNR_mrc_avg = zeros(1, length(d));
for i = 1:length(d) C1
= 0; C2 = 0; for k =
1:numb_simul
signal = 2 * randi([0 1], 1, 1) - 1;
h1 = 1/sqrt(2) * (randn + 1j * randn);
h2 = 1/sqrt(2) * (randn + 1j * randn); h3
= 1/sqrt(2) * (randn + 1j * randn); h4 =
1/sqrt(2) * (randn + 1j * randn);
Noise_var = 1e-3;
h11 = abs(h1); y_siso1 = sqrt(Ps) * h11 *
signal / sqrt(d(i)^n);
SNR_siso = abs(y_siso1)^2 / Noise_var;
C1 = C1 + SNR_siso;
y1 = sqrt(Ps) * h1 * signal / sqrt(d(i)^n);
y2 = sqrt(Ps) * h2 * signal / sqrt(d(i)^n); y3
= sqrt(Ps) * h3 * signal / sqrt(d(i)^n); y4 =
sqrt(Ps) * h4 * signal / sqrt(d(i)^n);
h_norm = sqrt(abs(h1)^2 + abs(h2)^2 + abs(h3)^2 + abs(h4)^2);
w1 = conj(h1) / h_norm; w2 = conj(h2) / h_norm; w3 =
conj(h3) / h_norm; w4 = conj(h4) / h_norm;
y_mrc = w1*y1 + w2*y2 + w3*y3 + w4*y4;
SNR_mrc = abs(y_mrc)^2 / Noise_var;
C2 = C2 + SNR_mrc; end
SNR_siso_avg(i) = C1 / numb_simul;
SNR_mrc_avg(i) = C2 / numb_simul; end
plot(d, 10*log10(SNR_siso_avg), '*-r', 'DisplayName', 'SISO'); hold on; plot(d,
10*log10(SNR_mrc_avg), 'v-b', 'DisplayName', 'SIMO with MRC');
xlabel('Distance (d)'); ylabel('Average SNR (dB)');
legend; title('SISO vs SIMO (MRC) Average SNR over
Distance');
grid on;
