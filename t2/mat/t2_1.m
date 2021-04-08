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
Vs = data.data(8) 
C = data.data(9)*1e-6
Kb = data.data(10)*1e-3
Kd = data.data(11)*1e3

printf("\n\nNode analysis:\n");
G1 = 1/R1
G2 = 1/R2
G3 = 1/R3
G4 = 1/R4
G5 = 1/R5
G6 = 1/R6
G7 = 1/R7
printf("\n")
A = [-G1, G1+G2+G3,-G2,-G3,0,0,0;0,-G2-Kb,G2,Kb,0,0,0;0,Kb,0,-Kb-G5,G5,0,0;0,0,0,0,0,G6+G7,-G7;1,0,0,0,0,0,0;0,-G3,0,G5+G3+G4,-G5,-G7,G7;0,0,0,1,0,Kd*G6,-1]
d = [0;0;0;0;Vs;0;0]
y = A\d

printf("\nCurrents through resistors:\n");
I1 = -(y(2)-y(1))/R1
I2 = -(y(2)-y(3))/R2
I3 = (y(2)-y(4))/R3
I4 = y(4)/R4
I5 = (y(4)-y(5))/R5
I6 = -y(6)/R6
I7 = (y(6)-y(7))/R7
I_Hd = -I7
I_c=0

printf("\nt2_1_Oct_TAB\n")
printf("V1 = %f\nV2 = %f\nV3 = %f\nV5 = %f\nV6 = %f\nV7 = %f\nV8 = %f\n",y(1),y(2),y(3),y(4),y(5),y(6),y(7))
printf("I1 = %f\nI2 = %f\nI3 = %f\nI4 = %f\nI5 = %f\nI6 = %f\nI7 = %f\nI(Hd) = %f\nI(c) = %f",I1,I2,I3,I4,I5,I6,I7,I_Hd,I_c)
printf("\nt2_1_Oct_END\n\n")

V6_8 = [y(5), y(7)];
save t2_1.mat V6_8