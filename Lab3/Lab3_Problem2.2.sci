// Ngay 09/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

// Bài tập 2.2
// Khởi tạo tín hiệu gốc x(n)
nx = -1:4;
xn = [1, 1, 1, 1, 1/2, 1/2];

// (a) x(n-2): Dịch trễ tín hiệu 2 đơn vị tức là đồ thị dịch sang phải
nx1 = nx + 2;
x1n = xn;
// Vẽ đồ thị x(n-2)
scf(0);
clf();
plot2d3(nx1, x1n, style=2);
plot(nx1, x1n, 'b.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [0, 0; 7, 1.2];
title("Tín hiệu x(n-2)");

// (b) x(4-n): Lật ngược tín hiệu xong rồi dịch trễ 4 đơn vị 
// Tức là đồ thị bị lật qua trục tung sau đó dịch đồ thị sang phải
nx2 = -nx($:-1:1) + 4;
x2n = xn($:-1:1);
// Vẽ đồ thị x(4-n)
scf(1);
clf();
plot2d3(nx2, x2n, style=2);
plot(nx2, x2n, 'b.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [-1, 0; 6, 1.2];
title("Tín hiệu x(4-n)");

// (c) x(n+2): Dịch sớm tín hiệu 2 đơn vị tức là đồ thị dịch sang trái
nx3 = nx - 2;
x3n = xn;
// Vẽ đồ thị x(n+2)
scf(2);
clf();
plot2d3(nx3, x3n, style=2);
plot(nx3, x3n, 'b.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [-4, 0; 3, 1.2];
title("Tín hiệu x(n+2)");

// (d) x(n)u(2-n): Lấy tín hiệu gốc x(n) nhân với tín hiệu bước nhảy đơn vị u(2-n)
un = [1, 1, 1, 1, 0, 0];
nx4 = nx;
x4n = xn .* un;
// Vẽ đồ thị x(n)u(2-n)
scf(3);
clf();
plot2d3(nx4, x4n, style=2);
plot(nx4, x4n, 'b.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [-2, 0; 5, 1.2];
title("Tín hiệu x(n)u(2-n)");

// (e) x(n-1)δ(n-3): Dịch phải tín hiệu gốc x(n) 1 đơn vị rồi nhân với xung đơn vị δ(n-3)
δn = [0, 0, 0, 1, 0, 0];
nx5 = nx + 1;
x5n = xn .* δn;
// Vẽ đồ thị x(n-1)δ(n-3)
scf(4);
clf();
plot2d3(nx5, x5n, style=2);
plot(nx5, x5n, 'b.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [-1, 0; 6, 1.2];
title("Tín hiệu x(n-1)δ(n-3)");

// (f) x(n^2): Chỉ lấy dữ liệu tại các điểm là số chính phương và đồ thị bị đối xứng qua trục tung
nx6 = -2:2;
x6n = [1/2, 1, 1, 1, 1/2];
// Vẽ đồ thị x(n^2)
scf(5);
clf();
plot2d3(nx6, x6n, style=2);
plot(nx6, x6n, 'b.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [-3, 0; 3, 1.2];
title("Tín hiệu x(n^2)");

// (g) Phần chẵn của x(n): Có dạng xen = 1/2[x(n)+x(-n)]
nxe = -4:4;
xen = [1/4, 1/4, 1/2, 1, 1, 1, 1/2, 1/4, 1/4];
// Vẽ đồ thị chẵn của x(n)
scf(6);
clf();
plot2d3(nxe, xen, style=2);
plot(nxe, xen, 'b.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [-5, 0; 5, 1.2];
title("Tín hiệu chẵn của x(n)");

// (h) Phần lẻ của x(n): Có dạng xon = 1/2[x(n)-x(-n)]
nxo = -4:4;
xon = [-1/4, -1/4, -1/2, 0, 0, 0, 1/2, 1/4, 1/4];
// Vẽ đồ thị lẻ của x(n)
scf(7);
clf();
plot2d3(nxo, xon, style=2);
plot(nxo, xon, 'b.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [-5, -0.5; 5, 0.6];
title("Tín hiệu lẻ của x(n)")
