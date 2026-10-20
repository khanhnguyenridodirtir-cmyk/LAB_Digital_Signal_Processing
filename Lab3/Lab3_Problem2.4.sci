// Ngay 09/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

// ====================================================================
// BÀI TẬP 2.4: Phân tích tín hiệu thành thành phần chẵn và lẻ
// ====================================================================

f_24 = figure(24);
f_24.background = 8;
clf();

// Định nghĩa hàm đảo tín hiệu fold
function [yn, n_y] = fold(xn, n_x)
    yn = xn(length(xn):-1:1);
    n_y = -n_x(length(n_x):-1:1);
endfunction

// 1. Khai báo chỉ số thời gian n_x và tín hiệu xn
n_x = -2:2;
xn  = [2, 3, 4, 5, 6];

// 2. Gọi hàm fold để lấy x(-n)
[x_fold, n_fold] = fold(xn, n_x);

// 3. Tính thành phần chẵn xe(n) và thành phần lẻ xo(n)
x_e = 0.5 * (xn + x_fold);
x_o = 0.5 * (xn - x_fold);

// ====================================================================
// VẼ ĐỒ THỊ
// ====================================================================

// --- Đồ thị 1: Tín hiệu gốc x(n) ---
subplot(3, 1, 1);
plot2d3(n_x, xn, style = 2); 
plot(n_x, xn, 'ro');
gca().data_bounds = [-3, 0; 3, 7];
gca().x_location = "origin";
gca().y_location = "origin";

title("Tín hiệu gốc x(n)");


// --- Đồ thị 2: Thành phần chẵn xe(n) ---
subplot(3, 1, 2);
plot2d3(n_x, x_e, style = 3); 
plot(n_x, x_e, 'go');
gca().data_bounds = [-3, 0; 3, 7];
gca().x_location = "origin";
gca().y_location = "origin";

title("Thành phần chẵn xe(n)");

// --- Đồ thị 3: Thành phần lẻ xo(n) ---
subplot(3, 1, 3);
plot2d3(n_x, x_o, style = 5); 
plot(n_x, x_o, 'bo');
gca().data_bounds = [-3, -3; 3, 3];
gca().x_location = "origin";
gca().y_location = "origin";

title("Thành phần lẻ xo(n)");

