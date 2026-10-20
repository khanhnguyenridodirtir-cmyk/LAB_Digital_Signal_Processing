// Ngay 09/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

function [yn, yorigin] = delay (xn, xorigin, k)
    // 1. Tính toán vị trí gốc mới
    newOrigin = xorigin - k;
    
    // Nếu gốc mới <= 0, chèn thêm zero vào trước mảng để giữ chỉ số >= 1
    if newOrigin < 1 then
        pad_len = 1 - newOrigin;
        yn = [zeros(1, pad_len), xn];
        yorigin = 1;
    else
        yn = xn;
        yorigin = newOrigin;
    end
    
    // 2. Tạo trục thời gian (n) cho cả 2 tín hiệu để vẽ đồ thị
    nx = (1:length(xn)) - xorigin; 
    ny = (1:length(yn)) - yorigin;
    
    // Tìm khoảng giới hạn chung (min, max) cho cả 2 đồ thị
    // Trừ 1 và cộng 1 để tự động tạo khoảng trống 2 bên lề
    x_min = min(min(nx), min(ny)) - 1; 
    x_max = max(max(nx), max(ny)) + 1;
    
    // Tìm giới hạn trục tung (biên độ y) để 2 đồ thị cao bằng nhau
    y_min = min(min(xn), min(yn)) - 1;
    y_max = max(max(xn), max(yn)) + 1;
    
    // 3. Hiển thị đồ thị trên cùng một cửa sổ (Figure)
    clf(); // Xóa figure hiện tại để vẽ mới
    
    // Vẽ x(n) ở nửa trên
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=2); // Vẽ dạng stem (đường thẳng đứng) màu xanh
    plot(nx, xn, 'b.');       // Thêm dấu chấm màu xanh ở đầu mút
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
    a.data_bounds = [x_min, y_min; x_max, y_max]; // Đồng bộ khung nhìn
    title("Tín hiệu gốc x(n)");
    
    // Vẽ y(n) ở nửa dưới
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=5); // Vẽ dạng stem màu đỏ
    plot(ny, yn, 'r.');       // Thêm dấu chấm màu đỏ ở đầu mút
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
    a.data_bounds = [x_min, y_min; x_max, y_max];
    title("Tín hiệu dịch trễ y(n) = x(n - " + string(k) + ")");
endfunction

// Test
[yn, yorigin] = delay ([1, -2, 3, 6], 3, 1);

