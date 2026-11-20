// Ngay 20/11/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

// H(w) = 1 + e^(-jw)
// X(w) = 1 / (1 - 0.5*e^(-jw))
// Y(w) = X(w) * H(w)
w = linspace(-%pi, %pi, 1000);
H = 1 + exp(-%i * w);
X = 1 ./ (1 - 0.5 * exp(-%i * w));
Y = X .* H;
mag_Y = abs(Y);
phase_Y = atan(imag(Y), real(Y));

scf(0);
subplot(2, 1, 1);
plot(w, mag_Y, 'b-', 'LineWidth', 2);
title("Phổ biên độ |Y(ω)|");
xlabel("Tần số góc ω (rad/mẫu)");
ylabel("Biên độ");
xgrid();

subplot(2, 1, 2);
plot(w, phase_Y, 'r-', 'LineWidth', 2);
title("Phổ pha ∠Y(ω)");
xlabel("Tần số góc ω (rad/mẫu)");
ylabel("Pha (rad)");
xgrid();
