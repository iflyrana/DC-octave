#Huffman code

clc;
clear all;
close all;

pkg load communications;

symbols = 1:4;

p = [0.40 0.30 0.20 0.10];

disp('Symbols are: '); disp(symbols);
disp('probablities are: '); disp(p);

dict = huffmandict(symbols, p);

#inputsig = input('Enter Signal: ')
inputsig = randsrc(10, 1, [symbols;p]);
disp('Input signal: '); disp(inputsig);
hcod = huffmanenco(inputsig, dict);
disp('Encoded huffman code: '); disp(hcod)

hdecod = huffmandeco(hcod, dict);
disp('Dencoded huffman code: '); disp(hdecod);
