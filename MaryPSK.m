clc;
close all;
clear all;

pkg load communications;

N = 3000;
X = randi([0,1],1,N);

M = 8 %8-Ary PSK
yy = [];
for i=1:3:length(X)
   if X(i) == 0 && X(i+1) == 0 && X(i+2) == 0
     y = cosd(0) + 1j*sind(0);
   elseif X(i) == 0 && X(i+1) == 0 && X(i+2) == 1
     y = cosd(45) + 1j*sind(45);
   elseif X(i) == 0 && X(i+1) == 1 && X(i+2) == 1
     y = cosd(90) + 1j*sind(90);
   elseif X(i) == 0 && X(i+1) == 1 && X(i+2) == 0
     y = cosd(135) + 1j*sind(135);
   elseif X(i) == 1 && X(i+1) == 1 && X(i+2) == 0
     y = cosd(180) + 1j*sind(180);
   elseif X(i) == 1 && X(i+1) == 1 && X(i+2) == 1
     y = cosd(225) + 1j*sind(225);
   elseif X(i) == 1 && X(i+1) == 0 && X(i+2) == 1
     y = cosd(270) + 1j*sind(270);
   elseif X(i) == 1 && X(i+1) == 0 && X(i+2) == 0
     y = cosd(315) + 1j*sind(315);
   end
   yy = [yy y];
 endfor
figure(1)
scatterplot(yy); %without noise

%Noise gen
EbN0db = 20;
EbN0 = 10^(EbN0db/10);

n = (1/sqrt(2))*[randn(1, length(yy)) + 1j*randn(1, length(yy))];
sigma = sqrt(1/((log2(M)) * EbN0));

r = yy + sigma*n;
figure(2);
scatterplot(r);
