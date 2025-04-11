clc; clear all;
numb_simul=5000;
n=2;
Ps=1;
d=linspace(5,50,20);
for i=1:length(d)
C1=0;
C2=0;
for k=1:numb_simul
signal=randsrc(1,1);
h1 =1/sqrt(2)*(randn(1,1) + j*randn(1,1));
h2 =1/sqrt(2)*(randn(1,1) + j*randn(1,1));
h3 =1/sqrt(2)*(randn(1,1) + j*randn(1,1));
h4 =1/sqrt(2)*(randn(1,1) + j*randn(1,1));
Noise_var=10^-3;
h11=abs(h1);
y_siso1 =(sqrt(Ps)*h11* signal)/(sqrt(d(i)^n));
SNR_siso=(y_siso1)^2/Noise_var;
SNR_siso=SNR_siso+C1;
y1 =(sqrt(Ps)*h1.* signal)/(sqrt(d(i)^n));
y2 =(sqrt(Ps)*h2.* signal)/(sqrt(d(i)^n));
y3 =(sqrt(Ps)*h3.* signal)/(sqrt(d(i)^n));
y4 =(sqrt(Ps)*h4.* signal)/(sqrt(d(i)^n));
h_norm=(sqrt(abs(h1)^2+abs(h2)^2));
w1=conj(h1)/h_norm;
w2=conj(h2)/h_norm;
w3=conj(h3)/h_norm;
w4=conj(h4)/h_norm;
y_mrc=w1*y1+w2*y2+w3*y3+w4*y4;
SNR_mrc=(y_mrc)^2/Noise_var;
SNR_mrc=SNR_mrc+C2;
end
SNR_siso_avg(i)=(SNR_siso/numb_simul);
SNR_mrc_avg(i)=(SNR_mrc/numb_simul);
end
plot(d,10*log10(SNR_siso_avg),'*-r'); hold on;
plot(d,10*log10(SNR_mrc_avg),'v-b'); hold on;
xlabel('Distance (d)');
ylabel('SNR (dB)');
title('Comparison of SNR for SISO and SIMO (MRC)(22BEC0567)');
legend('SISO', 'SIMO with MRC');
grid on;