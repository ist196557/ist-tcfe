R=16.6e3;
C=25e-6;

Is = 1e-14;
VT = 25e-3;

%Taken from ngspice simulation
vON=6.000010e-01;

r_d = 1*VT/Is/exp(vON/1/VT);

A=230*(1/15);
t=linspace(20e-3, 60e-3, 1000);
f=50;
T=1/f;
w=2*pi*f;
vS = A * cos(w*t);

vAfterBridge = zeros(1, length(t));
vC_DC=0;

vC = zeros(1, length(t));
vOutput = zeros(1, length(t));

tOFF = 1/w * atan(1/w/R/C);
%tOFF = 0.02004321060577046;
%tOFF = -0.009956478960942321;

for i=1:length(t)
  if(vS(i) - vON >=0)
    vAfterBridge(i) = vS(i) - 2*vON;
  else
    vAfterBridge(i) = -vS(i) - 2*vON;
  endif 
endfor

vOnexp = (A*cos(w*tOFF)-2*vON)*exp(-(t-tOFF)/R/C);
vOnexp2 = (A*cos(w*tOFF)-2*vON)*exp(-(t-(tOFF+(T/2)))/R/C);
vOnexp3 = (A*cos(w*tOFF)-2*vON)*exp(-(t-(tOFF+2*(T/2)))/R/C);
vOnexp4 = (A*cos(w*tOFF)-2*vON)*exp(-(t-(tOFF+3*(T/2)))/R/C);
vOnexp5 = (A*cos(w*tOFF)-2*vON)*exp(-(t-(tOFF+4*(T/2)))/R/C);
vOnexp6 = (A*cos(w*tOFF)-2*vON)*exp(-(t-(tOFF+5*(T/2)))/R/C);

 for i=1:length(t)
if (tOFF < t(i) && t(i) < tOFF+(T/2) && vOnexp(i)> vAfterBridge(i))
vC(i) = vOnexp(i);
elseif (tOFF+(T/2) < t(i) && t(i) < tOFF+2*(T/2) && vOnexp2(i)> vAfterBridge(i))
vC(i) = vOnexp2(i);
elseif (tOFF+2*(T/2) < t(i) && t(i) < tOFF+3*(T/2) && vOnexp3(i)> vAfterBridge(i))
vC(i) = vOnexp3(i);
elseif (tOFF+3*(T/2) < t(i) && t(i) < tOFF+4*(T/2) && vOnexp4(i)> vAfterBridge(i))
vC(i) = vOnexp4(i);
elseif (tOFF+4*(T/2) < t(i) && t(i) < tOFF+5*(T/2) && vOnexp5(i)> vAfterBridge(i))
vC(i) = vOnexp5(i);
elseif (tOFF+5*(T/2) < t(i) && t(i) < tOFF+6*(T/2) && vOnexp6(i)> vAfterBridge(i))
vC(i) = vOnexp6(i);
else
vC(i) = abs(vAfterBridge(i));
endif
endfor

for i=1:length(t)
vC_DC+=vC(i);
endfor
vC_DC/=length(t);

for i=1:length(t)
if(t(i)>tOFF)
    vOutput(i) = 20*vON + ((20*r_d)/(20*r_d+R))*(vC(i)-vC_DC);
else
    vOutput(i) = 20*vON;
endif
endfor

figure
plot(t*1000, vC)
hold
plot(t*1000, vOutput)
title("AC/DC Converter")
legend("vC","vOutput");
print ("Octave_t3.eps", "-depsc");
printf("Octave_t3_FIG\n");

figure
plot(t*1000,vOutput-12)
title("AC/DC Converter")
legend("vOutput-12");
print ("Octave_t3_2.eps", "-depsc");
printf("Octave_t3_2_FIG\n");

