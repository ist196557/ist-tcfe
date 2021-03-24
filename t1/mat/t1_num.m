close all
clear all

printf("Values used:\n");
R1 = 1.0476827939 
R2 = 2.06734674703 
R3 = 3.11772752237 
R4 = 4.18589931649 
R5 = 3.07515052435 
R6 = 2.05395043467 
R7 = 1.00552689939
Va = 5.02190737223 
Id = 1.00982059009 
Kb = 7.20043221704 
Kc = 8.2448059697 

printf("\nMesh analysis:\n");
A = [R1+R3+R4,R3,R4,0;-Kb*R3,1-Kb*R3,0,0;R4,0,R4+R6+R7-Kc,0;0,0,0,1]
b = [Va;0;0;-Id]
x = A\b
printf("opMesh_TAB\n")
printf("Ia = %f\nIb = %f\nIc = %f\nId = %f",x(1),x(2),x(3),x(4))
printf("\nopMesh_END\n\n")

printf("\nCurrents through resistors:\n");
I = [-x(1);x(2);x(1)+x(2);x(1)+x(3);x(2)+x(4);x(3);x(3)]
printf("opMeshResCurrents_TAB\n")
printf("I1 = %f\nI2 = %f\nI3 = %f\nI4 = %f\nI5 = %f\nI6 = %f\nI7 = %f\n",I(1),I(2),I(3),I(4),I(5),I(6),I(7))
printf("opMeshResCurrents_END\n\n")

printf("\nVoltage drops across resistors:\n");
V = [R1*I(1);R2*I(2);R3*I(3);R4*I(4);R5*I(5);R6*I(6);R7*I(7)]
printf("opMeshResVoltages_TAB\n")
printf("V2-V1 = %f\nV3-V2 = %f\nV2-V4 = %f\nV4-V0 = %f\nV4-V5 = %f\nV0-V6 = %f\nV6-V7 = %f\n",V(1),V(2),V(3),V(4),V(5),V(6),V(7))
printf("opMeshResVoltages_END\n\n")

printf("\n\nNode analysis:\n");
G1 = 1/R1
G2 = 1/R2
G3 = 1/R3
G4 = 1/R4
G5 = 1/R5
G6 = 1/R6
G7 = 1/R7
printf("\n")
C = [1,0,0,0,0,0,0;-G1,G1+G2+G3,-G2,-G3,0,0,0;0,-G2-Kb,G2,Kb,0,0,0;0,Kb,0,-G5-Kb,G5,0,0;0,0,0,0,0,G6+G7,-G7;0,-G3,0,G3+G4+G5,-G5,-G7,G7;0,0,0,1,0,Kc*G6,-1]
d = [Va;0;0;Id;0;-Id;0]
y=C\d
printf("opNode_TAB\n")
printf("V1 = %f\nV2 = %f\nV3 = %f\nV4 = %f\nV5 = %f\nV6 = %f\nV7 = %f",y(1),y(2),y(3),y(4),y(5),y(6),y(7))
printf("\nopNode_END\n\n")

printf("\nCurrents through resistors:\n");
I1 = (y(2)-y(1))/R1
I2 = (y(3)-y(2))/R2
I3 = (y(2)-y(4))/R3
I4 = y(4)/R4
I5 = (y(4)-y(5))/R5
I6 = -y(6)/R6
I7 = (y(6)-y(7))/R7
printf("\nopNodeResCurrents_TAB\n")
printf("I1 = %f\nI2 = %f\nI3 = %f\nI4 = %f\nI5 = %f\nI6 = %f\nI7 = %f\n",I1,I2,I3,I4,I5,I6,I7)
printf("opNodeResCurrents_END\n\n")

