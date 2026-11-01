// Nguyễn Duy Khánh - 2411516
// Phan Quốc Huy - 2411250
// Ngày 23-10-2026
clear;

// (*@Khai báo các tín hiệu đầu vào dạng vectơ cột và hàng@*)
x = [1; 2; -3; 2; 1];
h = [1, 0, -1, -1, 1];
N = length(x);
n_axis = 0:N-1;

// (*@Xây dựng ma trận xoay vòng H@*)
H = zeros(N, N);
for row = 1:N
    for col = 1:N
        idx = pmodulo((row - 1) - (col - 1), N) + 1;
        H(row, col) = h(idx);
    end
end

// (*@Tính tích chập vòng bằng phép nhân ma trận@*)
y = H * x;

// (*@Tính năng lượng tích lũy của các tín hiệu@*)
E_x_n = cumsum((x.^2)');
E_h_n = cumsum(h.^2);
E_y_n = cumsum((y.^2)');

// (*@Cấu hình cửa sổ hiển thị đồ thị (Figure)@*)
f = figure(0);
clf(f);
f.background = 8;           // *** ĐỔI TOÀN BỘ NỀN CỬA SỔ SANG MÀU TRẮNG ***
f.figure_size = [800, 900];

// Cấu hình chia vạch số nguyên trên trục X (từ -1 đến 5)
x_locations = -1:5;
x_ticks_structure = tlist(["ticks", "locations", "labels"], x_locations, string(x_locations));

// --- 1. Đồ thị tín hiệu x(n) ---
subplot(3, 1, 1);
plot2d3(n_axis, x, 2); 
plot(n_axis, x, 'bo');
title("Tín hiệu đầu vào x(n)");

a1 = gca();
a1.background = 8;                          // Đảm bảo nền đồ thị màu trắng
a1.box = "off";
a1.x_location = "origin";
a1.y_location = "origin";
a1.data_bounds = [-1, -4; 5, 3];
a1.x_ticks = x_ticks_structure;
a1.sub_ticks = [0, 0];

// --- 2. Đồ thị tín hiệu đầu ra y(n) ---
subplot(3, 1, 2);
plot2d3(n_axis, y', 5); 
plot(n_axis, y', 'ro');
title("Tín hiệu đầu ra y(n) (Phương pháp ma trận)");

a2 = gca();
a2.background = 8;                          // Đảm bảo nền đồ thị màu trắng
a2.box = "off";
a2.x_location = "origin";
a2.y_location = "origin";
a2.data_bounds = [-1, -5; 5, 5];
a2.x_ticks = x_ticks_structure;
a2.sub_ticks = [0, 0];

// --- 3. Đồ thị so sánh năng lượng tích lũy E(n) ---
subplot(3, 1, 3);
plot(n_axis, E_x_n, 'r-o', n_axis, E_h_n, 'g-^', n_axis, E_y_n, 'b-s');
title("Năng lượng tín hiệu E(n) theo thời điểm n");

a3 = gca();
a3.background = 8;                          // Đảm bảo nền đồ thị màu trắng
a3.box = "off";
a3.x_location = "origin";
a3.y_location = "origin";
a3.data_bounds = [-1, 0; 5, 55];
a3.x_ticks = x_ticks_structure;
a3.sub_ticks = [0, 0];
legend(["E_x(n)", "E_h(n)", "E_y(n)"], 5);
