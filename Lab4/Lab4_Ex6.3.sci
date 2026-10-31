// Ngay 23/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

// Cho sẵn dữ liệu tín hiệu x(n) và y(n)
x = [1, 2, -3, 2, 1];
nx = 0:4;

y = [1, 2, -4, 0, 4, -2, -1];
ny = 0:6;

// Tính năng lượng tích lũy của x(n) và y(n)
Ex = cumsum(x.^2);
Ey = cumsum(y.^2);

// Vẽ đồ thị trên cùng một cửa sổ
scf(0);
clf();

// Đồ thị tín hiệu x(n)
subplot(3, 1, 1);
plot2d3(nx, x, style=2); 
plot(nx, x, 'b.');
a = gca();
a.x_location = "origin"; a.y_location = "origin";
a.data_bounds = [-1, -4; 7, 3];
title('Tín hiệu x(n)');

// Đồ thị tín hiệu y(n)
subplot(3, 1, 2);
plot2d3(ny, y, style=5); 
plot(ny, y, 'r.');
a = gca(); 
a.x_location = "origin"; a.y_location = "origin";
a.data_bounds = [-1, -4.5; 7, 4.5];
title('Tín hiệu y(n)');

// Đồ thị năng lượng tích lũy của x(n) và y(n)
subplot(3, 1, 3);
plot(nx, Ex, '-bo');
plot(ny, Ey, '-ro');
a = gca(); 
a.x_location = "origin"; a.y_location = "origin";
a.data_bounds = [-1, 0; 7, 50]; 
title('So sánh năng lượng tích lũy của x(n) và y(n)');

legend(['Năng lượng x(n)', 'Năng lượng y(n)'], 5); 
a.box = "off"

