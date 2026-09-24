% Soal 1 - Galat e^0,3 dengan Deret Taylor

fprintf('\n=== SOAL 1 - GALAT e^0,3 DENGAN DERET TAYLOR ===\n');

x = 0.3;
eksak = exp(x);

fprintf('Nilai eksak = %.10f\n\n', eksak);
fprintf('n\tHampiran\t\tGalat Mutlak\t\tGalat Relatif\n');

for n = 0:4
    p = 0;

    for i = 0:n
        p = p + x^i / factorial(i);
    end

    galat_mutlak = abs(eksak - p);
    galat_relatif = (galat_mutlak / abs(eksak)) * 100;

    fprintf('%d\t%.10f\t\t%.10f\t\t%.6f%%\n', ...
        n, p, galat_mutlak, galat_relatif);
end


% Soal 2 - Galat Penjumlahan 1/1 + 1/2 + ... + 1/20

fprintf('\n=== SOAL 2 - GALAT PENJUMLAHAN ===\n');

N = 20;

% Perhitungan secara eksak
L = 1;

for k = 1:N
    L = lcm(L, k);
end

pembilang = 0;

for k = 1:N
    pembilang = pembilang + L / k;
end

eksak = pembilang / L;

fprintf('Nilai eksak = %.10f\n\n', eksak);

% Masing-masing pembagian dibulatkan
fprintf('=== PEMBULATAN SETIAP SUKU ===\n');
fprintf('Desimal\tHasil\t\t\tGalat Mutlak\n');

for d = [2 3 4]
    hasil = 0;

    for k = 1:N
        hasil = hasil + round((1 / k) * 10^d) / 10^d;
    end

    galat = abs(eksak - hasil);

    fprintf('%d\t%.10f\t\t%.10f\n', d, hasil, galat);
end

% Tanpa looping menggunakan fungsi sum
fprintf('\n=== TANPA LOOPING MENGGUNAKAN SUM ===\n');

hasil_sum = sum(1 ./ (1:N));
galat_sum = abs(eksak - hasil_sum);

fprintf('Hasil = %.10f\n', hasil_sum);
fprintf('Galat = %.10f\n', galat_sum);


% Soal 3 - Galat sin(1) dengan Deret Taylor

fprintf('\n=== SOAL 3 - GALAT sin(1) DENGAN DERET TAYLOR ===\n');

x = 1;
eksak = sin(x);

fprintf('Nilai eksak = %.10f\n\n', eksak);
fprintf('N\tHampiran\t\tGalat Mutlak\t\tGalat Relatif\n');

for N = 1:5
    p = 0;

    for n = 0:N
        p = p + ((-1)^n * x^(2*n+1)) / factorial(2*n+1);
    end

    galat_mutlak = abs(eksak - p);
    galat_relatif = (galat_mutlak / abs(eksak)) * 100;

    fprintf('%d\t%.10f\t\t%.12e\t%.8e%%\n', ...
        N, p, galat_mutlak, galat_relatif);
end
