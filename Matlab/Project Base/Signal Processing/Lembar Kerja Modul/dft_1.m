clear all
clc
n=0:199;
T=0.01;
x_t=3*sin(2*pi*n*T);
stem(n,x_t)
grid;