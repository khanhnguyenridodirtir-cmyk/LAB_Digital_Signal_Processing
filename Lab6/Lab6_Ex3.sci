// Ngay 30/09/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

// 1. x1(n) = 0.1^n u(n)
// Tạo trục tần số góc w từ -pi đến pi
w = linspace(-%pi, %pi, 1000);

// Tính biểu thức DTFT: X1(w) = 1 / (1 - 0.1 * e^(-j*w))
X1 = 1 ./ (1 - 0.1 * exp(-%i * w));

// Tách phổ biên độ và phổ pha
mag_X1 = abs(X1); // Phổ biên độ |X1(w)|
phase_X1 = atan(imag(X1), real(X1)); // Phổ pha (radian) trong khoảng [-pi, pi]

// Vẽ đồ thị
scf(1);

// Đồ thị trên: Phổ biên độ
subplot(2, 1, 1);
plot(w, mag_X1, 'b-', 'LineWidth', 2);
title("Phổ biên độ |X1(ω)|");
xlabel("Tần số góc ω (rad/mẫu)");
ylabel("Biên độ");
xgrid(); // Bật lưới tọa độ

// Đồ thị dưới: Phổ pha
subplot(2, 1, 2);
plot(w, phase_X1, 'r-', 'LineWidth', 2);
title("Phổ pha ∠X1(ω)");
xlabel("Tần số góc ω (rad/mẫu)");
ylabel("Pha (rad)");
xgrid();

// 2. x2(n) = δ(n) + δ(n-1) + δ(n-2) + δ(n-3)
// Tạo trục tần số góc w từ -pi đến pi
w = linspace(-%pi, %pi, 1000);

// Tính biểu thức DTFT: X2(w) = 1 + e^(-j*w) + e^(-j*2w) + e^(-j*3w)
X2 = 1 + exp(-%i * w) + exp(-%i * 2 * w) + exp(-%i * 3 * w);

// Tách phổ biên độ và phổ pha
mag_X2 = abs(X2);
phase_X2 = atan(imag(X2), real(X2));

// Vẽ đồ thị
scf(2);

// Đồ thị trên: Phổ biên độ
subplot(2, 1, 1);
plot(w, mag_X2, 'b-', 'LineWidth', 2);
title("Phổ biên độ |X2(ω)|");
xlabel("Tần số góc ω (rad/mẫu)");
ylabel("Biên độ");
xgrid();

// Đồ thị dưới: Phổ pha
subplot(2, 1, 2);
plot(w, phase_X2, 'r-', 'LineWidth', 2);
title("Phổ pha ∠X2(ω)");
xlabel("Tần số góc ω (rad/mẫu)");
ylabel("Pha (rad)");
xgrid();
