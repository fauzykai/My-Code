clear all
clc
L=input('Banyaknyatitiksampel(>=20): ');
f1=input('Besarnyafrekuensi gel 1 adalah Hz: ');
f2=input('Besarnyafrekuensi gel 2 adalah Hz: ');
teta1=input('Besarnyafase gel 1(dalam radiant): ');
teta2=input('Besarnyafase gel 2(dalam radiant): ');
A1=input('Besarnyaamplitudo gel 1: '); 
A2=input('Besarnyaamplitudo gel 2: ');
%Sinus pertama
t=1:L;
t=2*t/L;
y1=A1*sin(2*pi*f1*t + teta1*pi);
subplot(3,1,1)
stem(y1)
%SInuskedua
t=1:L;
t=2*t/L;
y2=A2*sin(2*pi*f2*t + teta2*pi);
subplot(3,1,2)
stem(y2) 

subplot(3,1,3)
stem(conv(y1,y2))
