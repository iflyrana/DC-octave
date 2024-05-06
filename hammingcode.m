clc, clearvars, close all;


n = input("Enter Number of code bits: ");
k = input("Enter the message Bits: ");

p = input("Enter parity matrix");

I = eye(k);

G = [I,p];


m = dec2bin(0:1:2^k-1);


C = m*G;

for i = 1:2^k
    for j = 1:n
        C(i,j) = mod(C(i,j),2);
    end
end

weight = sum(C');
disp("\nHamming Weight = ");
disp(weight');


weight(1,1) = weight(1,2);

d = min(weight);
td = d-1
disp("\ntd = ");
disp(td);

tc = td/2
disp("\ntc = ");
disp(tc);

H = [p', eye(n-k)];
disp("\nH = [P': I(n-k)]");
disp(H)

disp("H' = ");
disp(H');


E = eye([n,n]);

r = input("Enter the recieved Codeword(r) = ");
s = r*H';


for i = 1:n-k
    s(1,i) = mod(s(1,i),2);
end

h = H';


disp("\nSyndrome = ");
disp(s);

if s == [0 0 0]
    disp("Valid Code Word");
else
    for i = 1:n
        if s==h(i,:)
            error = i;
            break;
        end
    end
end

disp("Error At = ");
disp(error);

disp("\nError Pattern = ");
disp(E(error,:));


c = mod(r + E(error,:),2);

disp("\nCorrected Code = ");
disp(c);
