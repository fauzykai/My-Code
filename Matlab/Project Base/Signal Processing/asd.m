clear all
clc
%x=10:-1:0
%noise=0.5*randn*sin(2*pi*10*x)+0.5*randn*sin(2*pi*10*x/2)+0.5*randn*sin(2*pi*10*x/4);
    %plot(noise)
    %hold on
r = 0 + 0.0001.*rand(10,1);
plot(r)