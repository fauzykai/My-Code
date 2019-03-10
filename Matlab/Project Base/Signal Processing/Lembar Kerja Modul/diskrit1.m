clear all
clc
Fs=1000;%frekuensi sampling
t=(0:Fs-1)/Fs;%proses normalisasi
s1=sin(2*pi*t*2);
stem(t,s1)
axis([0 1 -1.2 1.2])
