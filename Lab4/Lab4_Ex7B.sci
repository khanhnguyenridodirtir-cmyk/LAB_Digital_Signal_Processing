// Nguyễn Duy Khánh - 2411516
// Phan Quốc Huy - 2411250
// Ngày 23-10-2026
clear; clc;

x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = length(x);

// Khởi tạo mảng kết quả y gồm N số 0
y = zeros(1, N);


// Lật vòng tín hiệu h(n)
h_flip = [h(1), h(N:-1:2)];

y = zeros(1, N);

// Dịch vòng và tính tổng tích
for n = 0:N-1
    h_shift = h_flip;

    // Dịch vòng sang phải n vị trí
    for i = 1:n
        h_shift = [h_shift(N), h_shift(1:N-1)];
    end

    y(n+1) = sum(x .* h_shift);
end

figure(); clf();
n = 0:4;

// 1. Vẽ cột stem và các điểm tín hiệu y(n)
plot2d3(n, y);
plot(n, y, 'ro');

// 2. Vẽ đường ngang chuẩn tại y = 0 (màu đen 'k', nét đứt '--')
plot([-1, 5], [0, 0], 'k--');

// 3. Bật đường lưới (grid) để dễ nhìn mốc tọa độ


// Trang trí đồ thị
title("Tích chập vòng y(n) tính bằng phương pháp lật và dịch");
xlabel("n");
ylabel("y(n)");

// Cấu hình giới hạn khung nhìn
gca().data_bounds = [-1, -5; 5, 5];
