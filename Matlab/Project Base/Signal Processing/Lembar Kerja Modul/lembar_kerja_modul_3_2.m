clear all
clc
T=100;
t=0:1/T:2;
f1=1;
y1=sin(2*pi*t);
subplot(2,1,1)
plot(t,y1)

a=input('nilai pengali yang anda gunakan (>=0):');
y1_kuat=a*sin(2*pi*t);
subplot(2,1,2)
plot(t,y1_kuat)
