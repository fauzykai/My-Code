clear all
clc

Fs=1000; %frek sampling
t=(0:Fs-1)/Fs; %proses normalisasi
s2=sin(2*pi*t*2);
subplot(211)
stem(t,s2)
axis([0 1 -1.2 1.2])
sound(s2,Fs)