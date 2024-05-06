%M QAM
clc;
close all;
clear all;

pkg load communications;

N = 1000;

mlevel = 4;
k = log2(mlevel);

x = randi([0,1], N, 1);

xsym = bi2de(reshape(x, k, length(x)/k).', 'left-msb');

xmod = qammod(xsym, mlevel);

snrval = 1:50;
berval = zeros(size(snrval));

for idx = 1:length(snrval)
  snr = snrval(idx);

  txawgn = awgn(xmod, snr, 'measured');
  rx = txawgn;

  rxd = qamdemod(rx, mlevel);

  z = de2bi(rxd, 'left-msb');
  rxbitstream = reshape(z.', prod(size(z)), 1);

  [no_of_err, b_e_r] = biterr(x, rxbitstream);
  ber_val(idx) = b_e_r;
end

figure;
semilogy(snrval, ber_val, 'bo-');
grid on;
xlabel('SNR (DB)');
ylabel('BER');
