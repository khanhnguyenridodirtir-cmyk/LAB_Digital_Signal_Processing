// Ngay 09/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250


function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    Nx = length(xn);
    Nh = length(hn);
    Ny = Nx + Nh - 1;
    

    yn = zeros(1, Ny);
    for i = 1:Nx
        for j = 1:Nh
            yn(i + j - 1) = yn(i + j - 1) + xn(i) * hn(j);
        end
    end
    

    yorigin = xorigin + horigin - 1;

  
    nx = (1:Nx) - xorigin;
    nh = (1:Nh) - horigin;
    ny = (1:Ny) - yorigin;

    // 4. Giới hạn khung nhìn đồ thị
    pad = 1;
    n_min = min([nx, nh, ny]) - pad;
    n_max = max([nx, nh, ny]) + pad;
    v_min = min([xn, hn, yn]) - 1;
    v_max = max([xn, hn, yn]) + 1;

    clf(); // Làm sạch cửa sổ đồ họa
    
    // --- Subplot 1: Tín hiệu ngõ vào x(n) ---
    subplot(3,1,1);
    plot([n_min, n_max], [0, 0], "k--");     // Trục ngang y = 0
    plot([0, 0], [v_min, v_max], "k:");     // Trục dọc n = 0
    plot2d3(nx, xn, 2); plot(nx, xn, 'ro');
    
    a1 = gca();
    p1 = a1.children(2).children;           
    p1.thickness = 2;
    a1.data_bounds = [n_min, v_min; n_max, v_max];
    xgrid(4); ylabel('x(n)'); title('Tín hiệu ngõ vào x(n)');

    // --- Subplot 2: Đáp ứng xung h(n) ---
    subplot(3,1,2);
    plot([n_min, n_max], [0, 0], "k--");     // Trục ngang y = 0
    plot([0, 0], [v_min, v_max], "k:");     // Trục dọc n = 0
    plot2d3(nh, hn, 5); plot(nh, hn, 'ro');
    
    a2 = gca();
    p2 = a2.children(2).children;
    p2.thickness = 2;
    a2.data_bounds = [n_min, v_min; n_max, v_max];
    xgrid(4); ylabel('h(n)'); title('Đáp ứng xung h(n)’');

    // --- Subplot 3: Tín hiệu tích chập y(n) ---
    subplot(3,1,3);
    plot([n_min, n_max], [0, 0], "k--");     // Trục ngang y = 0
    plot([0, 0], [v_min, v_max], "k:");     // Trục dọc n = 0
    plot2d3(ny, yn, 3); plot(ny, yn, 'ro');
    
    a3 = gca();
    p3 = a3.children(2).children;
    p3.thickness = 2;
    a3.data_bounds = [n_min, v_min; n_max, v_max];
    xgrid(4); xlabel('Chỉ số mẫu (n)'); ylabel('y(n)'); 
    title('Tín hiệu ngõ ra y(n) = x(n) * h(n)');
endfunction
xn = [-1,0,2,1,1];
xorigin = 2;

hn = [2, 1, 1];
horigin = 1;

// Chạy hàm
[yn, yorigin] = convolution(xn, xorigin, hn, horigin);

// In kết quả kiểm tra
disp("Mảng y(n) = ", yn);
disp("Gốc yorigin = ", yorigin);
