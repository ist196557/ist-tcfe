close all
clear all

data = importdata('data.txt');

printf("Values used:\n");
R1 = data.data(1)*1e3
R2 = data.data(2)*1e3
R3 = data.data(3)*1e3
R4 = data.data(4)*1e3
R5 = data.data(5)*1e3
R6 = data.data(6)*1e3
R7 = data.data(7)*1e3
C = data.data(9)*1e-6
Kb = data.data(10)*1e-3
Kd = data.data(11)*1e3
w=2*pi*1e3

printf("\n\nNode analysis:\n");
G1 = 1/R1
G2 = 1/R2
G3 = 1/R3
G4 = 1/R4
G5 = 1/R5
G6 = 1/R6
G7 = 1/R7
printf("\n")
A = [-G1, G1+G2+G3,-G2,-G3,0,0,0;0,-G2-Kb,G2,Kb,0,0,0;0,Kb,0,-Kb-G5,G5+j*w*C,0,-j*w*C;0,0,0,0,0,G6+G7,-G7;1,0,0,0,0,0,0;0,0,0,1,0,Kd*G6,-1;0,-G3,0,G3+G4+G5,-G5-j*w*C,-G7,G7+j*w*C]
d = [0;0;0;0;1;0;0]
y = A\d
printf("t2_4_Oct_TAB\n")
printf("V1= %f\n", abs(y(1)))
printf("V2= %f\n", abs(y(2)))
printf("V3= %f\n", abs(y(3)))
printf("V5= %f\n", abs(y(4)))
printf("V6= %f\n", abs(y(5)))
printf("V7= %f\n", abs(y(6)))
printf("V8= %f\n", abs(y(7)))
printf("t2_4_Oct_END\n\n")