// Ngay 23/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

// Khởi tạo tín hiệu x(n) (dạng véc-tơ cột) và h(n)
x = [1; 2; -3; 2; 1];
nx = 0:4;
h = [1, 0, -1];
nh = 0:2;

Nx = length(x);
Nh = length(h);
Ny = Nx + Nh - 1;

// Tạo ma trận Toeplitz H kích thước Ny x Nx
H = zeros(Ny, Nx);
for j = 1:Nx
    H(j : j + Nh - 1, j) = h';
end

// Tính tích chập bằng phép nhân ma trận y = H * x
y_col = H * x;
y = y_col';
ny = (nx(1) + nh(1)) : (nx($) + nh($));

// Vẽ đồ thị
scf(0);
clf();
plot2d3(ny, y, style=2); 
plot(ny, y, 'b.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [-1, -4.5; 7, 4.5];
title('Đồ thị tín hiệu tích chập tuyến tính (Phương pháp ma trận) y(n) = H * x');
