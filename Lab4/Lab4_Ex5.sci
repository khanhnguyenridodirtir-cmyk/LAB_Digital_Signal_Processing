// Nguyễn Duy Khánh - 2411516
// Phan Quốc Huy - 2411250
// Ngày 23-10-2026
clc;
clear;
atomsLoad("IPCV");

// Đọc ảnh
RGB = imread("C:\Users\Duy Khanh\Documents\DPS_LAB\Lab4\anhtest.jpg");


// Chuyen anh sang kieu double de xu ly
I_double = im2double(RGB);


//==========================================
// 2. Đổi màu ảnh
//==========================================
I = rgb2gray(RGB); // Đổi màu ảnh thành màu xám


 // ==========================================
 // 3. FIGURE 3: WATERMARK
 // ==========================================

 // Các vị trí chèn watermark [x, y]
positions = [];

 // Tạo lưới vị trí watermark
 for y = 50:100:size(I, 1)-20
     for x = 50:180:size(I, 2)-20
         positions = [positions; x, y];
     end
 end

 I_watermark = I;

 for k = 1:size(positions, 1)
     I_watermark = imaddtext(I_watermark, ...
         "Copyright", ...
         positions(k, 1), positions(k, 2), ...
         5, 2, 'white', 45, 0);
         
        clf();
 end


 // Hiển thị và lưu ảnh
scf(1);
clf();
title("Ảnh gốc");
imshow(RGB);

scf(2); 
clf();
title("Ảnh sau khi đổi màu thành màu xám");
imshow(I);

scf(3);
clf();
 xtitle("Anh co watermark");
 imshow(I_watermark);

 imwrite(I_watermark, "C:\Users\Duy Khanh\Documents\DPS_LAB\Lab4\watermark.jpg");
