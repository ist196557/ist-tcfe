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
A = [R1+R3+R4,R3,R4,0;-Kb*R3,1-Kb*R3,0,0;R4,0,R4+R6+R7-Kc,0;0,0,0,1];
b = [Va;0;0;-Id];
x = A\b

printf("Node analysis:\n");
G1 = 1/R1;
G2 = 1/R2;
G3 = 1/R3;
G4 = 1/R4;
G5 = 1/R5;
G6 = 1/R6;
G7 = 1/R7;

C = [G1,-G1-G3-G2,G2,G3,0,0,0;0,Kb+G2,-G2,-Kb,0,0,0;0,-Kb,0,G5+Kb,-G5,0,0;0,0,0,0,0,-G6-G7,G7;1,0,0,0,0,0,0;0,0,0,1,0,Kc*G6,-1;0,G3,0,-G4-G3-G5,G5,G7,-G7];
d = [0;0;-Id;0;Va;0;Id];
y=C\d

printf("Mesh analysis: i[R7]= %f",(y(6)-y(7))/R7)
printf("\nNode analysis: i[R7]= %f\n",x(3))