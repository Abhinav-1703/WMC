Matlab Code:
Okumura model:
clc;
clear all;
close all;
lf=input("enter free space loss");
amu=[15,16,17,18,18.5,19,20];
f=[100,200,300,500,700,1000,2000];
gt=input("enter transmitter gain");
gr=input("enter receiver gain");
kc=input("enter correction factor gain");
l50freq=[];
for i=1:7
l50freq(i)=lf+amu(i)-gt-gr-kc;
end
subplot(6,1,1);
plot(f,l50freq);
title("loss(db) vs frequency(MHz)");
xlabel("frequecy(MHz)");
ylabel("loss(db");
l50hr=[];
hbg=[];
hmg=[];
hr=[2,3,4,5,6,7,8];
ht=[50,60,70,80,90,1000,1010];
for i=1:7
if(hr<=3)
hbg=10*log10(hr(i));
else
hbg=20*log10(hr/3);
end
l50hr(i)=lf+amu(i)-gt-hbg(i)-kc;
end
subplot(6,1,2);
plot(hr,l50hr);
title("loss(db) vs receiver antenna height(m)");
xlabel("receiver height(m)");
ylabel("loss(db)");
l50ht=[];
for i=1:7
hmg(i)=20*log10(ht(i)/200);
l50ht(i)=lf+amu(i)-gr-hmg(i)-kc;
end
subplot(6,1,3);
plot(ht,l50ht);
title("loss(db) vs transmitter antenna height(m)");
xlabel("transmitter height(m)");
ylabel("loss(db)");
gareasub=[5,6,7,8,9,10,12];
gareaquasi=[16,17,17,19,21,22,26];
gareaopen=[22,23,24,25,26,27,31];
lsub=[];
lquasi=[];
lopen=[];
for i=1:7
lsub(i)=lf+amu(i)-gr-gt-gareasub(i);
lquasi(i)=lf+amu(i)-gr-gt-gareaquasi(i);
lopen(i)=lf+amu(i)-gr-gt-gareaopen(i);
end
subplot(6,1,4);
plot(f,lsub);
title("suburban area loss(db) vs frequency(Mhz)");
xlabel("frequency(Mhz)");
ylabel("loss(db)");
subplot(6,1,5);
plot(f,lquasi);
title("quasiurban area loss(db) vs frequency(Mhz)");
xlabel("frequency(Mhz)");
ylabel("loss(db)");
subplot(6,1,6);
plot(f,lopen);
title("rural area loss(db) vs frequency(Mhz)");
xlabel("frequency(Mhz)");
