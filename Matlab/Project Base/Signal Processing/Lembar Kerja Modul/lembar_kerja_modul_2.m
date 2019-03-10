clear all
clc
Fs=100;
t=(1:100)/Fs;
s1=2*sin(2*pi*t*5 + pi/2); 
plot(t,s1)
