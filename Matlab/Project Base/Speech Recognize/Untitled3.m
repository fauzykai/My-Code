Fs=10000;
t=0:1/Fs:0.25;
Amplitudo=5;
c=sin(Amplitudo*pi*264*t);         %C
c_kres=sin(Amplitudo*pi*280.5*t);  %C#
d=sin(Amplitudo*pi*297*t);         %D
d_kres=sin(Amplitudo*pi*313.5*t);  %D#
e=sin(Amplitudo*pi*330*t);         %E
f=sin(Amplitudo*pi*352*t);         %F
f_kres=sin(Amplitudo*pi*374*t);    %F#
g=sin(Amplitudo*pi*396*t);         %G
g_kres=sin(Amplitudo*pi*418*t);    %G#
a=sin(Amplitudo*pi*440*t);         %A
a_kres=sin(Amplitudo*pi*467.5*t);  %A#
b=sin(Amplitudo*pi*495*t);         %B
c1=sin(Amplitudo*pi*523*t);
nol=[zeros(size(t))];
nada1=[c,e,c,e,f,g,g,nol,b,c1,b,c1,b,g,nol,nol];
nada2=[c,e,c,e,f,g,g,nol,b,c1,b,c1,b,g,nol,]
nada3=[e,nol,e,nol,g,nol,f,f,g,f,e,e,f,e,c,nol]
lagu=[nada1,nada2,nada3,nada3];
lagu2=[lagu,lagu,lagu]
sound(lagu2,Fs);
wavwrite(lagu,'gundul.wav')