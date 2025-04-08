clc;
clear all;
close all;
% Define parameters
Hte = 30:10:200; % Transmitter antenna height (m)
Hre = 1:1:10; % Receiver antenna height (m)
d = 5; % Distance in km (constant)
f = 150:50:1500; % Frequency range (MHz)
% Path loss calculation for small and large cities
LU_small = zeros(length(f), length(Hte));
LU_large = zeros(length(f), length(Hte));
for i = 1:length(f)
for j = 1:length(Hte)
if f(i) <= 200
CH_small = 0.8 + (1.1 * log10(f(i)) - 0.7) * Hre(1) - 1.56 * log10(f(i));
CH_large = 8.29 * (log10(1.54 * Hre(1)))^2 - 1.1;
else
CH_small = 0.8 + (1.1 * log10(f(i)) - 0.7) * Hre(1) - 1.56 * log10(f(i));
CH_large = 3.2 * (log10(11.75 * Hre(1)))^2 - 4.97;
end
LU_small(i, j) = 69.55 + 26.16 * log10(f(i)) - 13.82 * log10(Hte(j)) - CH_small +
(44.9 - 6.55 * log10(Hte(j))) * log10(d);
LU_large(i, j) = 69.55 + 26.16 * log10(f(i)) - 13.82 * log10(Hte(j)) - CH_large +
(44.9 - 6.55 * log10(Hte(j))) * log10(d);
end
end
% 1. Plot: Frequency vs Loss (dB) for Small City
figure;
plot(f, LU_small(:,1), 'r', 'LineWidth', 1.5);
hold on;
plot(f, LU_small(:,end), 'b', 'LineWidth', 1.5);
xlabel('Frequency (MHz)');
ylabel('Path Loss (dB)');
title('Hata Model - Frequency vs Loss (Small City)');
legend('Hte = 30m', 'Hte = 200m');
grid on;
% 2. Plot: Transmitter Antenna Height vs Loss (dB)
figure;
plot(Hte, LU_small(1,:), 'g', 'LineWidth', 1.5);
xlabel('Transmitter Antenna Height (m)');
ylabel('Path Loss (dB)');
title('Hata Model - Transmitter Antenna Height vs Loss');
grid on;
% 3. Plot: Receiver Antenna Height vs Loss (dB)
LU_Hre = zeros(length(Hre), 1);
for i = 1:length(Hre)
if f(1) <= 200
CH = 0.8 + (1.1 * log10(f(1)) - 0.7) * Hre(i) - 1.56 * log10(f(1));
else
CH = 3.2 * (log10(11.75 * Hre(i)))^2 - 4.97;
end
LU_Hre(i) = 69.55 + 26.16 * log10(f(1)) - 13.82 * log10(Hte(1)) - CH + (44.9 - 6.55 *
log10(Hte(1))) * log10(d);
end
figure;
plot(Hre, LU_Hre, 'm', 'LineWidth', 1.5);
xlabel('Receiver Antenna Height (m)');
ylabel('Path Loss (dB)');
title('Hata Model - Receiver Antenna Height vs Loss');
grid on;
% 4. Plot: Compare HATA and Extended HATA for Large Cities
figure;
plot(f, LU_large(:,1), 'r', 'LineWidth', 1.5);
hold on;
plot(f, LU_large(:,end), 'b', 'LineWidth', 1.5);
xlabel('Frequency (MHz)');
ylabel('Path Loss (dB)');
title('Hata vs Extended Hata Model - Frequency vs Loss (Large City)');
legend('Hte = 30m', 'Hte = 200m');
grid on;
