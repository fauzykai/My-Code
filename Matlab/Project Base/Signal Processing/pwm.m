Fs=100;
t=(1:100)/Fs;
s1=square(2*pi*5*t+3*pi/4);
plot(t,s1,'linewidth',2)
axis([0 1 -1.2 1.2])