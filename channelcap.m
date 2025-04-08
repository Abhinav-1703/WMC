clc;
clear all;
user=5000;
snr_original=linspace(1,10,20);
snrdb=10.^(snr_original/10);
b=3; %1, 2,3
for i=1:length(snr_original)
Cap=0;
for k=1:user
h1 =1/sqrt(2)*(randn(1,1) + j*randn(1,1));
h=abs(h1);
h_mod_sqr=(abs(h))^2;
snr_link=snrdb(i)*h_mod_sqr;
C=b*log2(1+snr_link);
Cap=Cap+C;
end
cavg(i)=(Cap/user);
end
plot(snr_original,cavg,'o-b');
title('SNR vs Channel capacity');
xlabel('SNR');
ylabel('Channel capacity');
