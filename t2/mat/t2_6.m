close all
clear all

pkg load symbolic
pkg load control

warning('off','all');

data = importdata('data.txt');

%printf("Values used:\n");
R1 = vpa(data.data(1)*1e3);
R2 = vpa(data.data(2)*1e3);
R3 = vpa(data.data(3)*1e3);
R4 = vpa(data.data(4)*1e3);
R5 = vpa(data.data(5)*1e3);
R6 = vpa(data.data(6)*1e3);
R7 = vpa(data.data(7)*1e3);
C = data.data(9)*1e-6;
Kb = vpa(data.data(10)*1e-3);
Kd = vpa(data.data(11)*1e3);

syms f real;
Zc_Inverse=j*2*pi*f*C;

%printf("\n\nNode analysis:\n");
G1 = vpa(1/R1);
G2 = vpa(1/R2);
G3 = vpa(1/R3);
G4 = vpa(1/R4);
G5 = vpa(1/R5);
G6 = vpa(1/R6);
G7 = vpa(1/R7);
printf("\n");

A = [[-G1, G1+G2+G3,-G2,-G3,0,0,0];
     [0,-G2-Kb,G2,Kb,0,0,0];
     [0,Kb,0,-Kb-G5,G5+Zc_Inverse,0,-Zc_Inverse];
     [0,0,0,0,0,G6+G7,-G7];
     [1,0,0,0,0,0,0];
     [0,0,0,1,0,Kd*G6,-1];
     [0,-G3,0,G3+G4+G5,-Zc_Inverse,-G7,G7+Zc_Inverse]];
d = [0;0;0;0;1;0;0];
y = A\d;

printf('\nV6: \n\n');
y(5)
[N1, D1] = numden(y(5));

printf('\nV8: \n\n');
y(7)
[N2, D2] = numden(y(7));

F=logspace(-1, 6, 200);
numer6 = [double(imag(N1)/f),double(real(N1))]
denom6 = [double(imag(D1)/f),double(real(D1))]

v_6 = tf(numer6, denom6);

numer8 = [double(imag(N2)/f),double(real(N2))]
denom8 = [double(imag(D2)/f),double(real(D2))]

v_8 = tf(numer8,denom8);

v_c = v_6-v_8;

numers = [0, 1];
denoms = [0, 1];

v_s = tf(numers, denoms);

f5 = figure();
bode(v_6, v_c, v_s, F)

xlabel ('log(f) [Hz]');
print (f5, 't2_6_Oct.eps', '-depsc');
printf("t2_6_Oct_FIG\n")