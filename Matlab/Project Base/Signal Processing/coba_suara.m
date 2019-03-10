clear all
clc
Fs=10;
[y,Fs] = wavread('gundul.wav')
%sound(y,Fs)
plot(y,Fs)