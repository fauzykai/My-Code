x(1:52)=[0 0 1:1:50];
x(53:102)=[50:-1:1];
h=[1 2];
for n = 3:101,
    y(n)=0;
    for m = 1:2
        y(n)=y(n) + h(m)*x(n-m);
    end
end
plot(y)