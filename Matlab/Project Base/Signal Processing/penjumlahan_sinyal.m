T=100;
t=0:1/T:2;
f1=1;
%y1=sin(2*pi*t);
y1=sin(f1*pi*t);
subplot(3,1,1);
plot(t,y1);
f2=10;
pha2=pi/2;
%y2=sin(2*pi*t+pi);
y2=sin(f2*pi*t+pha2);
subplot(3,1,2);
plot(t,y2);
y3=y1+y2;
subplot(3,1,3);
plot(t,y3);

