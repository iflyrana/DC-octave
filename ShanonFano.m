 clc, clearvars, close all;


pkg load communications;

symbols = 1:4;
p = [0.5, 0.25, 0.15, 0.1];

disp("\nSymbols = ");
disp(symbols);

disp("\nProb = ");
disp(p);

dict = shannonfanodict(symbols,p);

disp("\nShannon Fano Dictionary = ");
disp(dict);

inputSig= randsrc(10,1,[symbols;p]);

disp("\nRandom Generated input symbols are");
disp(inputSig);

code = shannonfanoenco(inputSig, dict);
disp("\n Encoded Message is = ");
disp(code)

decode = shannonfanodeco(code, dict);
disp("\n decoded Message is = ");
disp(decode)



