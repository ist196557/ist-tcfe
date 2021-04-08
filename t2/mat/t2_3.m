clear all 
close all

% Nodal analysis for determining v6(inf)
data = importdata('data.txt');
S = load("t2_1.mat","V6_8");
S2 = load("t2_2.mat","R_eq");

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
A = [G1+G2+G3,-G2,-G3,0,0,0;-G2-Kb,G2,Kb,0,0,0;Kb,0,-Kb-G5,G5,0,0;0,0,0,0,G6+G7,-G7;0,0,1,0,Kd*G6,-1;-G3,0,G3+G4+G5,-G5,-G7,G7]
d = [0;0;0;0;0;0]
y = A\d
%printf("t2_3_TAB\n")
%printf("V2 = %f\nV3 = %f\nV5 = %f\nV6 = %f\nV7 = %f\nV8 = %f",y(1),y(2),y(3),y(4),y(5),y(6))
%printf("\nt2_3_END\n\n")

% Time vector
t = 0: 1e-6: 20e-3;

Vx = S.V6_8(1)-S.V6_8(2)
R_eq = S2.R_eq*(-1)

% Voltage across capacitor
V6 = Vx * exp(-t/(R_eq*C));

plot (t*1e3, V6)

xlabel("t [ms]")
ylabel("V_{6} [V]")
legend("V_{6}(t)")

print ("t2_3_Oct.eps", "-depsc");
printf("t2_3_Oct_FIG\n")