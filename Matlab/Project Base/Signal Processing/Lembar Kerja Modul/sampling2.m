clear all
clc
Fs=1000;
t=0:1/Fs:0.25;
f=900;
x=sin(2*pi*f*t);
sound(x,Fs)
plot(x,Fs)