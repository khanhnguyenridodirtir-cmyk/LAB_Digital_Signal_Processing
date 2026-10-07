// Ngay 30/09/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

nx = -3:2; // Lay khoang rong ra cho de nhin
x = [0 1 -2 3 6 0];

// y1(n) = x(-n)
ny1 = -nx($:-1:1);
y1 = x($:-1:1);

// y2(n) = x(n+3)
ny2 = nx - 3;
y2 = x;

// y3(n) = 2x(-n-2)
ny3 = -nx($:-1:1) - 2;
y3 = 2 .* x($:-1:1);

// Cua so 1: Cap x(n) va y1(n)
scf(1);

subplot(2, 1, 1);
plot2d3(nx, x);
title("Tin hieu goc x(n)"); 
xlabel("n"); 
ylabel("Bien do");

subplot(2, 1, 2);
plot2d3(ny1, y1);
title("Tin hieu y1(n) = x(-n)"); 
xlabel("n"); 
ylabel("Bien do");

// Cua so 2: Cap x(n) va y2(n)
scf(2);

subplot(2, 1, 1);
plot2d3(nx, x);
title("Tin hieu goc x(n)"); 
xlabel("n"); 
ylabel("Bien do");

subplot(2, 1, 2);
plot2d3(ny2, y2);
title("Tin hieu y2(n) = x(n+3)"); 
xlabel("n"); 
ylabel("Bien do");

// Cua so 3: Cap x(n) va y3(n)
scf(3);

subplot(2, 1, 1);
plot2d3(nx, x);
title("Tin hieu goc x(n)"); 
xlabel("n"); 
ylabel("Bien do");

subplot(2, 1, 2);
plot2d3(ny3, y3);
title("Tin hieu y3(n) = 2x(-n-2)"); 
xlabel("n");
ylabel("Bien do");
