// Ngay 09/10/2026
// Nguyen Duy Khanh - 2411516
// Phan Quoc Huy - 2411250

function [yn, yorigin] = advance(xn, xorigin, k)
 //====================================================
    // 1 Xác định hàm gốc và hàm mới
//====================================================

    yn = xn;
    yorigin = xorigin + k;
    
//====================================================
    // 2. Xác định trục và giới hạn để vẽ 
//====================================================
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
   // Giới hạn trục n mở rộng từ min-pad đến max+pad
    pad = 1;
    n_min = min([nx, ny]) - pad;
    n_max = max([nx, ny]) + pad;
//====================================================
    // 3.  Vẽ đồ thị x(n) và y(n) trên cùng một figure
//====================================================

   // figure;
    
    clf();
 // Vẽ đồ thị của hàm gốc   
    subplot(2,1,1);
    plot([n_min, n_max], [0, 0], "k--"); // Vẽ đường đứt nét màu đen tại y=0
    plot2d3(nx, xn,2);
    plot(nx,xn,'ro');
    a1 = gca();                 // Lấy handle của hệ trục tọa độ hiện tại (Get Current Axes)
    p1 = a1.children.children;  // Lấy đối tượng đường vẽ vừa tạo
    p1.thickness = 2;           // Tăng độ dày đường vẽ lên 2px
    a1.data_bounds = [n_min, min(xn)-1; n_max  , max(xn)+1];
     
    xgrid();
    xlabel('Chỉ số mẫu (n)'); ylabel('x(n)');
    title('Tín hiệu gốc x(n)');
// Vẽ đồ thị của hàm dịch 
    subplot(2,1,2);
    plot([n_min, n_max], [0, 0], "k--"); // Vẽ đường đứt nét màu đen tại y=0
    plot2d3(ny, yn,2);
    plot(ny,yn, 'ro');
    a2 = gca();                 // Lấy handle của hệ trục tọa độ hiện tại (Get Current Axes)
    p2 = a2.children.children;  // Lấy đối tượng đường vẽ vừa tạo
    p2.thickness = 2;           // Tăng độ dày đường vẽ lên 2px
    a2.data_bounds = [n_min, min(yn)-1; n_max  , max(yn)+1];
    
     
    xgrid();
    xlabel('Chỉ số mẫu (n)'); ylabel('y(n)');
    title('Tín hiệu dịch sớm y(n)');
    
endfunction

xn = [0,1,2,3,-1,2];
xorigin=2;
k=2;
[yn, yorigin] = advance(xn, xorigin, k);
