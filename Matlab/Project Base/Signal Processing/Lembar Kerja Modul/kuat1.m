clear all
clc
y1=wavread('satu.wav')
Fs=10000;
wavplay(y1,Fs,'async') % Memainkan audio sinyalasli
audioplayer(y1,Fs) % Memainkan audio sinyalasli
sound(y1,Fs)
plot(y1)