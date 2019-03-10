clear all
clc
N=1000;
nn=N-1;
for k=1:200;
    x_n=0.0;
    for n=1:nn
        x_n=(3*sin(0.02*pi*n)).*(exp(-1i*k*2*pi*n/200))+x_n;
    end
    yR(k)=real(x_n);
    yI(k)=imag(x_n);
    magni_k(k)=sqrt(real(x_n).*real(x_n)+imag(x_n).*imag(x_n));
end

figure(1)
stem(yR)
axis([0 200 0 800])
xlabel('index frekuensi')
title('Bagian Real')
grid;

figure(2)
stem(yI)
axis([0 200 0 800])
xlabel('index frekuensi')
title('Bagian Imaginer')
grid;
