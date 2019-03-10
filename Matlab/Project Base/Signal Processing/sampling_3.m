clear all
clc
[Y,Fs]=wavread('gundul.wav');
Fs=44100
sound(Y,Fs)
plot(Y)