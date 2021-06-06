R1=1e3;
C1=220e-9;

R2=1e3;
C2=220e-9;

R3=1e3;
R4=200e3;


%%%%%%%%%%Frequency response

f=logspace(1, 8, 70);
AV_DB = zeros(1, length(f));
AV_Phase = zeros(1, length(f));

for i=1:length(f)

	Z1 = 1/(j*2*pi*f(i)*C1);
	Z2 = 1/(j*2*pi*f(i)*C2);

	AV_DB(i) = 20*log10(abs((R1/(R1+Z1))*(1+R4/R3)*(Z2/(Z2+R2))));
	AV_Phase(i) = angle((R1/(R1+Z1))*(1+R4/R3)*(Z2/(Z2+R2)));
endfor

global pp = spline(f, AV_DB);

function gain = fr(x)
	global pp;
	gain = -ppval(pp, x);
endfunction

fmax=fminbnd(@fr,100,100000);

global AVcutoff= -fr(fmax)-3;

function gain2 = fr2(x)
	global AVcutoff;
	global pp;
	gain2 = ppval(pp, x)-AVcutoff;
endfunction

% Low cutoff frequency
fL=fzero(@fr2, [200, fmax]);

% High cutoff frequency
fH=fzero(@fr2, [fmax, 2000]);

% Central frequency
centralf=sqrt(fL*fH);


printf("Freq_TAB\n")
printf("lowercutoff = %f\nuppercutoff = %f\nfc = %f\n", fL, fH, centralf)
printf("Freq_END\n\n")

%%%%%%%%%%% Gain at the central frequency
% Estava aqui '-yeah(centralf);'. Eu mudei para '-fr(centralf);'?
AVcentralf = -fr(centralf);
AVlinear = 10^(AVcentralf/20);

% Introduzi isto.
printf("Gain_TAB\n")
printf("gain(dB) = %f\ngain(linear) = %f\n", AVcentralf, AVlinear)
printf("Gain_END\n\n")
% Introduzi isto.

%%%%%%%%%%% Imput impedance at the central frequency

ZC1 = 1/(j*2*pi*centralf*C1);

ZI = abs(ZC1 + R1);

%%%%%%%%%%% Output impedance at the central frequency

ZC2 = 1/(j*2*pi*centralf*C2); 

ZO = abs(1/((1/R2)+(1/ZC2)));


printf("Imp_TAB\n")
printf("$Z_{in}$ = %f\n$Z_{out}$ = %f\n", ZI, ZO)
printf("Imp_END\n\n")


figure
semilogx(f, AV_DB)
title("Frequency response")
xlabel ("Frequency (Hz)");
ylabel ("Vo(f)/Vi(f)");
print ("Octave_t5.eps", "-depsc");
printf ("Octave_t5_FIG\n")

figure
semilogx(f, AV_Phase)
title("Phase")
xlabel ("Frequency (Hz)");
ylabel ("Phase");
print ("Octave_t5p.eps", "-depsc");
printf ("Octave_t5p_FIG\n")
