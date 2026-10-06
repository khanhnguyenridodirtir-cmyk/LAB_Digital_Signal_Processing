// Nguyễn Duy Khánh - 2411516
// Phan Quốc Huy - 2411520
// Ngày 02/10/2026

// ==========================================
// Ex5 (Phân tích tín hiệu chẵn / lẻ)
// ==========================================
n = -1:1;
x = [1, 3, -2];

// Tính toán thành phần đảo, lẻ và chẵn

x_o = [1.5 , 0 , -1.5];
x_e = [-0.5, 3 , -0.5];

// ------------------------------------------
// 1. Vẽ tín hiệu gốc x(n)
// ------------------------------------------
subplot(3, 1, 1);
plot2d3(n, x, 5); e1 = gce(); e1.children.thickness = 3; // Nét đứng màu đỏ, độ dày 3
plot(n, x, 'ro'); e2 = gce(); e2.children.mark_size = 7; e2.children.mark_size_unit = "point";

title("Tín hiệu gốc x(n)", "fontsize", 3);
xlabel("Chỉ số n"); ylabel("x(n)");
a1 = gca();
a1.x_location = "origin";
a1.data_bounds = [-2, -3; 2, 4]; 
xgrid(); // Bật lưới mặc định
// ------------------------------------------
// 2. Vẽ tín hiệu lẻ x_o(n)
// ------------------------------------------
subplot(3, 1, 2);
plot2d3(n, x_o, 2); e3 = gce(); e3.children.thickness = 3; // Nét đứng màu xanh dương, độ dày 3
plot(n, x_o, 'bo'); e4 = gce(); e4.children.mark_size = 7; e4.children.mark_size_unit = "point";
title("Tín hiệu lẻ x_o(n)", "fontsize", 3);
xlabel("Chỉ số n"); ylabel("x_o(n)");
a2 = gca();
a2.x_location = "origin";
a2.data_bounds = [-2, -3; 2, 2]; 
xgrid(); // Bật lưới mặc định
// ------------------------------------------
// 3. Vẽ tín hiệu chẵn x_e(n)
// ------------------------------------------
subplot(3, 1, 3);
plot2d3(n, x_e, 3); e5 = gce(); e5.children.thickness = 3; // Nét đứng màu xanh lá đậm
plot(n, x_e, 'gx'); e6 = gce(); e6.children.mark_size = 8; e6.children.mark_size_unit = "point"; e6.children.thickness = 2;
title("Tín hiệu chẵn x_e(n)", "fontsize", 3);
xlabel("Chỉ số n"); ylabel("x_e(n)");
a3= gca();
a3.x_location = "origin";
a3.data_bounds = [-2, -3; 2, 4]; 
xgrid(); // Bật lưới mặc định

