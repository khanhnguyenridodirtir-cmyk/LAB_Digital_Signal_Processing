// Ngay 09/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

// ====================================================================
// BÀI TẬP 2.6 - KIỂM TRA TÍNH BẤT BIẾN THEO THỜI GIAN CỦA HỆ THỐNG
// ====================================================================

// --- Định nghĩa hàm bổ trợ ---
function val = x_func(n)
    val = bool2s((n >= 0) & (n <= 3)); // Tín hiệu x(n) = 1 với 0 <= n <= 3
endfunction

function sig_delayed = delay_sig(sig, k)
    sig_delayed = [zeros(1, k), sig(1:$-k)]; // Hàm dịch trễ k mẫu
endfunction


// ====================================================================
// CÂU (b): Hệ thống y(n) = T[x(n)] = x(n^2)
// ====================================================================
f1=figure(1); // CỬA SỔ ĐỒ THỊ 1
f1.background=8;
clf();

// 1. Vẽ x(n)

n1 = -1:4;
x1 = x_func(n1);

plot2d3(n1, x1, style=2); plot(n1, x1, 'ro');
gca().data_bounds = [-1, 0; 4, 2]; xgrid();
title("(b1) Tín hiệu ngõ vào x(n)"); xlabel("Chỉ số n"); ylabel("x(n)");


f2 = figure(2);
f2.background =8;
clf();

// 2. Vẽ y(n) = x(n^2)
y1 = bool2s((n1.^2 >= 0) & (n1.^2 <= 3));

plot2d3(n1, y1, style=2); plot(n1, y1, 'ro');
gca().data_bounds = [-2, 0; 3, 2]; xgrid();
title("(b2) Ngõ ra y(n) = x(n^2)"); xlabel("Chỉ số n"); ylabel("y(n)");

// Màng hình thứ 3 

f3 = figure(3);
f3.background =8;
clf();
// 3. So sánh y2'(n) = y(n-2) và y2(n) = T[x2(n)]

n_b = -3:5;
xk2  = x_func(n_b-2);
y_prime_2_b = bool2s(((n_b - 2).^2 >= 0) & ((n_b - 2).^2 <= 3));
y2_b = bool2s(((n_b.^2 - 2) >= 0) & ((n_b.^2 - 2) <= 3));

subplot(3,1,1);
plot2d3(n_b, y_prime_2_b, style=2); plot(n_b, y_prime_2_b, 'ro');
gca().data_bounds = [-2, 0; 6, 2]; xgrid();
title("(b3) y2''(n) = y(n-2)"); xlabel("Chỉ số n"); ylabel("y2''(n)");

subplot(3, 1, 2);
plot2d3(n_b, xk2 , style=2);  plot(n_b, xk2, 'ro');
gca().data_bounds = [-2,0; 6,2]; xgrid();
title("(b4) x2  = x(n-2) "); xlabel("Chỉ số n"); ylabel("x2(n)");

subplot(3, 1, 3);
plot2d3(n_b, y2_b, style=5); plot(n_b, y2_b, 'bs');
gca().data_bounds = [-3, 0; 5, 2]; xgrid();
title("(b5) y2(n) = T[x2(n)]"); xlabel("Chỉ số n"); ylabel("y2(n)");


// ====================================================================
// CÂU (c): Hệ thống y(n) = x(n) - x(n-1)
// ====================================================================
figure(4); // CỬA SỔ ĐỒ THỊ 4
f4 = gcf();
f4.background= 8;
clf();

n_c = -2:7;
x_c = x_func(n_c);
y_c = x_c - delay_sig(x_c, 1);              // y(n) = x(n) - x(n-1)
x2_c = delay_sig(x_c, 2);                   // x2(n) = x(n-2)
y_xn2_c = x2_c - delay_sig(x2_c, 1);        // y2(n) = T[x2(n)]
y2_c = delay_sig(y_c, 2);                   // y2'(n) = y(n-2)

// 1. Vẽ y(n)
subplot(3, 1, 1);
plot2d3(n_c, y_c, style=3); plot(n_c, y_c, 'ro');
a = gca(); a.data_bounds = [-0.5, -1.5; 6, 1.5];
a.x_location = "origin"; a.y_location = "origin"; xgrid();
title("(c) Tín hiệu ngõ ra y(n) = x(n) - x(n-1)");

// 2. Vẽ y2(n) = T[x2(n)]
subplot(3, 1, 2);
plot2d3(n_c, y_xn2_c, style=3); plot(n_c, y_xn2_c, 'ro');
a = gca(); a.data_bounds = [-0.5, -1.5; 7, 1.5];
a.x_location = "origin"; a.y_location = "origin"; xgrid();
title("(c) Tín hiệu y2(n) = T[x2(n)]");

// 3. Vẽ y2'(n) = y(n-2)
subplot(3, 1, 3);
plot2d3(n_c, y2_c, style=2); plot(n_c, y2_c, 'bo');
a = gca(); a.data_bounds = [-0.5, -1.5; 7, 1.5];
a.x_location = "origin"; a.y_location = "origin"; xgrid();
title("(c) Tín hiệu y2''(n) = y(n-2)");


// ====================================================================
// CÂU (d): Hệ thống y(n) = T[x(n)] = n * x(n)
// ====================================================================
figure(5); // CỬA SỔ ĐỒ THỊ 5
f5 = gcf();
f5.background= 8;
clf();
n_d = -2:6;
x_d = x_func(n_d);
y_d = n_d .* x_d;                     // y(n) = n * x(n)
x2_d = delay_sig(x_d, 2);             // x2(n) = x(n-2)
y2_d = n_d .* x2_d;                   // y2(n) = T[x2(n)] = n * x2(n)
y_2_d = delay_sig(y_d, 2);            // y2'(n) = y(n-2)

// 1. Vẽ y(n)
subplot(3, 1, 1);
plot2d3(n_d, y_d, style=3); plot(n_d, y_d, 'ro');
a = gca(); a.data_bounds = [0, -1; 6.5, 5];
a.x_location = "origin"; a.y_location = "origin"; xgrid();
title("(d) Tín hiệu y(n) = n*x(n)");

// 2. Vẽ y2(n) = T[x2(n)]
subplot(3, 1, 2);
plot2d3(n_d, y2_d, style=2); plot(n_d, y2_d, 'ro');
a = gca(); a.data_bounds = [0, -1; 6.5, 5.5];
a.x_location = "origin"; a.y_location = "origin"; xgrid();
title("(d) Tín hiệu y2(n) = T[x2(n)]");

// 3. Vẽ y2'(n) = y(n-2)
subplot(3, 1, 3);
plot2d3(n_d, y_2_d, style=1); plot(n_d, y_2_d, 'ro');
a = gca(); a.data_bounds = [0, -1; 6.5, 5];
a.x_location = "origin"; a.y_location = "origin"; xgrid();
title("(d) Tín hiệu y2''(n) = y(n-2)");
