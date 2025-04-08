clc;
close all;
clear all;
nusers=5000;
n=2;
pt=1;
d=linspace(1,10,10);
Threshold=10^(4/10);
for i=1:length(d)
count=0;
sig_pow=0;
for k=1:nusers
signal=randsrc(1,1);
var=1;
std1=sqrt(var);
noise = normrnd(0,std1,1,1);
h1 =1/sqrt(2)*(randn(1,1) + j*randn(1,1));
h=abs(h1);
Rev_sig =(sqrt(pt)*h.*signal)/(sqrt(d(i)^n))+noise;
signal_power=abs((Rev_sig).^2);
if signal_power>=Threshold
count=count+1;
end
end
Pd_sim(i)=(count/nusers);
end
plot(d,Pd_sim,'v-r');
title("Power(db) vs distance");
xlabel("Distance");
ylabel("Power");
hold on;
