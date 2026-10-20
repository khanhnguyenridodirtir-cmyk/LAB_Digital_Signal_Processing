// Ngay 09/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

function[yn,yorigin]= add(x1n, x1origin, x2n, x2origin)
        n1x =  (1:length(x1n)) - x1origin;
        n2x =  (1:length(x2n)) - x2origin ;
        // 2. Xác định trục thời gian chung ny từ min đến max
          n_min = min([n1x, n2x]);
          n_max = max([n1x, n2x]);
          ny = n_min : n_max;
          
          y1 = zeros(1, length(ny));
          y2 = zeros(1, length(ny));
          
          yorigin = 1- n_min;
          
          y1(n1x - n_min + 1) = x1n;
          y2(n2x - n_min + 1) = x2n;
          
          
          yn = y1 + y2 ;
          
        clf();
        pad = 1;
        n_lim_min = n_min - pad;
        n_lim_max = n_max + pad;
        v_min = min([x1n, x2n, yn]) - 1;
        v_max = max([x1n, x2n, yn]) + 1;
    
        // Subplot 1: Tín hiệu x1(n)
        subplot(3,1,1);
        plot([0, 0], [v_min, v_max], "k:");
        plot([n_lim_min, n_lim_max], [0, 0], "k--");
        plot2d3(n1x, x1n, 2); plot(n1x, x1n, 'ro');
        gca().data_bounds = [n_lim_min, v_min; n_lim_max, v_max];
        xgrid(4); ylabel('x1(n)'); title('Tín hiệu x1(n)');
    
        // Subplot 2: Tín hiệu x2(n)
        subplot(3,1,2);
        plot([0, 0], [v_min, v_max], "k:");
        plot([n_lim_min, n_lim_max], [0, 0], "k--");
        plot2d3(n2x, x2n, 5); plot(n2x, x2n, 'ro');
        gca().data_bounds = [n_lim_min, v_min; n_lim_max, v_max];
        xgrid(); ylabel('x2(n)'); title('Tín hiệu x2(n)');
    
        // Subplot 3: Tín hiệu tổng y(n) = x1(n) + x2(n)
        subplot(3,1,3);
        plot([0, 0], [v_min, v_max], "k:");
        plot([n_lim_min, n_lim_max], [0, 0], "k--");
        plot2d3(ny, yn, 3); plot(ny, yn, 'ro');
        gca().data_bounds = [n_lim_min, v_min; n_lim_max, v_max];
        xgrid(); xlabel('Chỉ số (n)'); ylabel('y(n)'); title('Tin hiệu tổng y(n) = x1(n) + x2(n)');
endfunction


// --- CHẠY THỬ HÀM ---
x1n = [1, 2, 3, 4,0,-5];   x1origin = 3; // x1(n) từ n = -1 đến 2
x2n = [2, -1, 1, 3];  x2origin = 1; // x2(n) từ n = 0 đến 3

[yn, yorigin] = add(x1n, x1origin, x2n, x2origin);
