// Ngay 09/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

// Bài tập 2.1
// (a) Khởi tạo tín hiệu gốc x(n)
nx = -3:3;
xn = [0, 1/3, 2/3, 1, 1, 1, 1];

// (b1) và (c) Đầu tiên lật, sau đó dịch trễ 4 mẫu -> tạo ra x(-n+4)
ny1 = -nx($:-1:1) + 4;
y1n = xn($:-1:1);

// (b2) Đầu tiên dịch trễ 4 mẫu, sau đó lật -> tạo ra x(-n-4)
ny2 = -nx($:-1:1) - 4;
y2n = xn($:-1:1);

// Hiển thị đồ thị so sánh
clf();

// Thiết lập giới hạn chung cho cả 3 đồ thị để dóng thẳng hàng trục n
x_min = -8; x_max = 8;
y_min = 0; y_max = 1.2;

// 1. Vẽ đồ thị (a): x(n)
subplot(3, 1, 1);
plot2d3(nx, xn, style=5);
plot(nx, xn, 'r.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [x_min, y_min; x_max, y_max];
title("(a) Tín hiệu gốc x(n)");

// 2. Vẽ đồ thị (b1) và (c): x(-n+4)
subplot(3, 1, 2);
plot2d3(ny1, y1n, style=2);
plot(ny1, y1n, 'b.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [x_min, y_min; x_max, y_max];
title("(b1 & c) Lật rồi dịch trễ: x(-n+4)");

// 3. Vẽ đồ thị (b2): x(-n-4)
subplot(3, 1, 3);
plot2d3(ny2, y2n, style=3);
plot(ny2, y2n, 'g.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [x_min, y_min; x_max, y_max];
title("(b2) Dịch trễ rồi lật: x(-n-4)");
