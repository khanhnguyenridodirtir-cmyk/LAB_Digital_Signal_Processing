// Ngay 09/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

function [yn, yorigin] = fold (xn, xorigin)
    // 1. Lật ngược mảng tín hiệu và xác định gốc mới
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;
    
    // 2. Tạo trục thời gian (n) cho cả 2 tín hiệu để vẽ đồ thị
    nx = (1:length(xn)) - xorigin; 
    ny = (1:length(yn)) - yorigin;
    
    // Tìm khoảng giới hạn chung (min, max) để đồng bộ khung hình đồ thị
    x_min = min(min(nx), min(ny)) - 1; 
    x_max = max(max(nx), max(ny)) + 1;
    y_min = min(min(xn), min(yn)) - 1;
    y_max = max(max(xn), max(yn)) + 1;
    
    // 3. Hiển thị đồ thị trên cùng một cửa sổ
    clf();
    
    // Vẽ x(n) ở nửa trên
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=2);
    plot(nx, xn, 'b.');
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
    a.data_bounds = [x_min, y_min; x_max, y_max];
    title("Tín hiệu gốc x(n)");
    
    // Vẽ y(n) ở nửa dưới
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'r.');
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
    a.data_bounds = [x_min, y_min; x_max, y_max];
    title("Tín hiệu lật ngược y(n) = x(-n)");
endfunction

// Test
[yn, yorigin] = fold ([1, -2, 3, 6], 3);

