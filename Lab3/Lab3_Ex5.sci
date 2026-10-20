// Ngay 09/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

function [yn, yorigin] = multi (x1n, x1origin, x2n, x2origin)
    // 1. Tạo trục thời gian độc lập cho từng tín hiệu
    nx1 = (1:length(x1n)) - x1origin; 
    nx2 = (1:length(x2n)) - x2origin; 
    
    // Tìm biên (giới hạn) của trục thời gian chung
    n_min = min(min(nx1), min(nx2));
    n_max = max(max(nx1), max(nx2));
    n = n_min : n_max;
    
    // 2. Khởi tạo hai mảng đệm chứa toàn số 0 có cùng kích thước với trục chung
    y1 = zeros(1, length(n));
    y2 = zeros(1, length(n));
    
    // Ánh xạ dữ liệu gốc vào mảng đệm đã gióng hàng
    y1(nx1 - n_min + 1) = x1n;
    y2(nx2 - n_min + 1) = x2n;
    
    // 3. Nhân từng phần tử khi 2 mảng đã hoàn toàn khớp nhau
    yn = y1 .* y2;
    
    // Xác định lại vị trí gốc mới và trục thời gian cho y(n)
    yorigin = 1 - n_min;
    ny = (1:length(yn)) - yorigin;
    
    // 4. Hiển thị cả ba đồ thị (x1, x2, y) trên cùng một cửa sổ
    // Giới hạn trục hoành (thời gian) chung
    // Tự do trục tung (biên độ) cho từng tín hiệu để dễ quan sát
    clf();
    
    // Vẽ x1(n) ở phần trên cùng
    subplot(3, 1, 1);
    plot2d3(nx1, x1n, style=2);
    plot(nx1, x1n, 'b.');
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
    a.data_bounds = [n_min-1, min(x1n)-1; n_max+1, max(x1n)+1];
    title("Tín hiệu gốc x1(n)");
    
    // Vẽ x2(n) ở phần giữa
    subplot(3, 1, 2);
    plot2d3(nx2, x2n, style=3);
    plot(nx2, x2n, 'g.');
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
    a.data_bounds = [n_min-1, min(x2n)-1; n_max+1, max(x2n)+1];
    title("Tín hiệu gốc x2(n)");
    
    // Vẽ y(n) ở phần dưới cùng
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'r.');
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
    a.data_bounds = [n_min-1, min(yn)-1; n_max+1, max(yn)+1];
    title("Tín hiệu tích y(n) = x1(n) . x2(n)");
endfunction

// Test
[yn, yorigin] = multi ([3, -2, 1, 5], 3, [1, -2, 1, 3], 2);
