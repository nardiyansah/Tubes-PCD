image_folder = 'dataset';
% dir itu untuk list content dalam directory
% fullfile itu untuk membuat semua properti dari sebuah file, trus
% nyambungin path kayak os.path.join
filenames = dir(fullfile(image_folder, '*.jpg'));
% numel untuk menghitung jumlah element dalam suatu list
total_images = numel(filenames);

for n = 1:total_images
    % membuat nama 1 file untuk setiap iterasi
    full_name = fullfile(image_folder, filenames(n).name);
    % imread untuk membaca gambar
    img = imread(full_name);
    % cek apakah sudah potrait
    [rows, columns, channels] = size(img);
    if columns > rows
        % imrotate untuk merotasi gambar
        img = imrotate(img, 90);
    end
    % meresize ukuran gambar supaya ukuran dataset sama
    img_resize = imresize(img, [256,192]);
    
    % CIRI BENTUK
    % mencoba segmentasi dengan tresholding
    % rgb2gray untuk mengubah gambar rgb menjadi gray
    img_gray = rgb2gray(img_resize);
    % mencoba convert grayscale ke binary dengan thresholding adaptive
    img_bw = imbinarize(img_gray, "adaptive");
    % membuang object yang punya piksel dibawah batas, siapa tau ada noise
    % di sekitar. batas 10 cuma perkiraan
    img_obj = bwareaopen(img_bw, 10);
    % mengambil properti bentuk
    stats = regionprops(img_obj,'Area','Perimeter','Eccentricity');
    area(n) = stats.Area;
    perimeter(n) = stats.Perimeter;
    metric(n) = 4*pi*area(n)/(perimeter(n)^2);
    eccentricity(n) = stats.Eccentricity;
    
    % CIRI WARNA
    % rgb2hsv untuk mengubah rgb ke hsv
    img_hsv = rgb2hsv(img_resize);
    % mengekstrak masing-masing komponen Hue, Saturation, Value
    H = img_hsv(:,:,1);
    S = img_hsv(:,:,2);
    V = img_hsv(:,:,3);
    % dari tutorial dia melakukan tresholing pada komponen saturation
    S_bw = im2bw(S,.25);
    % nilai 20 aku ambil karena ukuran gambarnya yang jadi lebih kecil
    S_bw = bwareaopen(S_bw,20);
    % mengambil citra RGB hasil segmentasi
    R = img_resize(:,:,1);
    G = img_resize(:,:,2);
    B = img_resize(:,:,3);
    
    R(~S_bw) = 0;
    G(~S_bw) = 0;
    B(~S_bw) = 0;
    
    RGB = cat(3,R,G,B);
    
    % mencari titik yang berwarna putih di gambar segmentasi
    [a,b] = find(S_bw==1);
    Red = 0;
    Green = 0;
    Blue = 0;
    
    for m = 1:numel(a)
        Red = Red + double(R(a(m),b(m)));
        Green = Green + double(G(a(m),b(m)));
        Blue = Blue + double(B(a(m),b(m)));
    end
    
    % menghitung besaran komposisi dari setiap warna
    Red = Red/numel(a);
    Green = Green/numel(a);
    Blue = Blue/numel(a);
    
    red(n) = Red;
    green(n) = Green;
    blue(n) = Blue;
end

input = [metric;eccentricity];
% membuat urutan label dari data citra latih (ada 75 data)
label = zeros(1,75);
% keterangan label : Cocor Bebek (1), Jambu (2), Kacang Panjang (3),
% Singkong (4), Tomat (5)
label(:,1:15) = 1;
label(:,16:30) = 2;
label(:,31:45) = 3;
label(:,46:60) = 4;
label(:,61:75) = 5;

% ekstrak fitur ke dalam bentuk csv
writematrix(area, 'area.csv');
writematrix(perimeter, 'perimeter.csv');
writematrix(metric, 'metric.csv');
writematrix(eccentricity, 'eccentricity.csv');
writematrix(red,'red.csv');
writematrix(green,'green.csv');
writematrix(blue,'blue.csv');
writematrix(label, 'label.csv');
