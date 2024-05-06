clc;
close all;
clear all;

pkg load communications;

n = input('Enter the no.of code bits: ');
k = input('Enter the number of message bits: ');
p = input('Enter parity matrix: ');
disp('Parity Matrix'); disp(p);

I = eye(k);
G = [I, p];
disp('Generator Matrix'); disp(G);

m = dec2bin(0:1:2^k-1);

disp('Message Words');
disp(m);

C = m * G;

for i = 1:2^k
  for j = 1:n
    C(i,j) = mod(C(i, j), 2);
  endfor
endfor

weight = sum(C');
disp('Hamming weights of codes= '); disp(weight');

disp('CodeWords'); disp(C);

weight(1,1) = weight(1, 2);

d = min(weight)

Td = d - 1;

disp('Minimum hamming weight= '); disp(d);
disp('Td= '), disp(Td);



