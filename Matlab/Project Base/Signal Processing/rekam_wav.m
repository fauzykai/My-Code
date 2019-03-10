clear all
clc
Fs = 11025;
y = wavrecord(5*Fs,Fs,'int16');
wavplay(y,Fs);