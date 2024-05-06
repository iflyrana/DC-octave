clc;
close all;
clear all;

pkg load statistics;

m = 1;
sd = 0.5;

x = -6:0.1:6;

y = normpdf(x, m, sd);

figure(1)

plot(x,y);



xlabel = ('X valuses');
ylabel = ('PDF');

grid on;
