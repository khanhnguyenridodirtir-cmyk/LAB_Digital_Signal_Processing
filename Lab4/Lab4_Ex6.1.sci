// Ngay 23/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

// Khởi tạo tín hiệu x(n) và h(n)
x = [1, 2, -3, 2, 1];
nx = 0:4;
h = [1, 0, -1];
nh = 0:2;

// Lật tín hiệu h(n) thành h_folded = h(-k)
h_folded = h($:-1:1);
nh_folded = -nh($:-1:1);

// Xác định miền thời gian kết quả y(n)
ny = (nx(1) + nh(1)) : (nx($) + nh($));
y = zeros(1, length(ny));

// Thuật toán Lật và Dịch
for i = 1:length(ny)
    n = ny(i);
    nh_shifted = nh_folded + n;

    k_min = max(nx(1), nh_shifted(1));
    k_max = min(nx($), nh_shifted($));
    
    if k_min <= k_max then
        idx_x = (k_min:k_max) - nx(1) + 1;
        idx_h = (k_min:k_max) - nh_shifted(1) + 1;
        
        y(i) = sum(x(idx_x) .* h_folded(idx_h));
    else
        y(i) = 0;
    end
end

// Vẽ đồ thị
scf(0);
clf();
plot2d3(ny, y, style=2); 
plot(ny, y, 'b.');
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [-1, -4.5; 7, 4.5];
title('Đồ thị tín hiệu tích chập tuyến tính y(n) = x(n) * h(n)');
