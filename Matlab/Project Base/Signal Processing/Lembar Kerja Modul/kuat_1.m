clear all
clc
y1=wavread('gundul.wav');
Fs=8192;
Fs1=Fs;
%wavplay(y1,Fs1,'sync')
subplot(2,1,1)
plot(y1)

amp=0.5;
y2=amp*y1;
wavplay(y2,Fs1,'sync')
subplot(2,1,2)
plot(y2)
