clear all
clc
y1=wavread('gundul.wav');
Fs=8192;
Fs1=Fs;
%wavplay(y1,Fs1,'sync')
subplot(2,1,1)
plot(y1)

N=length(y1);
var=0.5;
noise_1=var*randn(N,1);
y_1n=y1+noise_1;
wavplay(y_1n,Fs1,'sync')
subplot(2,1,2)
plot(y_1n)
