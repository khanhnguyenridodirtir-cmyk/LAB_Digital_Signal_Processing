// Nguyễn Duy Khánh - 2411516
// Phan Quốc Huy - 2411250
// Ngày 02/10/2026
/*=========================================
        Ex7
===========================================
*/
clf();
//cài đặt biến 
n1=-1:2;
n2=0:3;
n=-1:3;
x1 = [0,1,3,-2];
x2 = [0,1,2,3];
y = [0,0,2,9,0];

// vẽ đồ thị
// ------------------------------------------
// 1. Vẽ tín hiệu x_1(n)
// ------------------------------------------
subplot(3, 1, 1);
plot2d3(n1, x1, 5); e1 = gce(); e1.children.thickness = 3; // Nét đứng màu đỏ, độ dày 3
plot(n1, x1, 'ro'); e2 = gce(); e2.children.mark_size = 7; e2.children.mark_size_unit = "point";

title("Tín hiệu x1(n)", "fontsize", 3);
xlabel("Chỉ số n"); ylabel("x1(n)");
a1 = gca();
a1.x_location = "origin";
a1.data_bounds = [-2, -3; 3, 4]; 
xgrid(); // Bật lưới mặc định
// ------------------------------------------
// 2. Vẽ tín hiệu x_2(n)
// ------------------------------------------
subplot(3, 1, 2);
plot2d3(n2, x2, 2); e3 = gce(); e3.children.thickness = 3; // Nét đứng màu xanh dương, độ dày 3
plot(n2, x2, 'bo'); e4 = gce(); e4.children.mark_size = 7; e4.children.mark_size_unit = "point";
title("Tín hiệu x2(n)", "fontsize", 3);
xlabel("Chỉ số n"); ylabel("x2(n)");
a2 = gca();
a2.x_location = "origin";
a2.data_bounds = [-1, -1; 4, 4]; 

xgrid(); // Bật lưới mặc định
// ------------------------------------------
// 2. Vẽ tín hiệu y(n)
// ------------------------------------------
subplot(3, 1, 3);
plot2d3(n, y, 3); e5 = gce(); e5.children.thickness = 3; // Nét đứng màu xanh lá đậm
plot(n, y, 'gx'); e6 = gce(); e6.children.mark_size = 8; e6.children.mark_size_unit = "point"; e6.children.thickness = 2;
title("Tín hiệu y(n)", "fontsize", 3);
xlabel("Chỉ số n"); ylabel("y(n)");
a3= gca();
a3.x_location = "origin";
a3.data_bounds = [-2, 0; 4, 10]; 
xgrid(); // Bật lưới mặc định
