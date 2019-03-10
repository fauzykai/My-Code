clear all;
Fs=10000;
t=0:1/Fs:(0.25);
f=700;
x=sin(2*pi*f*t);
sound(x,Fs);