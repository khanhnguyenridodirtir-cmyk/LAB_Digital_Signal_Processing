// Ngay 30/09/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

n = -1:4; // Lay khoang rong ra cho de nhin
x1 = [0 0 1 3 -2 0];
x2 = [0 1 2 3 0 0];
y = x1 + x2;

subplot(3, 1, 1);
plot2d3(n, x1);
title("Tin hieu roi rac x1(n)");
xlabel("Thoi gian (n)");
ylabel("Bien do");

subplot(3, 1, 2);
plot2d3(n, x2);
title("Tin hieu roi rac x2(n)");
xlabel("Thoi gian (n)");
ylabel("Bien do");

subplot(3, 1, 3);
plot2d3(n, y);
title("Tin hieu roi rac y(n) = x1(n) + x2(n)");
xlabel("Thoi gian (n)");
ylabel("Bien do");
