n=201;
delx=10/(n-1);
for k=1:n
    x(k)=(k-1)*delx;
    y(k)=sin(x(k))*exp(-0.4*x(k));
end
%plot(x,y)
plot(x,y,'linewidth',4)
title('Grafik yang pertama')
xlabel('x');ylabel('y');