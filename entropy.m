clc, clearvars, close all;


n = input("Enter Number of Source Elements: ");
q = input("Enter the channle Matrix: ");

p = input("Enter the Source Probability: ");

px = diag(p,n,n);

py = p*q;

pxy = px*q;

Hx = 0;
Hy = 0;
Hxy = 0;

for i = 1:n
    Hx = Hx - p(i)*log2(p(i));
    Hy = Hy - py(i)*log2(py(i));
    for j = 1:n
        Hxy = Hxy - pxy(i,j)*log2(pxy(i,j));
    end
end




disp("Hx: ")
disp(Hx);

disp("Hy: ")
disp(Hy);

disp("Hx,y:");
disp(Hxy);
h1 = Hxy - Hx;
h2 = Hxy - Hy;

disp("Hy/x: ")
disp(h1);
disp("Hx/y: ")
disp(h2);

disp("Ixy:")
disp(Hx-h2);
