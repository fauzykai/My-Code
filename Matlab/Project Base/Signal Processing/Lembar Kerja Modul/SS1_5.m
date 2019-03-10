clear all
clc
L=input('PanjangGelombang (>=40)=' )
P=input('PosisiPulsa =' )
for n=1:L
    if (n==P) 
        step(n)=1;
    else
        step(n)=0;
    end
end
x=1:L; 
%stem(x,step)
stem(x,step)
axis([0 L -.1 1.2])
