close all
clear all

pkg load symbolic

syms R1
syms R2
syms R3
syms R4
syms R5
syms R6
syms R7
syms Va
syms Id
syms Kb
syms Kc

syms I_mesh_a
syms I_mesh_b
syms I_mesh_c
syms I_mesh_d

printf("\nKVL equation for mesh 'a':\n(R1+R3+R4)*I_mesh_a+R3*I_mesh_b+R4*I_mesh_c=Va");
%(R1+R3+R4)*I_mesh_a+R3*I_mesh_b+R4*I_mesh_c=Va

printf("\n\nBy inspection of mesh'b':\n(-Kb*R3)*I_mesh_a+(1-Kb*R3)*I_mesh_b=0");
%(-Kb*R3)*I_mesh_a+(1-Kb*R3)*I_mesh_b=0

printf("\n\nKVL equation for mesh 'c':\nR4*I_mesh_a+(R3+R6+R7-Kc)*I_mesh_c=0");
%R4*I_mesh_a+(R3+R6+R7-Kc)*I_mesh_c=0

printf("\n\nBy inspection of mesh'd':\nI_mesh_d = -Id");
%I_mesh_d = -Id

printf("\n\nSolving this system with respect to 'I_mesh_x', with x = a, b, c, d:\n");
eq1=(R1+R3+R4)*I_mesh_a+R3*I_mesh_b+R4*I_mesh_c==Va
eq2=(-Kb*R3)*I_mesh_a+(1-Kb*R3)*I_mesh_b==0
eq3=R4*I_mesh_a+(R3+R6+R7-Kc)*I_mesh_c-Kc*I_mesh_d==0
eq4=I_mesh_d == -Id
printf("\n");

[I_mesh_a,I_mesh_b,I_mesh_c,I_mesh_d]=solve(eq1,eq2,eq3,eq4,I_mesh_a,I_mesh_b,I_mesh_c,I_mesh_d)

%printf("\nUsing the values:\nR1= 1.0476827939\nR2 = 2.06734674703\nR3 = 3.11772752237\nR4 = 4.18589931649\nR5 = 3.07515052435\nR6 = 2.05395043467\nR7 = 1.00552689939\nVa = 5.02190737223\nId = 1.00982059009\nKb = 7.20043221704\nKc = 8.2448059697");
%printf("\nWe get:\n\n");
%Vals = [1.0476827939 2.06734674703 3.11772752237 4.18589931649 3.07515052435 2.05395043467 1.00552689939 5.02190737223 1.00982059009 7.20043221704 8.2448059697]
%subs(I_mesh_a,{R1 R2 R3 R4 R5 R6 R7 Va Id Kb Kc},Vals)