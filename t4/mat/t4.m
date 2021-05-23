%%%%%%gain stage
printf("\n\n\nGain stage\n\n");
VT=25e-3;   %thermal voltage
BFN=178.7;  %betaF
VAFN=69.7;   %VA
RE1=100;     
RC1=500;
RB1=80000;
RB2=20000;
VBEON1=0.7;    
VCC=12;     %Supply Voltage
RS=100;      %Internal resistance


%OP1 
RB=1/(1/RB1+1/RB2);                % Equivalent resistor
VEQ=RB2/(RB1+RB2)*VCC;              % Thévenin
IB1=(VEQ-VBEON1)/(RB+(1+BFN)*RE1);   
IC1=BFN*IB1;                         
IE1=(1+BFN)*IB1;                     
VE1=RE1*IE1;                              
VO1=VCC-RC1*IC1;   
%Check if VCE > VBE, so it is in the active zone                  
VCE1=VO1-VE1;                           


%%%%%%%%%%%%%%%%%%%%%%%% Incremental analysis for medium frequencies (capacitor as short circuit)
gm1=IC1/VT;
rpi1=BFN/gm1;
ro1=VAFN/IC1;

RSB=RB*RS/(RB+RS);        %Internal resistance in parallel with RB

%AV1 = RSB/RS * RC1*(RE1-gm1*rpi1*ro1)/((ro1+RC1+RE1)*(RSB+rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)
%AVI_DB = 20*log10(abs(AV1))

%AV1simple = - RB/(RB+RS) * gm1*RC1/(1+gm1*RE1)
%AVIsimple_DB = 20*log10(abs(AV1simple))


%%% Bypass capacitor behaves like a short circuit (equivalent to RE = 0) - for medium and higher frequencies
RE1=0;
AV1 = RSB/RS * RC1*(RE1-gm1*rpi1*ro1)/((ro1+RC1+RE1)*(RSB+rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2);
AVI_DB = 20*log10(abs(AV1));
%AV1simple =  - RSB/RS * gm1*RC1/(1+gm1*RE1);   % r0 -> infinity
%AVIsimple_DB = 20*log10(abs(AV1simple));

%%% Bypass capacitor behaves like an open circuit (equivalent to only RE) - for lower frequencies
%RE1=100
%ZI1 = 1/(1/RB+1/(((ro1+RC1+RE1)*(rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)/(ro1+RC1+RE1)))
%ZX = ro1*((RSB+rpi1)*RE1/(RSB+rpi1+RE1))/(1/(1/ro1+1/(rpi1+RSB)+1/RE1+gm1*rpi1/(rpi1+RSB)))
%ZX = ro1*(   1/RE1+1/(rpi1+RSB)+1/ro1+gm1*rpi1/(rpi1+RSB)  )/(   1/RE1+1/(rpi1+RSB) ) 
%ZO1 = 1/(1/ZX+1/RC1)

%%% Bypass capacitor behaves like a short circuit (equivalent to RE = 0) - for medium and higher frequencies
%RE1=0
ZI1 = 1/(1/RB+1/(((ro1+RC1+RE1)*(rpi1+RE1)+gm1*RE1*ro1*rpi1 - RE1^2)/(ro1+RC1+RE1)));
ZO1 = 1/(1/ro1+1/RC1);

%%%%%%%%%%%ouput stage

printf("\n\n\nOutput stage\n\n");
BFP = 227.3;
VAFP = 37.2;
RE2 = 100;
VEBON2 = 0.7;

%OP2
VI2 = VO1;
IE2 = (VCC-VEBON2-VI2)/RE2;
IC2 = BFP/(BFP+1)*IE2;
VO2 = VCC - RE2*IE2;
VEC2=VO2;                           


%%%%%%%%%%%%%%%%%%%%%%%% Incremental analysis for medium frequencies (capacitor as short circuit)
gm2 = IC2/VT;
go2 = IC2/VAFP;
gpi2 = gm2/BFP;
ge2 = 1/RE2;

AV2 = gm2/(gm2+gpi2+go2+ge2);
AV2_DB = 20*log10(abs(AV2));
ZI2 = (gm2+gpi2+go2+ge2)/gpi2/(gpi2+go2+ge2);
ZO2 = 1/(gm2+gpi2+go2+ge2);


%total
gB = 1/(1/gpi2+ZO1);
AV = (gB+gm2/gpi2*gB)/(gB+ge2+go2+gm2/gpi2*gB)*AV1;
AV_DB = 20*log10(abs(AV));
%ZI=ZI1;                                 % ZI1 e indiferente a presenca do output stage
%ZO=1/(go2+gm2/gpi2*gB+ge2+gB);

%Stage 1
%%%%%%%%%%%%%%%%%%%% OP analysis
printf("op1_TAB\n")
printf("IC = %f\nVCE = %f",IC1 , VCE1)
printf("\nop1_END\n\n")

%%%%%%%%%%%%%%% Gain, input impedance and output impedance

printf("Stage1_TAB\n")
printf("AV1 = %f\nZI1 = %f\nZO1 = %f",AV1, ZI1, ZO1)
printf("\nStage1_END\n\n")


%Stage 2
%%%%%%%%%%%%%%%%%%%% OP analysis
printf("op2_TAB\n")
printf("IC = %f\nVEC = %f",IC2 , VEC2)
printf("\nop2_END\n\n")

%%%%%%%%%%%%%%% Gain, input impedance and output impedance for the output stage

printf("Stage2_TAB\n")
printf("AV2 = %f\nZI2 = %f\nZO2 = %f",AV2, ZI2, ZO2)
printf("\nStage2_END\n\n")



%%%%% Plot of the total frequency response (for medium frequencies)
f=logspace(1, 8, 70);

figure
semilogx(f, AV_DB)
title("Frequency response")
xlabel ("Frequency (Hz)");
ylabel ("Vo(f)/Vi(f)");
print ("Octave_t4.eps", "-depsc");
printf ("Octave_t4_FIG")