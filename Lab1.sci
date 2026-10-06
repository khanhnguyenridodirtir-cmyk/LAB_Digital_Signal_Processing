// Ngay 30/9/2026
// Nguyễn Duy Khánh - 2411516
//  Phan Quốc Huy - 2411520
// 1. Định nghĩa thông số
F = 50;                 // Tần số f = 100pi / (2pi) = 50 Hz
T = 1 / F;              // Chu kỳ T = 0.02s
t_max = 5 * T;          // Thời gian cho 5 chu kỳ = 0.1s
delta =0.1;
// 2. Tạo mảng thời gian t từ 0 đến 0.1s với 1000 điểm để đồ thị mượt
t = linspace(0, t_max, 1000);
n=0:29;
// Vẽ tính hiệu tương tự Xa(t)=3*Sin(100pi*t)

xa  = 3*sin(100*%pi*t);             // Tính giá trị xa tương ứng với t
xn = 3* sin(%pi * n /3);
xq = floor(xn / delta) * delta;
//. Vẽ đồ thị
clf();                  // Xóa màn hình vẽ cũ

// 1. Khung hình phía trên (Hàng 1 trong tổng số 2 hàng)
subplot(3, 1, 1); 
plot(t, xa, 'r-');
xtitle("1. Tín hiệu Analog Xa(t)", "t (s)", "Biên độ");
xgrid();

// 2. Khung hình phía dưới (Hàng 2 trong tổng số 2 hàng)
subplot(3, 1, 2); 
plot2d3(n, xn);
plot(n, xn, 'ro');
xtitle("2. Tín hiệu rời rạc x(n)", "n (mẫu)", "Biên độ");
xgrid();

subplot(3,1,3);
plot(n, xq, 'bo');
xtitle ("3. Tín hiệu rời rạc sau khi lượng tử hóa xq(n)", "n (mẫu)", "Biên độ");
xgrid();
