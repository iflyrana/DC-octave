clc;
close all;
clear all;

pkg load statistics;

y = normrnd(0, 1, 1, 200);
Gy = periodogram(y);

Ry = abs(ifft(Gy, 256));

t = -127:0:128;

figure(1)
plot(Gy);
xlabel('Frequency Lables');
title('PSD');

figure(2)
stem(t, Ry);
xlabel('time shift');
title('Autocorelation');

