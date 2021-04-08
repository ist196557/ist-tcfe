close all
clear all

data = importdata('data.txt');
S = load("t2_1.mat","V6_8");

printf("Values used:\n");
R1 = data.data(1)*1e3
R2 = data.data(2)*1e3
R3 = data.data(3)*1e3
R4 = data.data(4)*1e3
R5 = data.data(5)*1e3
R6 = data.data(6)*1e3
R7 = data.data(7)*1e3
Vs = 0
C = data.data(9)*1e-6
Kb = data.data(10)*1-3
Kd = data.data(11)*1e3
Vx= S.V6_8(1)-S.V6_8(2)

printf("\n\nNode analysis:\n");
G1 = 1/R1
G2 = 1/R2
G3 = 1/R3
G4 = 1/R4
G5 = 1/R5
G6 = 1/R6
G7 = 1/R7
printf("\n")
A = [-G1, G1+G2+G3,-G2,-G3,0,0,0;0,-G2-Kb,G2,Kb,0,0,0;0,0,0,0,0,G6+G7,-G7;1,0,0,0,0,0,0;0,0,0,0,1,0,-1;0,0,0,1,0,Kd*G6,-1;0,Kb-G3,0,-Kb+G3+G4,0,-G7,G7]
d = [0;0;0;Vs;Vx;0;0]
y = A\d
printf("t2_2_Oct_TAB\n")
printf("V1 = %f\nV2 = %f\nV3 = %f\nV5 = %f\nV6 = %f\nV7 = %f\nV8 = %f\n",y(1),y(2),y(3),y(4),y(5),y(6),y(7))
printf("Ix = %f\n", -y(5)/R5)
printf("Req = %f\n", Vx/(-y(5)/R5))
printf("$\\tau$ = %f\n", Vx/(-y(5)/R5)*C)
printf("t2_2_Oct_END\n\n")

R_eq = [Vx/(-y(5)/R5)];
save t2_2.mat R_eq