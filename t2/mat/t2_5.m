close all
clear all

data = importdata('data.txt');
S = load("t2_1.mat","V6_8");
S2 = load("t2_2.mat","R_eq");

%printf("Values used:\n");
R1 = data.data(1)*1e3;
R2 = data.data(2)*1e3;
R3 = data.data(3)*1e3;
R4 = data.data(4)*1e3;
R5 = data.data(5)*1e3;
R6 = data.data(6)*1e3;
R7 = data.data(7)*1e3;
C = data.data(9)*1e-6;
Kb = data.data(10)*1e-3;
Kd = data.data(11)*1e3;
w=2*pi*1e3;

%printf("\n\nNode analysis:\n");
G1 = 1/R1;
G2 = 1/R2;
G3 = 1/R3;
G4 = 1/R4;
G5 = 1/R5;
G6 = 1/R6;
G7 = 1/R7;
%printf("\n");
A = [-G1, G1+G2+G3,-G2,-G3,0,0,0;0,-G2-Kb,G2,Kb,0,0,0;0,Kb,0,-Kb-G5,G5+j*w*C,0,-j*w*C;0,0,0,0,0,G6+G7,-G7;1,0,0,0,0,0,0;0,0,0,1,0,Kd*G6,-1;0,-G3,0,G3+G4+G5,-G5-j*w*C,-G7,G7+j*w*C];
d = [0;0;0;0;1;0;0];
y = A\d;

t = -5e-3: 1e-6: 20e-3;
cond1 = t<=0;
cond2 = t>0;

%%%Values%%%
Vx = S.V6_8(1)-S.V6_8(2);
R_eq = S2.R_eq*(-1);

%V6n = Vx * exp(-t/(R_eq*C));
%V6f = imag(y(5)*exp(j*w*t));
%V6 = V6n + V6f;

%Vs = sin(w*t);
%%%Values%%%

V6t(cond1) = S.V6_8(1);
V6t(cond2) = Vx * exp(-t(cond2)/(R_eq*C)) + imag(y(5)*exp(j*w*t(cond2))); % V6

Vst(cond1) = data.data(8);
Vst(cond2) = sin(w*t(cond2)); % Vs

%plot (t*1e3, V6t);
%hold;
%plot(t*1e3, Vst);

plot (t*1e3, V6t, '-', t*1e3, Vst, '-')

%plot(t*1e3, V6n)

%plot(t*1e3, V6f)

xlabel("t [ms]");
ylabel("V [V]");
legend("V_{6}(t)","V_{s}(t)");

print ("t2_5_Oct.eps", "-depsc");
printf("t2_5_Oct_FIG\n")