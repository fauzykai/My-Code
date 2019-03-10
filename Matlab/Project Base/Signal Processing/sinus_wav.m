clear all
clc
Fs=10000; %frek sampling
t=0:1/Fs:0.25; %proses normalisasi
c=sin(2*pi*262*t);
plot(t,c)
wavwrite(c,'nada_c.wav')